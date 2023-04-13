# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=samtools-git
pkgver=1.17.r8.gc75edb00
pkgrel=1
pkgdesc="Tools for manipulating next-generation sequencing data"
arch=('i686' 'x86_64')
url="https://www.htslib.org/"
license=('MIT')
depends=('glibc' 'htslib' 'ncurses' 'zlib')
makedepends=('git')
provides=("samtools=$pkgver")
conflicts=('samtools')
source=("git+https://github.com/samtools/samtools.git")
sha256sums=('SKIP')


pkgver() {
  cd "samtools"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "samtools"

  autoreconf -fi
  ./configure \
    --prefix="/usr" \
    --with-htslib=system
  make
}

check() {
  cd "samtools"

  #make check
}

package() {
  cd "samtools"

  make DESTDIR="$pkgdir" install
  install -Dm755 "misc"/*.lua -t "$pkgdir/usr/bin"

  install -Dm644 *.h -t "$pkgdir/usr/include/bam"

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/samtools"
}
