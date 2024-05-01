# Maintainer: Masaki Waga <masakiwaga@gmail.com>
# Maintainer: Alex J. Malozemoff <amaloz@galois.com>
# Maintainer: Benjamin Cheng <ben@bcheng.me>
pkgname=sealcrypto
pkgver=4.1.1
pkgrel=2
pkgdesc='Microsoft library for fully homomorphic encryption'
arch=('x86_64')
url="https://www.microsoft.com/en-us/research/group/cryptography-research/"
license=('MIT')
makedepends=('cmake')
source=("https://github.com/Microsoft/SEAL/archive/${pkgver}.tar.gz")
sha256sums=('af9bf0f0daccda2a8b7f344f13a5692e0ee6a45fea88478b2b90c35648bf2672')

provides=('sealcrypto')

build() {
  cd ${srcdir}
  tar xf ${pkgver}.tar.gz
  cmake -B build -S SEAL-${pkgver} \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_C_FLAGS="-ffat-lto-objects" \
    -DCMAKE_CXX_FLAGS="-ffat-lto-objects" # We need LTO fat objects: https://archlinux.org/todo/lto-fat-objects/
  cmake --build build
}

package() {
  install -m644 -D ${srcdir}/SEAL-${pkgver}/LICENSE \
	${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  DESTDIR="${pkgdir}" cmake --install build
}
