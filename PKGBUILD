# Maintainer: Master Laser <vaporeon@tfwno.gf>

pkgbase=mgba-git
pkgname=('libmgba-git' 'mgba-sdl-git' 'mgba-qt-git')
pkgver=r2168.5213b8a
pkgrel=1
arch=('i686' 'x86_64')
url="http://mgba.io/"
license=('custom:MPL2')
makedepends=('git' 'cmake' 'qt5-base' 'qt5-multimedia' 'sdl2' 'zlib' 'libpng'
             'libzip' 'libedit' 'ffmpeg' 'imagemagick' 'desktop-file-utils')
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
  cmake "$srcdir"/mgba -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package_libmgba-git() {
  pkgdesc='Shared library of mGBA'
  depends=('zlib' 'libpng' 'libzip' 'libedit' 'ffmpeg' 'imagemagick')
  conflicts=('libmgba')
  provides=('libmgba')
  install=mgba.install
  cmake -DCOMPONENT=libmgba mgba -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
    -P build/cmake_install.cmake
  install -Dm644 "$srcdir"/mgba/LICENSE "$pkgdir"/usr/share/licenses/libmgba/LICENSE
}

package_mgba-sdl-git() {
  pkgdesc='A Nintendo Gameboy Advance Emulator focusing on both speed and accuracy'
  depends=('libmgba-git' 'sdl2')
  conflicts=('mgba-sdl')
  provides=('mgba-sdl')
  cmake -DCOMPONENT=mgba-sdl mgba -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
    -P build/cmake_install.cmake
  install -d "$pkgdir"/usr/share/licenses/mgba-sdl
  ln -s /usr/share/licenses/libmgba/LICENSE "$pkgdir"/usr/share/licenses/mgba-sdl/LICENSE
}

package_mgba-qt-git() {
  pkgdesc='A Nintendo Gameboy Advance Emulator focusing on both speed and accuracy - Qt5 UI'
  depends=('libmgba-git' 'qt5-base' 'qt5-multimedia' 'sdl2')
  conflicts=('mgba-qt')
  provides=('mgba-qt')
  cmake -DCOMPONENT=mgba-qt mgba -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
    -P build/cmake_install.cmake
  install -d "$pkgdir"/usr/share/licenses/mgba-qt
  ln -s /usr/share/licenses/libmgba/LICENSE "$pkgdir"/usr/share/licenses/mgba-qt/LICENSE
  desktop-file-install "$srcdir"/mgba/res/mgba-qt.desktop --dir "$pkgdir"/usr/share/applications/
}
