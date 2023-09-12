# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=mtools-svn
pkgver=r820
pkgrel=1
pkgdesc="Collection of utilities to access MS-DOS disks without mounting them"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/mtools/"
license=('GPL')
depends=('glibc' 'sh')
makedepends=('subversion' 'bash' 'libsm' 'libx11' 'texinfo')
optdepends=('libsm: required by floppyd'
            'libx11: required by floppyd')
provides=("mtools=$pkgver")
conflicts=('mtools')
backup=('etc/mtools.conf')
source=("svn://svn.savannah.gnu.org/mtools/trunk")
sha256sums=('SKIP')


pkgver() {
  cd "trunk"

  _rev=$(svnversion | sed 's/[^0-9]+//')
  printf "r%s" "$_rev"
}

build() {
  cd "trunk"

  sed -i '/^SAMPLE FILE$/s:^:# :' "mtools.conf"
  autoreconf -fi
  ./configure \
    --prefix="/usr" \
    --sysconfdir="/etc"
  ./mkmanpages
  make
}

check() {
  cd "trunk"

  make check
}

package() {
  cd "trunk"

  make -j 1 DESTDIR="$pkgdir" install
  install -Dm644 "mtools.conf" -t "$pkgdir/etc"
}
