# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Ivan Naumeiko <Ivan.Naumeiko  AT gmail DOT com>

pkgname=coolreader
pkgver=3.2.49
pkgrel=1
pkgdesc="Fast and small XML/CSS based eBook reader"
arch=(x86_64)
url="https://github.com/buggins/coolreader"
license=(GPL2)
depends=(hicolor-icon-theme qt5-base)
makedepends=(cmake qt5-tools)
source=(https://github.com/buggins/coolreader/archive/cr$pkgver/$pkgname-$pkgver.tar.gz
        cr3.appdata.xml)
sha256sums=('7354bfc78d1b2899dcb35ae73b19ab7a622bedc2d6a9d62831f249537590bfc6'
            '9d868cfd61b686b5a398797819367f16d7a65f1f5420441fb34c8d39236f7382')

prepare() {
  [[ -d build ]] || mkdir build

  cd $pkgname-cr$pkgver
  sed -i 's|src/desktop/cr3.png DESTINATION share/pixmaps|src/desktop/cr3.png DESTINATION share/icons/hicolor/32x32/apps|
          s|src/desktop/cr3.xpm DESTINATION share/pixmaps|src/icons/cr3.png DESTINATION share/icons/hicolor/48x48/apps|' cr3qt/CMakeLists.txt
}

build() {
  cd build
  cmake -G "Unix Makefiles" ../$pkgname-cr$pkgver/ \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DGUI=QT5 \
    -DMAX_IMAGE_SCALE_MUL=2 \
    -DDOC_DATA_COMPRESSION_LEVEL=3 \
    -DDOC_BUFFER_SIZE=0x140000
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -Dm644 ../cr3.appdata.xml "$pkgdir/usr/share/metainfo/cr3.appdata.xml"
}
