# Maintainer:
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Pagnite <tymoteuszdolega at gmail dot com>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Deon Spengler <deon@spengler.co.za>

## useful links
# http://ddcutil.com/
# https://github.com/rockowitz/ddcutil

_pkgname="ddcutil"
pkgname="$_pkgname-git"
pkgver=2.1.4.r94.g1ce8d58
pkgrel=3
pkgdesc='Query and change Linux monitor settings using DDC/CI and USB.'
url='https://github.com/rockowitz/ddcutil'
license=('GPL-2.0-or-later')
arch=('x86_64')

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
  'git'
  'systemd'
)

provides+=("$_pkgname=${pkgver%%.r*}")
conflicts+=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgname"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"

  # switch default branch, in case cache is out of date
  _branch=$(git remote show origin | grep HEAD | sed 's&^.*: &&')
  git checkout -f "$_branch"
  git reset --hard HEAD

  git describe --long --tags --abbrev=7 --exclude='*[a-z][a-z]*' |
    sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

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
  make DESTDIR="$pkgdir" install
}
