# Maintainer: Graham Edgecombe <graham@grahamedgecombe.com>
pkgname=openrct2-git
pkgver=r630.835835b
pkgrel=1
pkgdesc="Open source clone of RollerCoaster Tycoon 2"
arch=('i686' 'x86_64')
url="https://openrct2.com"
license=('GPL3')
depends=('wine' 'mingw-w64-sdl2')
makedepends=('git' 'cmake' 'mingw-w64-gcc')
options=('!buildflags')
install=openrct2.install
source=("$pkgname"::'git://github.com/IntelOrca/OpenRCT2.git'
        'openrct2'
        'openrct2.desktop')
md5sums=('SKIP'
         '58efc9b12751ae8a4ca62ba7fd48e945'
         'f3623006456c3c25878371a89873c8db')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  cmake -DCMAKE_TOOLCHAIN_FILE=CMakeLists_mingw.txt -DCMAKE_BUILD_TYPE=Debug .
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm644 openrct2.dll "$pkgdir/usr/lib/openrct2/openrct2.dll"
  install -Dm755 openrct2.exe "$pkgdir/usr/lib/openrct2/openrct2.exe"
  install -Dm755 "$srcdir/openrct2" "$pkgdir/usr/bin/openrct2"
  install -Dm644 "$srcdir/openrct2.desktop" "$pkgdir/usr/share/applications/openrct2.desktop"

  # For Wine to find the SDL2.dll file it needs to be in the same
  # directory as openrct2.exe, so we symlink it in place. We don't use
  # $CARCH here because on x86_64 OpenRCT2 is compiled with -m32,
  # therefore we always want to use the i686 DLL. OpenRCT2 relies on
  # Wine's WoW64 support to actually run on x86_64 machines.
  ln -s /usr/i686-w64-mingw32/bin/SDL2.dll "$pkgdir/usr/lib/openrct2"
}
