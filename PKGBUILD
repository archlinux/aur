# Maintainer: Yuuki Rika <yvvki@duck.com>

_pkgname=pinnacle
pkgname=$_pkgname-comp-git # there's another package without the -comp suffix lol
pkgver=r1221.a53c0f1
pkgrel=3
pkgdesc='A WIP Smithay-based Wayland compositor, inspired by AwesomeWM'
arch=(any)
url='https://github.com/pinnacle-comp/pinnacle'
license=(GPL-3.0-or-later)
depends=(
  wayland # libwayland
  libxkbcommon
  systemd-libs # libudev libsystemd
  libinput
  mesa # libgbm
  seatd # libseat
  libglvnd # libEGL
)
optdepends=(
  'libdisplay-info: for monitor display information'
  'xorg-xwayland: for Xwayland support' # xwayland
  'protobuf: for the API' # protoc
  'lua: To configure Pinnacle using Lua'
)
makedepends=(
  git
  cargo
)

_pkgsrc=$_pkgname
source=($_pkgsrc::git+$url)
b2sums=('SKIP')

pkgver() {
  cd $_pkgsrc
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgsrc
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked
}

build() {
  cd $_pkgsrc
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd $_pkgsrc
  install -vDm 755 {target/release/$_pkgname,resources/$_pkgname-session} -t "$pkgdir/usr/bin/"
  install -vDm 644 resources/$_pkgname{.service,-shutdown.target} -t "$pkgdir/usr/lib/systemd/user/"
  install -vDm 644 resources/$_pkgname.desktop -t "$pkgdir/usr/share/wayland-sessions/"
  install -vDm 644 resources/$_pkgname-portals.conf -t "$pkgdir/usr/share/xdg-desktop-portal/"

  # lua
  install -vd "$pkgdir/usr/share/$_pkgname"
  install -vd "$pkgdir/usr/share/$_pkgname/snowcap"
  cp -vR api/protobuf "$pkgdir/usr/share/$_pkgname"
  cp -vR snowcap/api/protobuf "$pkgdir/usr/share/$_pkgname/snowcap"
}
