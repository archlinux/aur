# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: GordonGR <gordongr@freemail.gr>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Ike Devolder <ike.devolder@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

_pkgname=taglib
pkgname=lib32-taglib
pkgver=1.13
pkgrel=2
pkgdesc="A Library for reading and editing the meta-data of several popular audio formats (32 bit)"
arch=('x86_64')
url="https://developer.kde.org/~wheeler/taglib.html"
license=('LGPL' 'MPL')
depends=($_pkgname 'lib32-zlib' 'lib32-gcc-libs')
makedepends=('cmake')
source=("https://taglib.github.io/releases/$_pkgname-$pkgver.tar.gz")
md5sums=('0b75619b67b9149cfcbbe5c127df6395')
sha256sums=('58f08b4db3dc31ed152c04896ee9172d22052bc7ef12888028c01d8b1d60ade0')

prepare() {
  mkdir -p build
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd build
  cmake ../${_pkgname}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib32 \
    -DBUILD_SHARED_LIBS=ON
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install

  cd "$pkgdir/usr"
  rm -rf {include,share}/
  mv bin/taglib-config{,-32}
}
