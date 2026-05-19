# Maintainer:  Maxim Novikov <the.mlex@gmail.com>
# Contributor: Piotr Walesiuk <pwalesiuk@gmail.com>

pkgname=php-pdo-oci
pkgver=1.2.0
pkgrel=1
_extname=pdo_oci
pkgdesc="PDO driver for OCI8"
arch=('x86_64')
url="https://pecl.php.net/package/PDO_OCI"
license=('PHP')
depends=(
    'php>=8.3.0'
    'php-oci8>=3.4.0'
)
conflicts=('php-pdo-oci-git')
backup=('etc/php/conf.d/${_extname}.ini')
source=(
  "https://pecl.php.net/get/${_extname}-${pkgver}.tgz"
  "patch.diff"
)

sha256sums=('c55e59bceb68c243e7b6ea90d1d4b28690b997e30392f10a1e8462f12d3f937e'
            '838804413b28dab6ff03b64f7a4b419419fcdfc8b738191d7df461089dc653eb')

build() {
  
  patch "$srcdir/pdo_oci-${pkgver}/config.m4" < "${srcdir}/patch.diff"

  cd "${_extname}-${pkgver}"

  phpize
  ./configure --prefix=/usr --with-pdo_oci=shared,instantclient,/usr
  make
}

package() {
  cd "${_extname}-${pkgver}"

  make INSTALL_ROOT="${pkgdir}" install
  echo "extension=${_extname}.so" > "${_extname}.ini"
  install -D -m644 "${_extname}.ini" "${pkgdir}/etc/php/conf.d/${_extname}.ini"
}
