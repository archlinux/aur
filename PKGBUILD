# Maintainer:  Maxim Novikov <the.mlex@gmail.com>
# Contributor: Piotr Walesiuk <pwalesiuk@gmail.com>

pkgname=php-pdo-oci
pkgver=1.1.0
pkgrel=1
_extname=pdo_oci
pkgdesc="PDO driver for OCI8"
arch=('x86_64')
url="https://pecl.php.net/package/PDO_OCI"
license=('PHP')
depends=(
    'php>=8.3.0'
    'php-oci8>=3.3.0'
)
conflicts=('php-pdo-oci-git')
backup=('etc/php/conf.d/${_extname}.ini')
source=(
  "https://pecl.php.net/get/pdo_oci-${pkgver}.tgz"
  "patch.diff"
)
md5sums=('9e3888c2a1077496c5f01d60fcfb3914' '74552b37da712404393cfca947c8e402')

build() {
  
  patch "$srcdir/pdo_oci-${pkgver}/config.m4" < "${srcdir}/patch.diff"

  cd "$srcdir/pdo_oci-${pkgver}"

  phpize
  ./configure --prefix=/usr --with-pdo_oci=shared,instantclient,/usr
  make install
}

package() {
  cd "$srcdir/php-src-php-${pkgver}/ext/${_extname}"

  make INSTALL_ROOT="${pkgdir}" install
  echo "extension=${_extname}.so" > "${_extname}.ini"
  install -D -m644 "${_extname}.ini" "${pkgdir}/etc/php/conf.d/${_extname}.ini"
}
