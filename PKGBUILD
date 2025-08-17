pkgname=ura-git
_pkgname=ura
pkgver=r107.eb1c026
pkgrel=1
pkgdesc="A highly customizable Wayland compositor driven by Lua"
url="https://github.com/levinion/ura"
arch=("any")
license=("GPLv3")
depends=("luajit" "glibc" "wlroots0.19")
makedepends=("cmake" "pkgconf" "nlohmann-json" "sol2" "cargo")
provides=("ura")
conflicts=("ura")
source=(
  "$_pkgname::git+https://github.com/levinion/$_pkgname.git"
)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  mkdir -p include/protocols
  wayland-scanner server-header ./protocols/xdg-shell.xml include/protocols/xdg-shell-protocol.h
  wayland-scanner server-header ./protocols/wlr-layer-shell-unstable-v1.xml include/protocols/wlr-layer-shell-unstable-v1-protocol.h
  wayland-scanner server-header ./protocols/wlr-output-power-management-unstable-v1.xml include/protocols/wlr-output-power-management-unstable-v1-protocol.h
  wayland-scanner server-header ./protocols/cursor-shape-v1.xml include/protocols/cursor-shape-v1-protocol.h
  wayland-scanner server-header ./protocols/pointer-constraints-unstable-v1.xml include/protocols/pointer-constraints-unstable-v1-protocol.h
  cmake -B build -DCMAKE_BUILD_TYPE=Release
  cmake --build build -j$(nproc)

  cd "$srcdir/$_pkgname/uracil"
  cargo build --release
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 "build/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -d "$pkgdir/etc/$_pkgname"
  install -Dm644 "assets/init.lua" "$pkgdir/etc/$_pkgname/"
  install -Dm644 "assets/$_pkgname.desktop" "$pkgdir/usr/share/wayland-sessions/$_pkgname.desktop"
  install -d "$pkgdir/usr/share/lua/5.1/"
  cp -r "lua/$_pkgname" "$pkgdir/usr/share/lua/5.1/"
  install -Dm755 "uracil/target/release/uracil" "$pkgdir/usr/bin/uracil"
}
