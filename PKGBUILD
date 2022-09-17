# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Sean Anderson <seanga2@gmail.com>

pkgname=citus
pkgver=11.1.1
pkgrel=1
pkgdesc='Scalable PostgreSQL for multi-tenant and real-time workloads'
arch=('x86_64')
url='https://www.citusdata.com'
license=('AGPL3' 'MIT' 'BSD' 'custom:PostgreSQL')
depends=(
  'glibc'
  'postgresql'
  'lz4'
  'zstd'
  'curl'
  'openssl'
)
makedepends=(
  'git'
  'postgresql-libs'
  'llvm'
  'clang'
)
install='citus.install'
_commit='b7ae596fe8a4758f251cafc6ebb95ae9b971d202'
source=("$pkgname::git+https://github.com/citusdata/citus#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

build() {
  cd "$pkgname"

  ./configure --prefix=/usr

  make
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir" install

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.{md,png}

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" NOTICE
}
