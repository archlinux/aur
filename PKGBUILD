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
pkgver=0.2.6.r285.g12de175
pkgrel=1
pkgdesc='Dynamic tiling wayland compositor'
url='https://codeberg.org/river/river'
license=('GPL-3.0-only')
arch=('x86_64')

depends=(
  'libevdev'
  'libxkbcommon'
  'mesa'
  'pixman'
  'wayland'
  'wayland-protocols'
  'wlroots'
)
makedepends=(
  'git'
  'scdoc'
  'zig'
)
optdepends=(
  'polkit: access seat through systemd-logind'
)

[[ "${_build_xwayland::1}" == "t" ]] && depends+=('xorg-xwayland')

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!strip')

_pkgsrc="$_pkgname"
source=(
  'git+https://github.com/riverwm/river.git'
  'git+https://github.com/ifreund/zig-pixman.git'
  'git+https://github.com/ifreund/zig-wayland.git'
  'git+https://github.com/swaywm/zig-wlroots.git'
  'git+https://github.com/ifreund/zig-xkbcommon.git'
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

prepare() {
  cd "$_pkgsrc"
  git submodule init
  for dep in pixman wayland wlroots xkbcommon; do
    git config "submodule.deps/zig-$dep.url" "$srcdir/zig-$dep"
  done
  git -c protocol.file.allow=always submodule update
}

pkgver() {
  cd "$_pkgsrc"
  local _tag=$(git tag | sort -rV | head -1)
  local _version"=${_tag#v}"
  local _revision=$(git rev-list --count --cherry-pick "$_tag"...HEAD)
  local _hash=$(git rev-parse --short=7 HEAD)

  printf '%s.r%s.g%s' "${_version:?}" "${_revision:?}" "${_hash:?}"
}

package() {
  cd "$_pkgsrc"
  local _zig_options=(
    --prefix '/usr'
    -Doptimize=ReleaseSafe
  )

  [[ "${_build_xwayland::1}" == "t" ]] && _zig_options+=(-Dxwayland)

  DESTDIR="$pkgdir" zig build "${_zig_options[@]}"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 contrib/river.desktop -t "$pkgdir/usr/share/wayland-sessions/"

  install -d "$pkgdir/usr/share/$_pkgname"
  cp --reflink=auto -fr example "$pkgdir/usr/share/$_pkgname/"
}
