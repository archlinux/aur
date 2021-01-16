pkgname=sac-core
pkgver=10.7.77
pkgrel=1
pkgdesc='SafeNet Authentication Client for eToken 5110/5300 & IDPrime (core package with no GUI tools)'
url='https://cpl.thalesgroup.com/access-management/security-applications/authentication-client-token-management'
arch=(x86_64)
depends=(pcsclite)
optdepends=(
  'sac-core-legacy: Support for eToken 32K/64K (CardOS 4.2)'
)
license=(custom)
source=('https://installer.id.ee/media/etoken/SAC%2010.7%20Linux.zip'
        eToken.conf)
sha256sums=('15c55b1faec11c460bd1b5a303a92b1667171d615b20967dccc753fcf8026051'
            '85b850b820610e029428e577ca0e48f6fb7b4148ae8d702ca20b191963046c6c')

prepare() {
  ar x "GA - Build 77/Installation/withoutUI/DEB/safenetauthenticationclient-core_${pkgver}_amd64.deb"
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

  install -Dm644 eToken.conf "$pkgdir"/etc/eToken.conf
}

# vim: ts=2:sw=2:et:
