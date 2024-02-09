# Maintainer:  Maxim Novikov <the.mlex@gmail.com>

pkgname=php-pdo-oci
pkgver=8.2.14
pkgrel=1
_extname=pdo_oci
pkgdesc="PDO driver for OCI8"
arch=('x86_64')
url="https://github.com/php/php-src/tree/master/ext/pdo_oci"
license=('PHP')
depends=(
    'php>=8.2.0'
    'php-oci8>=3.3.0'
)
conflicts=('php-pdo-oci-git')
backup=('etc/php/conf.d/${_extname}.ini')
source=(
  "https://github.com/php/php-src/archive/php-${pkgver}.tar.gz"
  "patch.diff"
)
md5sums=('842d470dc47241bf2e4957c284735528' '74552b37da712404393cfca947c8e402')

build() {
  
  patch "$srcdir/php-src-php-${pkgver}/ext/${_extname}/config.m4" < "${srcdir}/patch.diff"

  cd "$srcdir/php-src-php-${pkgver}/ext/${_extname}"

  phpize
  ./configure --prefix=/usr --with-pdo-oci=instantclient,/usr
  make
}

package() {
  cd "$srcdir/php-src-php-${pkgver}/ext/${_extname}"

  make INSTALL_ROOT="${pkgdir}" install
  echo "extension=${_extname}.so" > "${_extname}.ini"
  install -D -m644 "${_extname}.ini" "${pkgdir}/etc/php/conf.d/${_extname}.ini"
}
