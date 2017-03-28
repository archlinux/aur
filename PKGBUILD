# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=teeuniverse
pkgver=0.2.5
pkgrel=1
pkgdesc="Enhanced map editor for DDNet, Teeworlds, and similar games"
arch=('i686' 'x86_64')
url="https://teeuniverse.net/"
license=('AGPL' 'CC-BY-SA' 'custom')
depends=('harfbuzz-icu' 'sdl2' 'glu' 'desktop-file-utils')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/teeuniverse/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('b4f94041e057ba9469746547fe9722cc')

build() {
  cd $pkgname-$pkgver
  
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
  cd $pkgname-$pkgver/build
  make DESTDIR="$pkgdir/" install
  
    # keep all licenses in /usr/share/licenses
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"
  install -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
  install -m644 ../LICENSE_DDNET "$pkgdir/usr/share/licenses/$pkgname/"
  install -m644 ../LICENSE_TEEWORLDS "$pkgdir/usr/share/licenses/$pkgname/"
  mv "$pkgdir/usr/share/$pkgname/fonts/LICENSE_DEJAVU" \
     "$pkgdir/usr/share/licenses/$pkgname/"
  mv "$pkgdir/usr/share/$pkgname/fonts/LICENSE_OFL.txt" \
     "$pkgdir/usr/share/licenses/$pkgname/"
  mv "$pkgdir/usr/share/$pkgname/languages/LICENSE" \
     "$pkgdir/usr/share/licenses/$pkgname/LICENSE_LANGUAGE"
}
