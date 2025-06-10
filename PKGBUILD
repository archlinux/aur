# Maintainer:
# Contributor: Andrea Feletto <andrea@andreafeletto.com>

: ${_branch:=next-wlroots}
: ${_ver_wlr:=0.19}

_pkgname="river"
pkgname="$_pkgname-noxwayland-git"
pkgver=0.3.9.r7.gee1e36c
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
  local _tag=$(git tag | sort -rV | head -1)
  local _version"=${_tag#v}"
  local _revision=$(git rev-list --count --cherry-pick "$_tag"...HEAD)
  local _hash=$(git rev-parse --short=7 HEAD)

  printf '%s.r%s.g%s' "${_version:?}" "${_revision:?}" "${_hash:?}"
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
