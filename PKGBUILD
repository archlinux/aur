# Maintainer: Omar Sandoval <osandov at osandov dot com>

pkgname=fio-git
_pkgname=fio
pkgver=3.40.r97.g83a809b
pkgrel=1
pkgdesc='Scriptable I/O tool for storage benchmarks and drive testing'
arch=(i686 x86_64)
url='https://github.com/axboe/fio'
license=(GPL2)
# TODO: enable rdma
depends=(bash libaio python numactl glusterfs gperftools)
makedepends=(git gtk2 curl)
optdepends=(
  'gtk2: for gfio - fio GUI frontend'
  'curl: for gfio - fio GUI frontend'
  'gnuplot: generating plots using fio_generate_plots'
)
conflicts=('fio')
provides=('fio')
source=("$_pkgname::git+https://github.com/axboe/fio.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --abbrev=7 --long | sed 's/^fio-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  ./configure --enable-gfio --extra-cflags="$CFLAGS"
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" prefix=/usr mandir=/usr/share/man install

  # documentation
  install -dm755 "$pkgdir/usr/share/doc/$_pkgname"
  install -m644 HOWTO.rst README.rst REPORTING-BUGS SERVER-TODO "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/COPYING"
  install -Dm644 MORAL-LICENSE "$pkgdir/usr/share/licenses/$_pkgname/MORAL-LICENSE"

  # examples
  install -dm755 "$pkgdir/usr/share/doc/$_pkgname/examples"
  install -m644 examples/* "$pkgdir/usr/share/doc/$_pkgname/examples"
}

# vim:set ts=2 sw=2 et:
