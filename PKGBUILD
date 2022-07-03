pkgname=sac-core
pkgver=10.8.28
pkgrel=1
pkgdesc='Thales/Gemalto SafeNet Authentication Client for eToken 5110/5300 & IDPrime (core package with no GUI tools)'
url='https://cpl.thalesgroup.com/access-management/security-applications/authentication-client-token-management'
arch=(x86_64)
depends=(openssl pcsclite)
optdepends=('sac-core-legacy: Support for eToken 32K/64K (CardOS 4.2)')
license=(custom)
source=('https://installer.id.ee/media/etoken/Linux_SAC%2010.8.28%20GA%20Build.zip'
        eToken.conf)
sha256sums=('6e1f9307b6460cc87d1b895c3edbfb99cd1778686609f30caab96ab7218821a0'
            '85b850b820610e029428e577ca0e48f6fb7b4148ae8d702ca20b191963046c6c')
#validpgpkeys=('B37EBA84D2EB0C786F91EEF77F8AA801285DEE57')

_dir="SAC 10.8.28 GA Build"
_rn_pdf="007-013841-003-SafeNet Authentication Client_ 10.8_Linux_GA_Release Notes_Rev A.pdf"
_ag_pdf="007-013842-002_SafeNet Authentication Client_10.8_Linux_GA_Administrator_Guide_Rev A.pdf"

prepare() {
  ar x "$_dir/Installation/withoutUI/Ubuntu-2004/safenetauthenticationclient-core_${pkgver}_amd64.deb"
  bsdtar -xf data.tar.xz
}

package() {
  # Install libraries
  install -dm755 "$pkgdir"/usr
  cp -r usr/lib "$pkgdir"/usr/lib

  # Create missing .so symlinks
  ldconfig -N -r "$pkgdir"

  # PKCS#11 modules
  install -dm755 "$pkgdir"/usr/lib/pkcs11
  ln -s ../libeToken.so "$pkgdir"/usr/lib/pkcs11/
  ln -s ../libIDPrimePKCS11.so "$pkgdir"/usr/lib/pkcs11/

  # Legacy name for the eToken PKCS#11 module -- not creating it here, since
  # it's primarily associated with the old Alladin eToken and you should use
  # sac-core-legacy for that.
  #ln -s libeToken.so "$pkgdir"/usr/lib/libeTPkcs11.so
  #ln -s ../libeToken.so "$pkgdir"/usr/lib/pkcs11/libeTPkcs11.so

  # Documentation -- user guide belongs to the GUI package
  install -Dm644 "$_dir/Documentation/$_rn_pdf" \
                  "$pkgdir"/usr/share/doc/$pkgname/SAC_${pkgver%.*}_Linux_Release_Notes.pdf
  install -Dm644 "$_dir/Documentation/$_ag_pdf" \
                  "$pkgdir"/usr/share/doc/$pkgname/SAC_${pkgver%.*}_Linux_Administrator_Guide.pdf

  #install -Dm644 eToken.conf "$pkgdir"/etc/eToken.conf
}

# vim: ts=2:sw=2:et:
