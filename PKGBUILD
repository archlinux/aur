# Maintainer:
# Contributor: Philipp A. <flying-sheep@web.de>
# Contributor: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: NeoRaider <neoraider@universe-factory.net>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

_pkgname="libxcb"
pkgname="$_pkgname-git"
pkgver=1.16.r4.g02a7bbe
pkgrel=1
pkgdesc="X11 client-side library"
arch=(i686 x86_64)
url='https://xcb.freedesktop.org'
license=('custom')

depends=(
  # extra/libxcb
  'glibc'
  'libxau'
  'libxdmcp'
)
makedepends=(
  # extra/libxcb
  'libxslt'
  'python'
  'xorg-util-macros'
  'xorgproto'
)

if [ x"$pkgname" == x"$_pkgname" ] ; then
  # extra/libxcb
  depends+=('xcb-proto')
else
  # aur/libxcb-git
  depends+=('xcb-proto-git')
  makedepends+=('git')

  provides=("$_pkgname=${pkgver//.r*}")
  conflicts=("$_pkgname")

  _pkgsrc="$_pkgname"
  source=(
    "$_pkgname"::"git+http://anongit.freedesktop.org/git/xcb/libxcb.git"
  )
  sha256sums=(
    'SKIP'
  )

  pkgver() {
    cd "$_pkgsrc"
    git describe --tags | sed 's/libxcb-//;s/-/.r/;s/-/./g'
  }
fi

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
