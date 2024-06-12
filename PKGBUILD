# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=intel-lpmd-git
pkgver=0.0.4.r0.g330c71d
pkgrel=1
pkgdesc="A daemon to optimize active idle power"
arch=('i686' 'x86_64')
url="https://github.com/intel/intel-lpmd"
license=('GPL-2.0-or-later')
depends=('glibc' 'dbus-glib' 'glib2' 'libnl' 'libxml2' 'systemd-libs')
makedepends=('git' 'gtk-doc')
provides=("intel-lpmd=$pkgver")
conflicts=('intel-lpmd')
source=("git+https://github.com/intel/intel-lpmd.git")
sha256sums=('SKIP')


pkgver() {
  cd "intel-lpmd"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "intel-lpmd"

  NO_CONFIGURE=1 ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --sbindir="/usr/bin" \
    --sysconfdir="/etc"
  make
}

check() {
  cd "intel-lpmd"

  #make check
}

package() {
  cd "intel-lpmd"

  make DESTDIR="$pkgdir" install
}
