# Maintainer: Viachaslau Khalikin <viachaslavic'at'outlook'dot'com>

pkgname=libretro-applewin-git
pkgver=1.30.21.0.b.r333.g2045a52d
pkgrel=1
pkgdesc="libretro implementation of AppleWin (Apple II)"
arch=('x86_64')
url="https://github.com/audetto/AppleWin.git"
license=('GPL-2.0-or-later')
groups=('libretro')
depends=('glibc' 'libslirp' 'libretro-core-info')
makedepends=('git' 'cmake' 'boost' 'boost-libs' 'libyaml' 'minizip' 'qt6-multimedia' 'zlib')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
options=(!debug !lto)
source=("${pkgname%-git}::git+https://github.com/audetto/AppleWin.git"
        "git+https://github.com/Dax89/QHexView.git"
        "git+https://github.com/ocornut/imgui.git"
        "git+https://github.com/ocornut/imgui_club.git"
        "git+https://github.com/AirGuanZ/imgui-filebrowser.git")
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"

  git submodule init
  git submodule set-url source/frontends/qt/QHexView "${srcdir}/QHexView"
  git submodule set-url source/frontends/sdl/imgui/imgui "${srcdir}/imgui"
  git submodule set-url source/frontends/sdl/imgui/imgui_club "${srcdir}/imgui_club"
  git submodule set-url source/frontends/sdl/imgui/imgui-filebrowser "${srcdir}/imgui-filebrowser"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "${pkgname%-git}"
  cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_LIBRETRO=ON -S .
  make applewin_libretro
}

package() {
  install -Dm 644 "${pkgname%-git}"/source/frontends/libretro/applewin_libretro.so -t "${pkgdir}"/usr/lib/libretro/
}

# vim:set ts=2 sw=2 et:
