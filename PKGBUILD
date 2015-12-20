# $Id: PKGBUILD 166944 2012-09-22 20:46:26Z tomegun $
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Ike Devolder <ike.devolder@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Maintainer: GordonGR <gordongr@freemail.gr>

pkgname=lib32-taglib
_pkgname=taglib
pkgver=1.10
pkgrel=2
pkgdesc="A Library for reading and editing the meta-data of several popular audio formats, lib32"
arch=('x86_64')
url="http://developer.kde.org/~wheeler/taglib.html"
license=('LGPL' 'MPL')
depends=($_pkgname 'lib32-zlib')
makedepends=('cmake')
options=('!libtool')
source=("http://taglib.github.io/releases/$_pkgname-$pkgver.tar.gz")
md5sums=('5b4441a15423b046dd92a096e09ea22c')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${_pkgname}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DWITH_MP4=ON \
    -DWITH_ASF=ON \
    -DCARCH="i686" \
    -DCHOST="i686-pc-linux-gnu" \
    -DCMAKE_C_FLAGS="-m32 -mtune=generic -O2 -pipe -fstack-protector --param=ssp-buffer-size=4 -D_FORTIFY_SOURCE=2" \
    -DCMAKE_CXX_FLAGS="-m32 -mtune=generic -O2 -pipe -fstack-protector --param=ssp-buffer-size=4 -D_FORTIFY_SOURCE=2" \
    -DLIB_INSTALL_DIR:PATH="/usr/lib32"

  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
  cd "$pkgdir/usr"
  rm -rf {bin,include,share}/
  mv lib/ lib32/
}
