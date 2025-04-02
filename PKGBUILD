# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Sean Anderson <seanga2@gmail.com>

pkgname=citus
pkgver=13.0.3
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
source=("$pkgname::git+https://github.com/citusdata/citus#commit=v$pkgver")
b2sums=('a46030e5bbc91f71f33418acac70c5fb1f4e524eaea1515f7426d2b325a5385f73aef0c8e2802d784e7928a0b43d7eceb78924161bb71a05988e88975fa3eb44')

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
