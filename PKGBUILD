# Maintainer:
# Contributor: Andrea Feletto <andrea@andreafeletto.com>
# Contributor: Daurnimator <daurnimator@archlinux.org>

: ${_branch:=main}
: ${_ver_wlr:=0.20}

: ${ZVM_PATH:=$SRCDEST/zvm-data}
export ZVM_PATH

_pkgname="river"
pkgname="$_pkgname-git"
pkgver=0.4.r75.gd4fef52
pkgrel=1
pkgdesc="A dynamic tiling wayland compositor"
url='https://codeberg.org/river/river'
license=('GPL-3.0-only')
arch=('x86_64')

depends=(
  'libevdev'
  'libinput'
  'libxkbcommon'
  'pixman'
  'wayland'
  "wlroots${_ver_wlr}"
  'xorg-xwayland'
)
makedepends=(
  'git'
  'scdoc'
  'wayland-protocols'
  'zvm' # AUR
)

provides=(
  "$_pkgname"
  'wayland-compositor'
)
conflicts=(
  "$_pkgname"
  'river-classic'
)

_pkgsrc="codeberg.$_pkgname"
source=("$_pkgsrc"::"git+$url.git#branch=$_branch")
sha256sums=('SKIP')

_zig_setup() {
  local _zigver _zigpath _target
  _zigver="$(grep -Pom1 '(?<=-)[0-9.]+(?=\.tar\.xz)' "$_pkgsrc/.builds/archlinux.yml")"
  _zigpath="$ZVM_PATH/${_zigver:?zig version not found}"

  [ ! -e "$_zigpath" ] && zvm install "$_zigver"
  export PATH="$_zigpath:$PATH"

  _target="$CARCH-linux.6.6-gnu.2.40"

  _zig_options=(
    --summary all
    --prefix /usr
    --search-prefix /usr
    --global-cache-dir "$srcdir"/zig-global-cache
    -Dtarget="${_target}"
    -Dcpu=baseline
    -Dpie
    -Doptimize=ReleaseSafe
    -Dxwayland
  )
}

prepare() {
  _zig_setup

  # PACKAGING.md -> build.zig.zon
  cd "$_pkgsrc"
  local i
  for i in $(grep '\.url' build.zig.zon | sed -E 's&^.* = "(\S+)".*$&\1&'); do
    echo "zig fetch ... $i..."
    zig fetch --global-cache-dir "$srcdir"/zig-global-cache "$i"
  done
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/\.[0-9]+-([^-]*-g)/-r\1/;s/-/./g'
}

build() {
  _zig_setup

  cd "$_pkgsrc"
  DESTDIR="build" zig build "${_zig_options[@]}"
}

check() {
  _zig_setup

  cd "$_pkgsrc"
  zig build test "${_zig_options[@]}"
}

package() {
  cd "$_pkgsrc"
  cp -a build/* "$pkgdir"
  install -Dm644 contrib/river.desktop -t "$pkgdir/usr/share/wayland-sessions/"
}
