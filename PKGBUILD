# Maintainer:
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Trizen <trizenx at gmail dot com>
# Contributor: Federico Cinelli <cinelli.federico@gmail.com>

_pkgname="velox"
pkgname="$_pkgname-git"
pkgver=0.0.3.r255.gfcc0412
pkgrel=1
pkgdesc="Simple xcb window manager inspired by awesome, xmonad, and dwm"
url="https://github.com/michaelforney/velox"
license=('MIT')
arch=('i686' 'x86_64')

depends=(
  'swc'
  'wld'
  'libxkbcommon'
  'wayland'
  'libinput'
)
makedepends=('git')

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  local _tag=$(git tag | sort -V | tail -1)
  local _pkgver=$(sed -E 's&^[^0-9]*&&' <<< "${_tag:?}")
  local _revision=$(git rev-list --count --cherry-pick $_tag...HEAD)
  local _hash=$(git rev-parse --short HEAD)
  printf '%s.r%s.g%s' "${_pkgver:?}" "${_revision:?}" "${_hash:?}"
}

prepare() {
  cd "$_pkgsrc"
  tee config.mk <<EOF
PREFIX = /usr
LIBEXECDIR = /usr/lib
V = 1
EOF
}

build() {
  cd "$_pkgsrc"
  make
}

package() {
  cd "$_pkgsrc"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
