pkgbase=sac-core
pkgname=(sac-core sac-gui)
pkgver=10.8.1050
pkgrel=1
pkgdesc='Thales/Gemalto SafeNet Authentication Client for eToken 5110/5300 & IDPrime'
url='https://cpl.thalesgroup.com/access-management/security-applications/authentication-client-token-management'
arch=(x86_64)
depends=(ccid pcsclite)
optdepends=('sac-core-legacy: Support for eToken 32K/64K (CardOS 4.2)')
license=(custom)
source=('https://www.dropbox.com/s/q66bhnjoq0xzuas/SAC_Linux_10.8.105_R1_GA.zip?dl=0'
        eToken.conf
        safenetauthenticationclient.service)
sha256sums=('18ecac33e8a1ddb894c23423074592ffd77a272a7255b519d20992662a5c699e'
            '85b850b820610e029428e577ca0e48f6fb7b4148ae8d702ca20b191963046c6c'
            'eb8b4e105d8b75f11e4b83ca6c4a605f781f50cc0f0405a5d1deccb5580fd055')
validpgpkeys=('B37EBA84D2EB0C786F91EEF77F8AA801285DEE57')

_dir="SAC Linux 10.8.1050 R1 GA"
_rn_pdf="007-013841-004-SafeNet Authentication Client_10.8_R1_Linux_GA_Release_Notes.pdf"
_ag_pdf="007-013842-002_SafeNet Authentication Client_10.8_R1_Linux_GA_Administrator_Guide_Rev C.pdf"
_ug_pdf="007-013843-002_SafeNet Authentication Client_10.8_R1_Linux_GA_User_Guide_Rev C.pdf"

_err() {
    printf '\e[1;31mError:\e[m %s\n' "$*" >&2
}

prepare() {
  _key="$_dir/Installation/Standard/Ubuntu-2204/GPG-KEY-SafenetAuthenticationClient.txt"
  _deb="$_dir/Installation/Standard/Ubuntu-2204/safenetauthenticationclient_${pkgver}_amd64.deb"
  #_deb="$_dir/Installation/withoutUI/Ubuntu-2004/safenetauthenticationclient-core_${pkgver}_amd64.deb"

  if (( ! SKIPPGPCHECK )); then
    echo "Verifying PGP signature of '${_deb}'..."
    # gpg --import "$_key"
    if ! _out=$(gpg --batch --status-fd 1 --trust-model always \
                    --auto-key-retrieve --verify "$_deb.asc" "$_deb" 2>&1); then
        _err "PGP signature verification failed"
        echo "$_out" | grep -v "^\\[GNUPG:\\]"
        return 1
    elif ! grep -qs "^\\[GNUPG:\\] VALIDSIG ${validpgpkeys[0]} " <<< "$_out"; then
        _err "PGP signature was not made by Thales"
        echo "$_out" | grep -v "^\\[GNUPG:\\]"
        return 1
    fi
  fi

  ar x "$_deb"
  bsdtar -xf data.tar.gz
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_sac-core() {
  pkgdesc+=' (core PKCS#11 modules)'

  # Install libraries
  cp -r etc "$pkgdir"/etc
  cp -r usr "$pkgdir"/usr

  # Create missing .so symlinks
  ldconfig -N -r "$pkgdir"

  # PKCS#11 modules -- Standard.deb already includes the symlinks
  #install -dm755 "$pkgdir"/usr/lib/pkcs11
  #ln -s ../libeToken.so "$pkgdir"/usr/lib/pkcs11/
  #ln -s ../libIDPrimePKCS11.so "$pkgdir"/usr/lib/pkcs11/

  # Legacy name for the eToken PKCS#11 module -- not creating it here, since
  # it's primarily associated with the old Alladin eToken and you should use
  # sac-core-legacy for that.
  #ln -s libeToken.so "$pkgdir"/usr/lib/libeTPkcs11.so
  #ln -s ../libeToken.so "$pkgdir"/usr/lib/pkcs11/libeTPkcs11.so

  # But the Standard.deb already includes the symlink, so remove it.
  rm "$pkgdir"/usr/lib/libeTPkcs11.so
  rm "$pkgdir"/usr/lib/pkcs11/libeTPkcs11.so

  # Documentation
  install -Dm644 "$_dir/Documentation/$_rn_pdf" \
                  "$pkgdir"/usr/share/doc/$pkgname/SAC_${pkgver%.*}_Linux_Release_Notes.pdf
  install -Dm644 "$_dir/Documentation/$_ag_pdf" \
                  "$pkgdir"/usr/share/doc/$pkgname/SAC_${pkgver%.*}_Linux_Administrator_Guide.pdf
  install -Dm644 "$_dir/Documentation/$_ug_pdf" \
                  "$pkgdir"/usr/share/doc/$pkgname/SAC_${pkgver%.*}_Linux_User_Guide.pdf

  # Disable the predefined 'software' slots that clutter the token list
  rm -f "$pkgdir"/etc/eToken.conf
  #install -Dm644 eToken.conf "$pkgdir"/etc/eToken.conf

  # Replace the SACSrv initscript
  # Note: I still don't have any idea what the service does.
  rm -rf "$pkgdir"/etc/init.d
  install -Dm644 safenetauthenticationclient.service \
                  "$pkgdir"/usr/lib/systemd/system/safenetauthenticationclient.service

  # Split out GUI files
  cd "$pkgdir"
  _pick gui etc/**
  _pick gui usr/bin/**
  _pick gui usr/lib/SAC/**
  _pick gui usr/lib/libIDPVSlotEngine*
  _pick gui usr/lib/libSAC*
  _pick gui usr/lib/systemd/**
  _pick gui usr/share/applications/**
  _pick gui usr/share/doc/$pkgname/*User_Guide.pdf
  _pick gui usr/share/eToken/**
  _pick gui usr/share/icons/**
}

package_sac-gui() {
  pkgdesc+=" (GUI tools)"
  depends=(gtk3 sac-core)
  mv gui/* "$pkgdir"
}

# vim: ts=2:sw=2:et:
