# Maintainer: Angelo Theodorou <encelo at gmail dot com>

pkgname=nctiledviewer-git
pkgver=r13.1027c4a
pkgrel=1
pkgdesc="A viewer for Tiled maps made with the nCine"
arch=('i686' 'x86_64')
url="http://ncine.github.io"
license=('MIT')
depends=('ncine')
makedepends=('git' 'cmake')
conflicts=('nctiledviewer')
provides=('nctiledviewer')
options=(!strip)
source=('git+https://github.com/nCine/ncTiledViewer')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/ncTiledViewer"
  ( set -o pipefail
    git describe --tags --long --exact-match 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  git clone https://github.com/nCine/ncTiledViewer-data || git -C ncTiledViewer-data pull
}

build() {
  mkdir -p build && cd build

  cmake ../ncTiledViewer\
        -DCMAKE_BUILD_TYPE=Release\
        -DCMAKE_PREFIX_PATH=/usr/lib/cmake/nCine\
        -DNCPROJECT_BUILD_ANDROID=OFF\
        -DNCPROJECT_STRIP_BINARIES=ON\
        -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C build DESTDIR=$pkgdir PREFIX= install
  install -Dm0644 $srcdir/ncTiledViewer/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
