# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgbase=mgba-git
pkgname=('libmgba-git' 'mgba-sdl-git' 'mgba-qt-git')
pkgver=0.11.0.r8409.5d92c3ca0
pkgrel=1
arch=('x86_64')
url='http://mgba.io/'
license=('MPL-2.0')
makedepends=('cmake' 'desktop-file-utils' 'ffmpeg' 'gcc-libs' 'glibc' 'git'
             'json-c' 'libedit' 'libelf' 'libepoxy' 'libglvnd' 'libpng' 'libzip'
             'lua' 'ninja' 'sdl2' 'qt6-base' 'qt6-multimedia' 'qt6-tools' 'zlib')
source=("git+https://github.com/mgba-emu/mgba.git")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}"/mgba
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
    -DCMAKE_BUILD_TYPE=Release \
    -DUSE_MINIZIP=OFF

  cmake --build build --config Release
}

package_libmgba-git() {
  pkgdesc='Shared library of mGBA (git build)'
  depends=('ffmpeg' 'glibc' 'json-c' 'libedit' 'libelf' 'libepoxy' 'libpng' 'libzip' 'lua' 'sqlite' 'zlib')
  conflicts=('libmgba')
  provides=('libmgba')

  cmake -DCOMPONENT=libmgba mgba -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
    -P build/cmake_install.cmake

  cmake -DCOMPONENT=mgba-dev mgba -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
    -P build/cmake_install.cmake

  install -Dm644 mgba/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname%-git}/LICENSE
}

package_mgba-sdl-git() {
  pkgdesc='A Nintendo Gameboy Advance Emulator focusing on both speed and accuracy (git build)'
  depends=('glibc' 'libmgba-git' 'libpng' 'sdl2')
  conflicts=('mgba-sdl')
  provides=('mgba-sdl')

  cmake -DCOMPONENT=mgba-sdl mgba -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
    -P build/cmake_install.cmake

  install -d "${pkgdir}"/usr/share/licenses/${pkgname%-git}
  ln -s /usr/share/licenses/libmgba/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname%-git}/LICENSE
}

package_mgba-qt-git() {
  pkgdesc='A Nintendo Gameboy Advance Emulator focusing on both speed and accuracy. Qt6 UI. (git build)'
  depends=('ffmpeg' 'gcc-libs' 'glibc' 'libglvnd' 'libmgba-git' 'sdl2' 'qt6-base' 'qt6-multimedia')
  conflicts=('mgba-qt')
  provides=('mgba-qt')

  cmake -DCOMPONENT=mgba-qt mgba -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
    -P build/cmake_install.cmake

  desktop-file-install mgba/res/mgba-qt.desktop --dir "${pkgdir}"/usr/share/applications/
  sed -i 's/Exec=/Exec=env QT_QPA_PLATFORM=xcb /g' "${pkgdir}"/usr/share/applications/mgba-qt.desktop
  sed -i 's/Exec=/Exec=env QT_QPA_PLATFORM=xcb /g' "${pkgdir}"/usr/share/applications/io.mgba.mGBA.desktop

  install -Dm644 mgba/res/mgba-256.png "${pkgdir}"/usr/share/pixmaps/io.mgba.mGBA.png

  install -d "${pkgdir}"/usr/share/licenses/${pkgname%-git}
  ln -s /usr/share/licenses/libmgba/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname%-git}/LICENSE
}
