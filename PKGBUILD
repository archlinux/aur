# Maintainer:
# Contributor: Andrea Feletto <andrea@andreafeletto.com>
# Contributor: Daurnimator <daurnimator@archlinux.org>

_pkgname="river"
pkgname="$_pkgname-noxwayland-git"
pkgver=0.3.0dev.r141.g5da4769
pkgrel=1
pkgdesc='Dynamic tiling wayland compositor'
url='https://github.com/riverwm/river'
license=('GPL3')
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

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!strip')

_pkgsrc="$_pkgname"
source=(
  "git+$url.git"
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
  local _version _commit_count _commit_hash

  cd "$_pkgsrc"
  _version=$(sed -n 's/-//;s/^const version = "\(.*\)";/\1/p' build.zig)
  _commit_count=$(git describe --long | cut -d- -f2)
  _commit_hash=$(git describe --long | cut -d- -f3)

  printf '%s.r%s.%s' "$_version" "$_commit_count" "$_commit_hash"
}

package() {
  cd "$_pkgsrc"

  local _zig_options=(
    --prefix '/usr'
    -Doptimize=ReleaseSafe
    # -Dxwayland
  )

  DESTDIR="${pkgdir:?}" zig build "${_zig_options[@]}"

  install -Dm644 LICENSE -t "${pkgdir:?}/usr/share/licenses/$pkgname/"
  install -Dm644 README.md -t "${pkgdir:?}/usr/share/doc/$pkgname/"
  install -Dm644 contrib/river.desktop -t "${pkgdir:?}/usr/share/wayland-sessions/"

  install -d "${pkgdir:?}/usr/share/$_pkgname"
  cp --reflink=auto -fr example "${pkgdir:?}/usr/share/$_pkgname/"
}
