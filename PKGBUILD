# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=teeuniverse
pkgver=0.2.3
pkgrel=1
pkgdesc="Enhanced map editor for DDNet, Teeworlds, and similar games"
arch=('i686' 'x86_64')
url="https://teeuniverse.net/"
license=('AGPL' 'custom')
depends=('harfbuzz-icu' 'sdl2' 'glu' 'desktop-file-utils')
makedepends=('cmake' 'gendesk' 'imagemagick')
source=("$pkgname-$pkgver.tar.gz::https://github.com/teeuniverse/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('a8a3a85899504e15512e38e4953eec8e')

prepare() {
  gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" \
    --exec 'teeuniverse_editor' --name 'teeuniverse'      \
    --categories 'Game;ArcadeGame;'
}

build() {
  cd "$pkgname-$pkgver"
  
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build
  
  cmake ..                        \
    -DCMAKE_BUILD_TYPE='Release'  \
    -DCMAKE_INSTALL_PREFIX='/usr'
  
  make
}

package() {
  cd "$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir/" install
  
  install -Dm644 "$srcdir/$pkgname.desktop"   \
                     "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "../datasrc/images/logo.png" \
                     "$pkgdir/usr/share/pixmaps/$pkgname.png"
  
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"
  install -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
  install -m644 ../LICENSE_DDNET "$pkgdir/usr/share/licenses/$pkgname/"
  install -m644 ../LICENSE_TEEWORLDS "$pkgdir/usr/share/licenses/$pkgname/"
}
