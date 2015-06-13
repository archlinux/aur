# Maintainer:  Daniel YC Lin <dlin.tw@gmail.com>

pkgname=sockperf-git
pkgver=r145.e12372b
pkgrel=1
pkgdesc='A benchmarking utility for measuring network performance (latency and throughput) over socket API, with focus on high performance systems'
url='https://github.com/mellanox/sockperf'
license=('custom') # BSD-3
arch=('i686' 'x86_64')
source=('repo::git+https://github.com/Mellanox/sockperf.git#branch=sockperf_v2')
md5sums=('SKIP')
depends=('bash' gawk )
makedepends=(doxygen)
pkgver() {
  cd repo
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
  cd repo
  ./autogen.sh
  ./configure --prefix=/usr --enable-test --enable-doc --enable-tool
  make
  cd doc
  make
}

package() {
  cd repo
  # dirty hack, just forgive the bad 'make install'
  make DESTDIR="$pkgdir" install || true

  # dirty hack2 set to standard path
  mkdir -p $pkgdir/etc
  mv $pkgdir/usr/etc/sockperf $pkgdir/etc/sockperf
  rm -rf $pkgdir/usr/etc $pkgdir/usr/share/sockperf # remove wrong place

  # license
  install -D -m 644 copying "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 doc/man/man/man3/sockperf.3 $pkgdir/usr/share/man/man3/sockperf.3
}

# vim:set ts=2 sw=2 et:
