# Maintainer:
# Contributor: Andrea Feletto <andrea@andreafeletto.com>
# Contributor: Daurnimator <daurnimator@archlinux.org>

: ${_branch:=0.3.x}
: ${_ver_wlr:=0.19}

_pkgname="river"
pkgname="$_pkgname-git"
pkgver=0.3.10.r1.ged85b44
pkgrel=1
pkgdesc="A dynamic tiling wayland compositor"
url='https://codeberg.org/river/river'
license=('GPL-3.0-only')
arch=('x86_64')

depends=(
  'libevdev'
  'libinput'
  'libxkbcommon'
  'mesa'
  'pixman'
  'sh'
  'wayland'
  "wlroots${_ver_wlr}"
  'xorg-xwayland'
)
makedepends=(
  'git'
  'scdoc'
  'wayland-protocols'
  'zig'
)
optdepends=(
  'polkit: access seat through systemd-logind'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="codeberg.$_pkgname"
source=("$_pkgsrc"::"git+$url.git#branch=$_branch")
sha256sums=('SKIP')

prepare() {
  # PACKAGING.md -> build.zig.zon
  for i in $(grep '\.url' "$_pkgsrc"/build.zig.zon | sed -E 's&^.* = "(\S+)".*$&\1&'); do
    zig fetch --global-cache-dir ./zig-global-cache "$i"
  done
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

_zig_options() {
  _zig_options=(
    --summary all
    --prefix /usr
    --search-prefix /usr
    --global-cache-dir ../zig-global-cache
    --system ../zig-global-cache/p
    -Dtarget=native-linux.6.1-gnu.2.38
    -Dcpu=baseline
    -Dpie
    -Doptimize=ReleaseSafe
    -Dxwayland
  )
}

build() {
  _zig_options

  cd "$_pkgsrc"
  DESTDIR="build" zig build "${_zig_options[@]}"
}

check() {
  _zig_options

  cd "$_pkgsrc"
  zig build test "${_zig_options[@]}"
}

package() {
  cd "$_pkgsrc"
  cp -a build/* "$pkgdir"
  install -Dm644 contrib/river.desktop -t "$pkgdir/usr/share/wayland-sessions/"

  mkdir -pm755 "$pkgdir/usr/share/$_pkgname"
  cp -fr example "$pkgdir/usr/share/$_pkgname/"
}
