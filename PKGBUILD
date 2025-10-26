pkgname=ura-git
_pkgname=ura
pkgver=r207.62a99dd
pkgrel=1
pkgdesc="A highly customizable Wayland compositor driven by Lua"
url="https://github.com/levinion/ura"
arch=("any")
license=("GPLv3")
depends=("luajit" "glibc" "wlroots0.19" "nlohmann-json" "sol2" "cli11" "spdlog" "libnotify" "libinput" "libxkbcommon")
makedepends=("cmake" "pkgconf" "make" "ninja")
optdepends=("xwayland-satellite" "foot")
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
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 ./build/$_pkgname $pkgdir/usr/bin/$_pkgname
  install -Dm755 ./scripts/* $pkgdir/usr/bin/
  install -Dm644 ./assets/$_pkgname.desktop $pkgdir/usr/share/wayland-sessions/$_pkgname.desktop
  install -d $pkgdir/etc/$_pkgname
  install -Dm644 ./assets/init.lua $pkgdir/etc/$_pkgname/init.lua
  cp -r lua/$_pkgname $pkgdir/usr/share/
  install -d $pkgdir/usr/share/zsh/site-functions
  install -Dm644 ./assets/completions/zsh/_$_pkgname $pkgdir/usr/share/zsh/site-functions/
}
