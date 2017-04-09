# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgbase=medusa-emu-git
pkgname=('libmedusa-emu-git' 'medusa-emu-sdl-git' 'medusa-emu-qt-git')
pkgver=r4792.2a968d25
pkgrel=1
arch=('i686' 'x86_64')
url='http://mgba.io/'
license=('custom:MPL2')
makedepends=('git' 'cmake' 'qt5-base' 'qt5-multimedia' 'sdl2' 'zlib' 'libpng'
             'libzip' 'libedit' 'ffmpeg' 'imagemagick' 'desktop-file-utils' 'libepoxy')
source=("medusa::git+https://github.com/mgba-emu/mgba.git#branch=medusa")
sha1sums=('SKIP')

pkgver() {
  cd medusa
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  [[ ! -d build ]] && mkdir build || rm -rf build
}

build() {
  cd build
  cmake "$srcdir"/medusa -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package_libmedusa-emu-git() {
  pkgdesc='Shared library of The Medusa Emulator'
  depends=('zlib' 'libpng' 'libzip' 'libedit' 'ffmpeg' 'imagemagick')
  conflicts=('libmgba' 'libmgba-git' 'libmedusa-emu')
  provides=('libmedusa-emu')

  cmake -DCOMPONENT=libmedusa medusa -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
    -P build/cmake_install.cmake
  install -Dm644 "$srcdir"/medusa/LICENSE "$pkgdir"/usr/share/licenses/libmedusa-emu/LICENSE
}

package_medusa-emu-sdl-git() {
  pkgdesc='An up and coming release of the mGBA emulator with GB, GBA and DS support (SDL)'
  depends=('libmedusa-emu-git' 'sdl2' 'libepoxy')
  conflicts=('medusa-emu-sdl' 'medusa')
  provides=('medusa-emu-sdl')

  cmake -DCOMPONENT=medusa-sdl medusa -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
    -P build/cmake_install.cmake
  install -d "$pkgdir"/usr/share/licenses/medusa-emu-sdl
  ln -s /usr/share/licenses/libmedusa-emu/LICENSE "$pkgdir"/usr/share/licenses/medusa-emu-sdl/LICENSE
}

package_medusa-emu-qt-git() {
  pkgdesc='An up and coming release of the mGBA emulator with GB, GBA and DS support - Qt5 UI'
  depends=('libmedusa-emu-git' 'qt5-base' 'qt5-multimedia' 'sdl2' 'libepoxy')
  conflicts=('medusa-emu-qt')
  provides=('medusa-emu-qt')

  cmake -DCOMPONENT=medusa-qt medusa -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
    -P build/cmake_install.cmake
  install -d "$pkgdir"/usr/share/licenses/medusa-emu-qt
  ln -s /usr/share/licenses/libmedusa-emu/LICENSE "$pkgdir"/usr/share/licenses/medusa-emu-qt/LICENSE
  desktop-file-install "$srcdir"/medusa/res/medusa-qt.desktop --dir "$pkgdir"/usr/share/applications/
  install -Dm644 medusa/res/medusa-256.png "$pkgdir"/usr/share/pixmaps/medusa.png
}
