# Maintainer: Alex J. Malozemoff <amaloz@galois.com>
pkgname=sealcrypto
pkgver=3.1.0
pkgrel=2
pkgdesc='Simple Encrypted Arithmetic Library'
arch=('x86_64')
url="https://sealcrypto.org/"
license=('MIT')
makedepends=('cmake')
source=("https://github.com/Microsoft/SEAL/archive/${pkgver}.tar.gz")
sha1sums=('09a066ba97c58f2abd5d4e5d0955d29224d563e5')
provides=('sealcrypto')

build() {
  cd ${srcdir}
  tar xf ${pkgver}.tar.gz
  cd SEAL-${pkgver}/src
  cmake . -DSEAL_USE_MSGSL=OFF
  make
}

package() {
  cd ${srcdir}/SEAL-${pkgver}
  mkdir -p ${pkgdir}/usr/lib
  mkdir -p ${pkgdir}/usr/include/seal/util
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  cp lib/libseal.a ${pkgdir}/usr/lib
  sed -i 's/#include "\(.*\)"/#include <\1>/g' src/seal/*.h
  cp src/seal/*.h ${pkgdir}/usr/include/seal
  sed -i 's/#include "\(.*\)"/#include <\1>/g' src/seal/util/*.h
  cp src/seal/util/*.h ${pkgdir}/usr/include/seal/util
  cp LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
}
