# Maintainer:

: ${_ver_wlr:=0.19}

: ${ZVM_PATH:=$SRCDEST/zvm-data}
export ZVM_PATH

_pkgname="river-classic"
pkgname="$_pkgname-git"
pkgver=0.3.14.r4.gbbdc477
pkgrel=2
pkgdesc="A dynamic tiling wayland compositor"
url='https://codeberg.org/river/river-classic'
license=('GPL-3.0-or-later')
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
  'zvm' # AUR
)
optdepends=(
  'polkit: access seat through systemd-logind'
)

provides=(
  "$_pkgname"
  'wayland-compositor'
)
conflicts=(
  "$_pkgname"
  'river'
)

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

_zig_setup() {
  local _zigver _zigpath _target
  _zigver="$(grep -Pom1 '(?<=-)[0-9.]+(?=\.tar\.xz)' "$_pkgsrc/.builds/archlinux.yml")"
  _zigpath="$ZVM_PATH/${_zigver:?zig version not found}"

  [ ! -e "$_zigpath" ] && zvm install "$_zigver"
  export PATH="$_zigpath:$PATH"

  _target="$CARCH-linux.6.1-gnu.2.38"

  _zig_options=(
    --summary all
    --prefix /usr
    --search-prefix /usr
    --global-cache-dir ../zig-global-cache
    --system ../zig-global-cache/p
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
  for i in $(grep '\.url' "$_pkgsrc"/build.zig.zon | sed -E 's&^.* = "(\S+)".*$&\1&'); do
    echo "zig fetch ... $i..."
    zig fetch --global-cache-dir ./zig-global-cache "$i"
  done
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
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

  mkdir -pm755 "$pkgdir/usr/share/$_pkgname"
  cp -fr example "$pkgdir/usr/share/$_pkgname/"
}
