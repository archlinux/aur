# Maintainer: Jason Lenz <Jason@Lenzplace.org>
_pkgname=sleepyhead
pkgname=$_pkgname-git
pkgver=1.0.0.2.g0e04bd99
pkgrel=1
pkgdesc="Open-source, cross platform, sleep tracking software with a focus on monitoring CPAP treatment."
arch=('i686' 'x86_64')
url="http://sleepyhead.jedimark.net"
license=('GPL')
depends=(
  'qt5-base'
  'qt5-serialport'
  'qt5-webkit'
  'glu'
)
makedepends=('git')
provides=()
conflicts=('sleepyhead')
source=(
  "git+https://gitlab.com/sleepyhead/sleepyhead-code.git"
  'moduleupdates.patch'
)
sha256sums=(
  'SKIP'
  af1390195fc4a5f2aa0cced24b1ce1a629dbd608a40d10dc319cfcbd959bec02 #moduleupdates.patch
)

prepare() {
  cd sleepyhead-code
  patch -Np1 -i "$srcdir/moduleupdates.patch"
}

pkgver() {
  cd sleepyhead-code
  _major=$(sed -rn 's/.*major_version = ([0-9]+).*/\1/p' < sleepyhead/version.h)
  _minor=$(sed -rn 's/.*minor_version = ([0-9]+).*/\1/p' < sleepyhead/version.h)
  _rev=$(sed -rn 's/.*revision_number = ([0-9]+).*/\1/p' < sleepyhead/version.h)
  _build=$(cat sleepyhead/scripts/build_number)
  _gitversion=$(git rev-parse --short HEAD)
  echo $_major.$_minor.$_rev.$_build.g$_gitversion
}

build() {
  cd sleepyhead-code
  ./configure
  make
}

package() {
  install -D "$srcdir/sleepyhead-code/sleepyhead/SleepyHead" "$pkgdir/usr/bin/SleepyHead"
}

# vim:set ts=2 sw=2 et:
