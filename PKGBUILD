# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgbase=mgba-git
pkgname=('libmgba-git' 'mgba-sdl-git' 'mgba-qt-git')
pkgver=r4949.a6a6e311
pkgrel=1
arch=('i686' 'x86_64')
url='http://mgba.io/'
license=('custom:MPL2')
makedepends=('git' 'cmake' 'qt5-base' 'qt5-multimedia' 'sdl2' 'zlib' 'libpng'
             'libzip' 'libedit' 'ffmpeg' 'libmagick' 'desktop-file-utils' 'libepoxy'
             'libelf' 'sqlite')
source=("git+https://github.com/mgba-emu/mgba.git")
sha1sums=('SKIP')

pkgver() {
  cd mgba
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  if [[ -d build ]]; then
    rm -rf build && mkdir build
  else
    mkdir build
  fi
}

build() {
  cd build
  cmake "$srcdir"/mgba -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package_libmgba-git() {
  pkgdesc='Shared library of mGBA'
  depends=('zlib' 'libpng' 'libzip' 'libedit' 'ffmpeg' 'libmagick' 'libelf' 'sqlite')
  conflicts=('libmgba')
  provides=('libmgba')

  cmake -DCOMPONENT=libmgba mgba -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
    -P build/cmake_install.cmake
  install -Dm644 "$srcdir"/mgba/LICENSE "$pkgdir"/usr/share/licenses/libmgba/LICENSE
}

package_mgba-sdl-git() {
  pkgdesc='A Nintendo Gameboy Advance Emulator'
  depends=('libmgba-git' 'sdl2' 'libepoxy')
  conflicts=('mgba-sdl')
  provides=('mgba-sdl')

  cmake -DCOMPONENT=mgba-sdl mgba -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
    -P build/cmake_install.cmake
  install -d "$pkgdir"/usr/share/licenses/mgba-sdl
  ln -s /usr/share/licenses/libmgba/LICENSE "$pkgdir"/usr/share/licenses/mgba-sdl/LICENSE
}

package_mgba-qt-git() {
  pkgdesc='A Nintendo Gameboy Advance Emulator - Qt5 UI'
  depends=('libmgba-git' 'qt5-base' 'qt5-multimedia' 'sdl2' 'libepoxy')
  conflicts=('mgba-qt')
  provides=('mgba-qt')

  cmake -DCOMPONENT=mgba-qt mgba -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
    -P build/cmake_install.cmake
  install -d "$pkgdir"/usr/share/licenses/mgba-qt
  ln -s /usr/share/licenses/libmgba/LICENSE "$pkgdir"/usr/share/licenses/mgba-qt/LICENSE
  desktop-file-install "$srcdir"/mgba/res/mgba-qt.desktop --dir "$pkgdir"/usr/share/applications/
  install -Dm644 mgba/res/mgba-256.png "$pkgdir"/usr/share/pixmaps/mgba.png
}
