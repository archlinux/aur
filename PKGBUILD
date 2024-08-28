# Maintainer:
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Pagnite <tymoteuszdolega at gmail dot com>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>

## links
# http://ddcutil.com/
# https://github.com/rockowitz/ddcutil

_pkgname="ddcutil"
pkgname="$_pkgname-git"
pkgver=2.1.4.r273.g5b1fb8e
pkgrel=1
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

provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-z][a-z]*' \
    | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgsrc"

  # switch default branch, in case cache is out of date
  local _branch=$(git branch -a | grep 'remotes/origin/[0-9]' | sort -rV | head -1 | sed 's&^.*remotes/origin/&&')
  git checkout -f "$_branch"
  git reset --hard HEAD

  # don't delete build_details.h
  sed -E -e '/\brm\b.*\bbuild_details.h\b/d' -i src/base/Makefile.am
}

build() {
  cd "$_pkgsrc"
  NOCONFIGURE=1 ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$_pkgsrc"
  make DESTDIR="$pkgdir" install
}
