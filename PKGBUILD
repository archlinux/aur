# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: GordonGR <gordongr@freemail.gr>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Ike Devolder <ike.devolder@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

_pkgname=taglib
pkgname=lib32-taglib
pkgver=1.13.1
pkgrel=1
pkgdesc="A Library for reading and editing the meta-data of several popular audio formats (32 bit)"
arch=('x86_64')
url="https://developer.kde.org/~wheeler/taglib.html"
license=('LGPL' 'MPL')
depends=($_pkgname 'lib32-zlib' 'lib32-gcc-libs')
makedepends=('cmake')
source=("https://taglib.github.io/releases/$_pkgname-$pkgver.tar.gz")
md5sums=('2fe6089da73ad414aa1b982b83415362')
sha256sums=('c8da2b10f1bfec2cd7dbfcd33f4a2338db0765d851a50583d410bacf055cfd0b')

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
