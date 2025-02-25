# Maintainer:
# Contributor: Philipp A. <flying-sheep@web.de>
# Contributor: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: NeoRaider <neoraider@universe-factory.net>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

_pkgname="libxcb"
pkgname="$_pkgname-git"
pkgver=1.17.0.r4.gdaf2c53
pkgrel=1
pkgdesc="X11 client-side library"
url="https://gitlab.freedesktop.org/xorg/lib/libxcb"
license=('X11')
arch=('i686' 'x86_64')

depends=(
  'glibc'
  'libxau'
  'libxdmcp'
  'xcb-proto-git'
)
makedepends=(
  'git'
  'libxslt'
  'python'
  'xorg-util-macros'
  'xorgproto'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags \
    | sed -E 's/^[^0-9]+//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  local _config_options=(
    --prefix='/usr'
    --enable-xinput
    --enable-xkb
    --disable-static
    --with-doxygen=no
  )

  ./autogen.sh "${_config_options[@]}"

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd "$_pkgsrc"
  make -k check
}

package() {
  cd "$_pkgsrc"
  make DESTDIR="${pkgdir:?}" install

  install -Dm644 "COPYING" -t "${pkgdir:?}/usr/share/licenses/$pkgname/"
}
