# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: GordonGR <gordongr@freemail.gr>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Ike Devolder <ike.devolder@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

_pkgname=taglib
pkgname=lib32-taglib
pkgver=2.0
pkgrel=2
pkgdesc="A Library for reading and editing the meta-data of several popular audio formats (32 bit)"
arch=('x86_64')
url="https://developer.kde.org/~wheeler/taglib.html"
license=('LGPL' 'MPL')
depends=($_pkgname 'lib32-zlib' 'lib32-gcc-libs')
makedepends=('cmake' 'utf8cpp')
source=("https://taglib.github.io/releases/$_pkgname-$pkgver.tar.gz"
         https://github.com/taglib/taglib/commit/dfef09f1.patch)
md5sums=('1826bf7e8486246a23fd98579f666413'
         '8749e20e9df522f744b4b44b1a95d2bd')
sha256sums=('e36ea877a6370810b97d84cf8f72b1e4ed205149ab3ac8232d44c850f38a2859'
            'bef9bf3cb5cb342e339612ca9fb9d9020ddd3307af15db0402507e7dcbcf35a2')

prepare() {
  mkdir -p build

  patch -d $_pkgname-$pkgver -Rp1 < dfef09f1.patch # https://github.com/taglib/taglib/issues/1211
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
