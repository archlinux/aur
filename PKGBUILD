# Maintainer: Michael Yang <ohmyarchlinux@gmail.com>

pkgname=libgo
pkgver=2.6
pkgrel=2
pkgdesc="Go-style concurrency in C++11"
arch=('i686' 'x86_64')
url="https://github.com/yyzybb537/libgo"
license=('MIT')
depends=('boost')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/yyzybb537/libgo/archive/v${pkgver}.tar.gz" "0001-build-with-clang.patch")
sha512sums=('84610109a088ec100045292183d7eb7cc0ea6de16e583b9a4692d20bad0b63ab0c6206bc3f718d1afb13e4b70b139b279faa1b22c6e55610235580096c536820' '63aeab3cff2087209b607177ac76c52acc59de9b678c7151a28e18e91547c08b936e8822fb7b99fd5af5f8257ca46b13faeb5b94b0934b3280c2e173194e812b')

prepare() {
  mkdir -p build
}

build() {
  cd ${pkgname}-${pkgver}
  patch -p1 < ../0001-build-with-clang.patch
  cd ../build
  cmake ../${pkgname}-${pkgver} \
    -DENABLE_BOOST_CONTEXT=ON \
    -DENABLE_BOOST_COROUTINE=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  cd ${pkgname}-${pkgver}
  install -Dm644 LICENSE  ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
