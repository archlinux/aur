# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgbase=mgba-git
pkgname=('libmgba-git' 'mgba-sdl-git' 'mgba-qt-git')
pkgver=0.11.0.r7777.b8c7196dd
pkgrel=1
arch=('x86_64')
url='http://mgba.io/'
license=('custom:MPL2')
makedepends=('cmake' 'qt5-multimedia' 'sdl2' 'zlib' 'libpng' 'libzip' 'libedit'
             'ffmpeg' 'desktop-file-utils' 'qt5-tools' 'git' 'ninja')
source=("git+https://github.com/mgba-emu/mgba.git")
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir"/mgba
  for v in LIB_VERSION_MAJOR \
           LIB_VERSION_MINOR \
           LIB_VERSION_PATCH; do
    ver=$(grep -m 1 $v version.cmake | grep -o '[0-9]' | tr -d '\n')
    printf -v "$v" "%s" "$ver"
  done

  printf "%s.%s.%s.r%s.%s" \
    $LIB_VERSION_MAJOR \
    $LIB_VERSION_MINOR \
    $LIB_VERSION_PATCH \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cmake -S "${pkgbase%-git}" -G Ninja -B build \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  cmake --build build --config Release
}

package_libmgba-git() {
  pkgdesc='Shared library of mGBA (git build)'
  depends=('zlib' 'libpng' 'libzip' 'libedit' 'ffmpeg' 'sqlite' )
  conflicts=('libmgba')
  provides=('libmgba')

  cmake -DCOMPONENT=libmgba mgba -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
    -P build/cmake_install.cmake

  cmake -DCOMPONENT=mgba-dev mgba -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
    -P build/cmake_install.cmake

  install -Dm644 mgba/LICENSE "$pkgdir"/usr/share/licenses/${pkgname%-git}/LICENSE
}

package_mgba-sdl-git() {
  pkgdesc='A Nintendo Gameboy Advance Emulator focusing on both speed and accuracy (git build)'
  depends=('libmgba' 'sdl2')
  conflicts=('mgba-sdl')
  provides=('mgba-sdl')

  cmake -DCOMPONENT=mgba-sdl mgba -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
    -P build/cmake_install.cmake

  install -d "$pkgdir"/usr/share/licenses/${pkgname%-git}
  ln -s /usr/share/licenses/libmgba/LICENSE "$pkgdir"/usr/share/licenses/${pkgname%-git}/LICENSE
}

package_mgba-qt-git() {
  pkgdesc='A Nintendo Gameboy Advance Emulator focusing on both speed and accuracy. Qt5 UI. (git build)'
  depends=('libmgba' 'qt5-multimedia' 'sdl2')
  conflicts=('mgba-qt')
  provides=('mgba-qt')

  cmake -DCOMPONENT=mgba-qt mgba -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
    -P build/cmake_install.cmake

  desktop-file-install mgba/res/mgba-qt.desktop --dir "$pkgdir"/usr/share/applications/
  install -Dm644 mgba/res/mgba-256.png "$pkgdir"/usr/share/pixmaps/mgba.png

  install -d "$pkgdir"/usr/share/licenses/${pkgname%-git}
  ln -s /usr/share/licenses/libmgba/LICENSE "$pkgdir"/usr/share/licenses/${pkgname%-git}/LICENSE
}
