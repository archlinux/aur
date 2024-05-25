# Maintainer:
# Contributor: jfperini <@jfperini>

_pkgname="gnome-encfs-manager"
pkgname="$_pkgname-bzr"
pkgver=1.9.r562.c1721
pkgrel=2
pkgdesc="An easy to use manager and mounter for Encfs stashes"
url="https://launchpad.net/gencfsm"
license=('GPL-2.0-or-later')
arch=('x86_64')

depends=(
  'encfs'
  'gtk3'
  'libgee'
  'libice'
  'libsecret'
  'libsm'
)
makedepends=(
  'breezy'
  'intltool'
  'vala'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::'bzr+https://code.launchpad.net/~gencfsm/gencfsm/trunk')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  local _ver=$(bzr tags | sort -V | tail -1 | sed -E 's@ .*$@@')
  local _tag=$(bzr tags | sort -V | tail -1 | sed -E 's@^.* @@')
  local _cnt=$(bzr revno)
  local _rev=$((_cnt - _tag))
  printf '%s.r%s.c%s' "$_ver" "$_rev" "$_cnt"
}

build() {
  CFLAGS+=" -Wno-error=implicit-function-declaration"

  cd "$_pkgsrc"
  ./autogen.sh
  ./configure --prefix=/usr --disable-appindicator
  make
}

package() {
  cd "$_pkgsrc"
  make DESTDIR="$pkgdir" install
}
