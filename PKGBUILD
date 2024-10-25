# Maintainer:
# Contributor: Andrea Feletto <andrea@andreafeletto.com>
# Contributor: Daurnimator <daurnimator@archlinux.org>

## useful links
# https://codeberg.org/river/river
# https://github.com/riverwm/river

## options
: ${_build_xwayland:=true}
: ${_build_git:=true}

unset _pkgtype
[ "${_build_xwayland::1}" != "t" ] && _pkgtype+="-noxwayland"
[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

# basic info
_pkgname="river"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=0.3.5.r31.g1b5dd21
pkgrel=3
pkgdesc='Dynamic tiling wayland compositor'
url='https://codeberg.org/river/river'
license=('GPL-3.0-only')
arch=('x86_64')

depends=(
  'libevdev'
  'libinput'
  'libxkbcommon'
  'mesa'
  'pixman'
  'wayland'
  'wlroots'
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

[[ "${_build_xwayland::1}" == "t" ]] && depends+=('xorg-xwayland')

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=('git+https://github.com/riverwm/river.git')
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

build() {
  local _zig_options=(
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

  [[ "${_build_xwayland::1}" == "t" ]] && _zig_options+=(-Dxwayland)

  cd "$_pkgsrc"
  DESTDIR="build" zig build "${_zig_options[@]}"
}

package() {
  cd "$_pkgsrc"
  cp --reflink=auto -a build/* "$pkgdir"
  install -Dm644 contrib/river.desktop -t "$pkgdir/usr/share/wayland-sessions/"

  install -d "$pkgdir/usr/share/$_pkgname"
  cp --reflink=auto -fr example "$pkgdir/usr/share/$_pkgname/"
}
