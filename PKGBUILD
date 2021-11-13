# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Ivan Naumeiko <Ivan.Naumeiko  AT gmail DOT com>

pkgname=coolreader
pkgver=3.2.59
pkgrel=2
pkgdesc='Fast and small XML/CSS based eBook reader'
arch=('x86_64')
url='https://github.com/buggins/coolreader'
license=('GPL2')
depends=('fribidi' 'hicolor-icon-theme' 'libunibreak' 'qt5-base')
makedepends=('cmake' 'ninja' 'qt5-tools')
source=("https://github.com/buggins/coolreader/archive/cr$pkgver/$pkgname-$pkgver.tar.gz"
        'cr3.appdata.xml')
sha256sums=('54253ce3da8f3575d7e64f0afd3d2e9d369ca4e785584cfad4462eead1b8f51e'
            '9d868cfd61b686b5a398797819367f16d7a65f1f5420441fb34c8d39236f7382')

prepare() {
  sed -i 's|src/desktop/cr3.png DESTINATION share/pixmaps|src/desktop/cr3.png DESTINATION share/icons/hicolor/32x32/apps|
          s|src/desktop/cr3.xpm DESTINATION share/pixmaps|src/icons/cr3.png DESTINATION share/icons/hicolor/48x48/apps|' $pkgname-cr$pkgver/cr3qt/CMakeLists.txt
}

build() {
  cmake -S $pkgname-cr$pkgver -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DGUI=QT5 \
    -DMAX_IMAGE_SCALE_MUL=2 \
    -DDOC_DATA_COMPRESSION_LEVEL=3 \
    -DDOC_BUFFER_SIZE=0x140000
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 cr3.appdata.xml "$pkgdir/usr/share/metainfo/cr3.appdata.xml"
}
