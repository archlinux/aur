# Maintainer: Graham Edgecombe <graham@grahamedgecombe.com>
pkgname=openrct2-git
pkgver=r2942.8499d38
pkgrel=1
pkgdesc="Open source clone of RollerCoaster Tycoon 2"
arch=('i686' 'x86_64')
url="https://openrct2.com"
license=('GPL3')
depends=('wine' 'mingw-w64-sdl2' 'gtk-update-icon-cache' 'desktop-file-utils')
makedepends=('git' 'cmake' 'mingw-w64-gcc')
options=('!buildflags')
install=openrct2.install
source=("$pkgname"::'git://github.com/IntelOrca/OpenRCT2.git#branch=develop'
        'openrct2'
        'openrct2.desktop')
md5sums=('SKIP'
         'b750eaf997a27e981232b21a68fa868e'
         '035a407b940492c584c72f4f59f1bd69')

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

  # Standard OpenRCT2 distribution files.
  install -Dm644 openrct2.dll "$pkgdir/usr/share/openrct2/openrct2.dll"
  install -Dm755 openrct2.exe "$pkgdir/usr/share/openrct2/openrct2.exe"

  install -dm755 "$pkgdir/usr/share/openrct2/data/language"
  install -m644 data/language/* "$pkgdir/usr/share/openrct2/data/language/"

  # ArchLinux-specific stuff (launcher, .desktop file and icon).
  install -Dm755 "$srcdir/openrct2" "$pkgdir/usr/bin/openrct2"
  install -Dm644 "$srcdir/openrct2.desktop" "$pkgdir/usr/share/applications/openrct2.desktop"
  install -Dm644 resources/logo/icon_flag.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/openrct2.svg"

  # For Wine to find the SDL2.dll and libwinpthread-1.dll files they need to be
  # in the same directory as openrct2.exe, so we symlink them in place. We don't
  # use $CARCH here because on x86_64 OpenRCT2 is compiled with -m32,
  # therefore we always want to use the i686 DLLs. OpenRCT2 relies on
  # Wine's WoW64 support to actually run on x86_64 machines.
  ln -s /usr/i686-w64-mingw32/bin/SDL2.dll "$pkgdir/usr/share/openrct2"
  ln -s /usr/i686-w64-mingw32/bin/libwinpthread-1.dll "$pkgdir/usr/share/openrct2"
}
