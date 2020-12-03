# Maintainer: Timo Sarawinski <timo@it-kraut.net>
_name=igbinary
pkgname=php80-igbinary
pkgver=3.1.6
pkgrel=1
pkgdesc="A drop in replacement for the standard php serializer (PHP 8.0)"
arch=('x86_64')
url="https://github.com/igbinary/igbinary"
license=('BSD')
depends=('glibc' 'php80')
backup=("etc/php80/conf.d/${_name}.ini")
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_name}/${_name}/archive/${pkgver}.tar.gz")
sha512sums=('55f7fd1a6e2a422cf04e944c4c15126167c4aab6d4f5f1e6af8be6c345ec6ff0c25d7ea8c023062bdd4882484cede155ea7a598666e4616985873a32a0a272d1')
b2sums=('62bc77d5b3ecbccb9e928e30f33a598630d3ee9f394f4e78c0978b316d4dbc29656f98773e9ff6bd6b9cd4961f4e00c6c760b1a07234849736d4e0d9e3199d5b')

prepare() {
  mv -v "${_name}-${pkgver}" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  # disable the extension by default
  sed 's/extension/;extension/g' -i "${_name}.php.ini"
  phpize80
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr \
              --with-php-config=/usr/bin/php-config80 \
              --enable-igbinary
  make
}

check() {
  cd "$pkgname-$pkgver"
  NO_INTERACTION=1 make -k test
}

package() {
  cd "$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir/" install
  install -vDm 644 "${_name}.php.ini" "${pkgdir}/etc/php80/conf.d/${_name}.ini"
  install -vDm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm 644 {CREDITS,NEWS,README.md} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
