# Maintainer: hoxi <mail@hoxi.me>

pkgname=axolotl-apclient-git
_pkgname=axolotl
pkgver=0.1.6.r21.ga7c2620
pkgrel=1
pkgdesc="Lightweight Archipelago multiworld text client built with C++ and ImGui (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/mooinglemur/axolotl"
# MIT: axolotl, imgui, lua, sol2 (bundled); BSD-3-Clause: IXWebSocket (bundled)
license=('MIT' 'BSD-3-Clause')
depends=('gcc-libs' 'glibc' 'glfw' 'libglvnd' 'fontconfig' 'yaml-cpp' 'libzip' 'openssl' 'zlib')
makedepends=('git' 'cmake' 'ninja' 'python' 'nlohmann-json')
provides=("${pkgname%-git}=${pkgver%%.r*}")
conflicts=("${pkgname%-git}")
source=("git+$url.git"
        "imgui::git+https://github.com/ocornut/imgui.git"
        "IXWebSocket::git+https://github.com/machinezone/IXWebSocket.git"
        "sol2::git+https://github.com/ThePhD/sol2.git"
        "lua::git+https://github.com/lua/lua.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --match 'v[0-9]*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  git submodule init
  local mod
  for mod in imgui IXWebSocket sol2 lua; do
    git config "submodule.thirdparty/$mod.url" "$srcdir/$mod"
  done
  git -c protocol.file.allow=always submodule update
}

build() {
  # The bundled lua checkout has no lua.hpp, so sol2 would pick up the
  # system one (different Lua version); include lua.h directly instead.
  CXXFLAGS+=" -DSOL_NO_LUA_HPP=1"
  cmake -B build -S "$_pkgname" -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DAXOLOTL_IGNORE_DIRTY=ON \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  cd "$_pkgname"
  install -Dm644 com.mooinglemur.axolotl.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 com.mooinglemur.axolotl.png -t "$pkgdir/usr/share/icons/hicolor/256x256/apps"

  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 thirdparty/imgui/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.imgui"
  install -Dm644 thirdparty/IXWebSocket/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.IXWebSocket"
  install -Dm644 thirdparty/sol2/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.sol2"
  sed -n '/^\* Copyright (C)/,/^\*\*\*\*/p' thirdparty/lua/lua.h \
    > "$pkgdir/usr/share/licenses/$pkgname/LICENSE.lua"
}
