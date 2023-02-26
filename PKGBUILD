# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Esa lakaniemi <esalaka@gmail.com>

_pkgbasename=sdl_ttf
pkgname=lib32-$_pkgbasename
pkgver=2.0.11
pkgrel=8
pkgdesc="A library that allows you to use TrueType fonts in your SDL applications (32-bit)"
url="https://www.libsdl.org/projects/SDL_ttf/"
arch=(x86_64)
license=(custom)
depends=(lib32-sdl lib32-freetype2 $_pkgbasename)
source=(https://www.libsdl.org/projects/SDL_ttf/release/SDL_ttf-$pkgver.tar.gz
        freetype-pkgconfig.patch
        bug1433.patch)
sha256sums=('724cd895ecf4da319a3ef164892b72078bd92632a5d812111261cde248ebcdb7'
            '87412f614b97b4724cb4845db882f07c15caf098dee57a856d6dbae0f58de80d'
            '4baea703454b9bca9498a920485552f1b8489a5007f8f1366080b14a4cd74c90')

prepare() {
  cd SDL_ttf-$pkgver

  # Fix FS#28674
  patch -Ni ../bug1433.patch

  # Fix build with FreeType 2.9.1
  patch -Np1 -i ../freetype-pkgconfig.patch

  touch NEWS README AUTHORS ChangeLog
  autoreconf -vi
}

build() {
  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd SDL_ttf-$pkgver
  ./configure --prefix=/usr --disable-static --libdir=/usr/lib32
  make
}

package() {
  cd SDL_ttf-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 COPYING
  rm -rf "$pkgdir/usr/include"
}

# vim: sw=2:ts=2 et:
