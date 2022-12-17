pkgbase=sac-core
pkgname=(sac-core sac-gui)
pkgver=10.8.28
pkgrel=5
pkgdesc='Thales/Gemalto SafeNet Authentication Client for eToken 5110/5300 & IDPrime'
url='https://cpl.thalesgroup.com/access-management/security-applications/authentication-client-token-management'
arch=(x86_64)
depends=(ccid pcsclite)
optdepends=('sac-core-legacy: Support for eToken 32K/64K (CardOS 4.2)')
license=(custom)
source=('https://installer.id.ee/media/etoken/Linux_SAC%2010.8.28%20GA%20Build.zip'
        eToken.conf
        safenetauthenticationclient.service)
sha256sums=('6e1f9307b6460cc87d1b895c3edbfb99cd1778686609f30caab96ab7218821a0'
            '85b850b820610e029428e577ca0e48f6fb7b4148ae8d702ca20b191963046c6c'
            'eb8b4e105d8b75f11e4b83ca6c4a605f781f50cc0f0405a5d1deccb5580fd055')
#validpgpkeys=('B37EBA84D2EB0C786F91EEF77F8AA801285DEE57')

_dir="SAC 10.8.28 GA Build"
_rn_pdf="007-013841-003-SafeNet Authentication Client_ 10.8_Linux_GA_Release Notes_Rev A.pdf"
_ag_pdf="007-013842-002_SafeNet Authentication Client_10.8_Linux_GA_Administrator_Guide_Rev A.pdf"
_ug_pdf="007-013843-002_SafeNet Authentication Client_10.8_Linux_GA_User_Guide_Rev A.pdf"

prepare() {
  #ar x "$_dir/Installation/withoutUI/Ubuntu-2004/safenetauthenticationclient-core_${pkgver}_amd64.deb"
  ar x "$_dir/Installation/Standard/Ubuntu-2004/safenetauthenticationclient_${pkgver}_amd64.deb"
  bsdtar -xf data.tar.xz
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
