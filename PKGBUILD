pkgname=ura-git
_pkgname=ura
pkgver=r147.28ae929
pkgrel=1
pkgdesc="A highly customizable Wayland compositor driven by Lua"
url="https://github.com/levinion/ura"
arch=("any")
license=("GPLv3")
depends=("luajit" "glibc" "wlroots0.19" "nlohmann-json" "sol2" "cli11" "spdlog" "libnotify" "libinput" "libxkbcommon")
makedepends=("cmake" "pkgconf" "cargo" "make")
optdepends=("xwayland-satellite" "foot" "waybar" "fzfmenu" "swaylock" "swaybg" "swayidle")
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
  make build
  cd "$srcdir/$_pkgname/uracil"
  cargo build --release
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 ./build/$_pkgname $pkgdir/usr/bin/$_pkgname
  install -Dm644 ./assets/$_pkgname.desktop $pkgdir/usr/share/wayland-sessions/$_pkgname.desktop
  install -d $pkgdir/etc/$_pkgname
  install -Dm644 ./assets/init.lua $pkgdir/etc/$_pkgname/init.lua
  install -d $pkgdir/usr/share/lua/5.1
  cp -r lua/$_pkgname $pkgdir/usr/share/lua/5.1/
  install -Dm755 uracil/target/release/uracil $pkgdir/usr/bin/uracil
}
