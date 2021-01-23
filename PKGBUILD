# Maintainer: Kevin Lewis <aur AT kevin DOT oakaged DOT io>
# Contributor: Jason Lenz <Jason@Lenzplace.org>
_pkgname=sleepyhead
pkgname=$_pkgname-git
pkgver=1.1.r2356.8e6968fb
pkgrel=3
pkgdesc="Open-source, cross platform, sleep tracking software with a focus on monitoring CPAP treatment."
arch=('i686' 'x86_64')
url="http://sleepyhead.jedimark.net"
license=('GPL')
depends=(
  'qt5-serialport'
  'qt5-tools'
)
makedepends=(
  'git'
  'glu'
)
provides=("$_pkgname")
conflicts=('sleepyhead')
source=(
  "git+https://gitlab.com/sleepyhead/sleepyhead-code.git"
  'sleepyhead.desktop'
)
sha256sums=('SKIP'
            'a15100d6bf1e1136d41a36f59613cd20776f0709c74c2e2d1b46f03271e08c3c')

pkgver() {
  cd sleepyhead-code
  _major=$(sed -rn 's/.*major_version = ([0-9]+).*/\1/p' < sleepyhead/version.h)
  _minor=$(sed -rn 's/.*minor_version = ([0-9]+).*/\1/p' < sleepyhead/version.h)
  _gitversion=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
  echo $_major.$_minor.$_gitversion
}

build() {
  cd sleepyhead-code
  export CXXFLAGS="$CXXFLAGS -fpermissive"
  ./configure
  make
}

package() {
  install -D $srcdir/sleepyhead-code/sleepyhead/SleepyHead $pkgdir/usr/bin/sleepyhead
  install -Dm644 $srcdir/sleepyhead-code/sleepyhead/icons/bob-v3.0.png $pkgdir/usr/share/sleepyhead/icon.png
  install -Dm644 $srcdir/sleepyhead.desktop $pkgdir/usr/share/applications/sleepyhead.desktop
}

# vim:set ts=2 sw=2 et:
