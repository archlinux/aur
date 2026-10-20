pkgname=pg_sift-git
pkgver=3.1.0.r209.g72aa970
pkgrel=1
pkgdesc='PostgreSQL full-text and column indexes with aggregate pushdown (development version)'
arch=('x86_64')
url='https://github.com/brauliobo/pg_sift'
license=('PostgreSQL')
depends=('postgresql>=18' 'postgresql<19' 'lz4' 'zstd')
makedepends=('git' 'make' 'gcc')
provides=("pg_sift=$pkgver")
conflicts=('pg_sift')
source=("pg_sift::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd pg_sift
  git describe --long --tags --match 'v[0-9]*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd pg_sift
  nice -n 19 make -j2 USE_PGXS=1 PG_CONFIG=/usr/bin/pg_config SIFT_TESTING= SIFT_LTO= SANITIZE=
}

package() {
  cd pg_sift
  nice -n 19 make -j2 USE_PGXS=1 PG_CONFIG=/usr/bin/pg_config SIFT_TESTING= SIFT_LTO= SANITIZE= DESTDIR="$pkgdir" install
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE NOTICE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md DESIGN.md docs/*.md
}
