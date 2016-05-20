# Maintainer: Sree Harsha Totakura <sreeharsha at lastname dot in>

pkgname=kerneloops-git
_pkgname=kerneloops
pkgver=latest
pkgrel=1
pkgdesc="kerneloops client tool for reporting OOPS to http://oops.kernel.org/"
arch=('i686' 'x86_64')
url="http://oops.kernel.org/"
license=(GPL2)
groups=()
depends=('dbus-glib' 'libnotify' 'gtk2' 'curl')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=('etc/kerneloops.conf')
options=()
install=
source=("git+https://github.com/oops-kernel-org/kerneloops")
noextract=()
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$_pkgname"
  sed -i 's@^SBINDIR=.*$@SBINDIR=/usr/bin@' Makefile
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir/" install
}
