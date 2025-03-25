# Maintainer: Yuuki Rika <yvvki@duck.com>

_pkgname=pinnacle
pkgname=$_pkgname-comp-git # there's another package without the -comp suffix lol
pkgver=r1218.9bab206
pkgrel=1
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
  just
  cargo
  luarocks
)

_pkgsrc=$_pkgname
source=($_pkgsrc::git+$url)
b2sums=('SKIP')

pkgver() {
  cd $_pkgsrc
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgsrc
  just build --release
}

package() {
  cd $_pkgsrc
  install -Dm755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"

  # lua
  XDG_DATA_HOME="$pkgdir/usr/share" just install-protos

  cd snowcap
  XDG_DATA_HOME="$pkgdir/usr/share" just install-protos
}
