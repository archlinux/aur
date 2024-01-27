# Maintainer:
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Pagnite <tymoteuszdolega at gmail dot com>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Deon Spengler <deon@spengler.co.za>

_pkgname="ddcutil"
pkgname="$_pkgname-git"
pkgver=2.1.0.r67.g90e67d7c
pkgrel=1
pkgdesc='Query and change Linux monitor settings using DDC/CI and USB.'
url='http://ddcutil.com/'
arch=('x86_64')
license=('GPL2')

depends=(
  'glib2'
  'i2c-tools'
  'jansson'
  'kmod'
  'libdrm'
  'libusb'
  'libxrandr'
)
makedepends=(
  'systemd'
)

if [ "$_pkgname" != "$pkgname" ] ; then
  url="https://github.com/rockowitz/ddcutil"
  makedepends+=('git')
  provides+=("$_pkgname=${pkgver%%.r*}")
  conflicts+=("$_pkgname")

  _pkgsrc="$_pkgname"
  source=("$_pkgname"::"git+$url.git")
  sha256sums=('SKIP')

  pkgver() {
    cd "$_pkgsrc"
    git describe --long --tags --abbrev=8 --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
  }
fi

prepare() {
  cd "$_pkgsrc"
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "$_pkgsrc"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$_pkgsrc"
  make DESTDIR="${pkgdir:?}" install
}
