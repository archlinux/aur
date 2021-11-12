# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=sqlcheck
pkgver=1.2
pkgrel=1
pkgdesc="Automatically identify anti-patterns in SQL queries"
arch=('x86_64')
url="https://github.com/jarulraj/sqlcheck"
license=('Apache')
depends=('gcc-libs' 'gflags')
makedepends=('cmake')
checkdepends=('gtest')
conflicts=('sqlcheck-git')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  'use-system-libs.patch'
)
sha512sums=('3234385c6d28aebc85d7ff9a8e3fdd15dbcfb9f0da4271ad65fb7de278c12c1d49877822c7243341cbdacd19b675a20a314de5a50dba6ad6c0ba539cfc536b57'
            'e43b13a2e03b5f650d00ae61c7f98a0ef1d0f3babf5a67498e66b70542abd79f7f7ce06159572d8368103e441a4d289e50f294407f76460a34d3ea7ef198164e')
b2sums=('32cccdf3e50a49536dc87d61cc2f27e960e5977f5d5c29aa4c31637d946d87576b6ec8321d4a5cb9f3ff3838d5a284e1284ca2c27acb64e7593b6a113f5dc216'
        '5e8876d212ed6a89bd789f7c15cb2c07ef975af8e51d18088e921ea11c9dcb5153e1578ba60bee2c7aee8d18cec64217f19141edc0da5335a654ad7c297a305c')

prepare() {
  cd "$pkgname-$pkgver"
  patch --forward --strip=1 --input="$srcdir/use-system-libs.patch"
}

build() {
  cmake -B build -S "$pkgname-$pkgver"
  make -C build sqlcheck
}

check() {
  make -C build test_suite test
}

package() {
  install -vDm755 -t "$pkgdir/usr/bin" build/bin/sqlcheck
}
