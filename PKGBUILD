pkgbase=sac-core
pkgname=(sac-core sac-gui)
pkgver=10.9.6885
pkgrel=1
pkgdesc='Thales/Gemalto SafeNet Authentication Client for eToken 5110/5300 & IDPrime'
url='https://cpl.thalesgroup.com/access-management/security-applications/authentication-client-token-management'
arch=(x86_64)
depends=(ccid pcsclite)
optdepends=('sac-core-legacy: Support for eToken 32K/64K (CardOS 4.2)')
license=(custom)
source=('https://www.globalsign.com/en/safenet-drivers/USB/10.9/GlobalSign-SAC-Linux-Ubuntu-24.04.4-v10.9.zip'
        eToken.conf
        safenetauthenticationclient.service)
sha256sums=('c076c2ecb3842478e431ba81e1688f8c6386d7a374780c055047d2c9930cf428'
            '85b850b820610e029428e577ca0e48f6fb7b4148ae8d702ca20b191963046c6c'
            'eb8b4e105d8b75f11e4b83ca6c4a605f781f50cc0f0405a5d1deccb5580fd055')
validpgpkeys=('B37EBA84D2EB0C786F91EEF77F8AA801285DEE57')

_dir="GlobalSign SAC Linux Ubuntu 24.04.4 v10.9/GlobalSign SAC Linux Ubuntu 24.04.4 v10.9 Standard/GlobalSign SAC Linux Ubuntu 24.04.4 v10.9"
_ug_pdf="$_dir/007-013843-003-SafeNet Authentication Client_10.9_R1_Linux_GA_User Guide_Rev B.pdf"

_err() {
    printf '\e[1;31mError:\e[m %s\n' "$*" >&2
}

prepare() {
  # work around .zip containing directories set to 0555
  find -type d -exec chmod u+w {} \;

  _key="$_dir/GPG-KEY-SafenetAuthenticationClient.txt"
  _deb="$_dir/610-013349-004_RevB_safenetauthenticationclient_${pkgver}_amd64.deb"
  _deb_asc="$_dir/safenetauthenticationclient_10.9.6885_amd64.deb.asc"
  #_deb="$_dir/Installation/withoutUI/Ubuntu-2004/safenetauthenticationclient-core_${pkgver}_amd64.deb"

  if (( ! SKIPPGPCHECK )); then
    echo "Verifying PGP signature of '${_deb}'..."
    # sqv --keyring="$_key" --signature-file="$_deb_asc" "$_deb"
    if ! _out=$(gpg --batch --status-fd 1 --trust-model always \
                    --auto-key-retrieve --verify "$_deb_asc" "$_deb" 2>&1); then
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
  install -Dm644 "$_ug_pdf" \
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
