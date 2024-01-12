# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=unixodbc-git
pkgver=2.3.12.r12.g9b31cd2
pkgrel=1
pkgdesc="An open specification for providing application developers with a predictable API with which to access Data Sources"
arch=('i686' 'x86_64')
url="https://www.unixodbc.org/"
license=('LGPL')
depends=('glibc' 'libltdl' 'readline')
makedepends=('git')
provides=("unixodbc=$pkgver")
conflicts=('unixodbc')
backup=(etc/odbc{,inst}.ini)
options=('staticlibs')
source=("git+https://github.com/lurcher/unixODBC.git")
sha256sums=('SKIP')


pkgver() {
  cd "unixODBC"

  _tag=$(git tag -l --sort -creatordate | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "unixODBC"

  autoreconf -fi
  ./configure \
    --prefix="/usr" \
    --sysconfdir="/etc" \
    --enable-static
  make
}

check() {
  cd "unixODBC"

  make check
}

package() {
  cd "unixODBC"

  make DESTDIR="$pkgdir" install
}
