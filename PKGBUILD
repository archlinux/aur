# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=markmywords
pkgver=0.1.3
pkgrel=2
pkgdesc="Minimal Markdown editor"
arch=('x86_64')
url="https://github.com/voldyman/MarkMyWords"
license=(custom:MIT)
depends=('discount' 'gtksourceview3' 'webkit2gtk')
makedepends=('cmake' 'vala')
source=("$url/archive/v$pkgver/MarkMyWords-$pkgver.tar.gz"
        discount.patch
        appdata.patch)
sha256sums=('d7c0c09ef9dce842721a3e957336b77bd1ac157ef5866c56cc81ddc759fba4f0'
            'b62642e8034962ee726a44ad224e08b05b15f3790561c6fe6c21e96e447b096c'
            '3d1507a0f2c461eafbeff4750d4d95cf4d91e5bda12a95785a3fa156e9e7dbc0')

prepare() {
  [[ -d build ]] || mkdir build
  cd MarkMyWords-$pkgver
  patch -Np1 -i ../discount.patch
  patch -Np1 -i ../appdata.patch
  sed -i 's/string args\[\]/string[] args/' src/Main.vala
  sed -i 's|pixmaps|icons/hicolor/scalable/apps|' CMakeLists.txt
  sed -i 's/document-export/document-revert/' resources/toolbar.ui resources/headerbar.ui 
}

build() {
  cd build
  cmake -G "Unix Makefiles" ../MarkMyWords-$pkgver/ \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DGSETTINGS_LOCALINSTALL=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -Dm644 ../MarkMyWords-$pkgver/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
