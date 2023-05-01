# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds

pkgname=php-zstd
_pkgname=php-ext-zstd
pkgdesc='Zstd Extension for PHP'
pkgver=0.12.3
pkgrel=1
arch=('x86_64')
url='https://github.com/kjdev/php-ext-zstd'
license=('MIT')
depends=('php' 'zstd')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kjdev/$_pkgname/archive/$pkgver.tar.gz"
  'zstd.ini')
sha256sums=('e55ac40e9997272ce68352973204131aee3366105f2dd38d1cd73251090ff8f4'
            '2b68270574fcc8234d0e8ed8d7ac6bbecd68b20b9a72c049c3a8e2e309d90304')

prepare() {
  cd "$_pkgname-$pkgver"
  phpize
}

build() {
  cd "$_pkgname-$pkgver"
  ./configure --prefix=/usr --with-libzstd
  make
}

check() {
  cd "$_pkgname-$pkgver"
  NO_INTERACTION=true make test
}

package() {
  cd "$_pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir/" install
  install -D -m644 "${srcdir}/zstd.ini" "${pkgdir}/etc/php/conf.d/zstd.ini"
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
