# Maintainer; Eugene Lamskoy <e.lamskoy@gmail.com>
_pecl=PDO_DBLIB
_ext=pdo_dblib
pkgname="php-${_ext}"
pkgver=1.0
pkgrel=2
pkgdesc="pdo_dblib extension for PHP"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/${_pecl}"
license=('PHP')
depends=('php' 'freetds')
makedepends=('php')
source=(
    http://pecl.php.net/get/${_pecl}-${pkgver}.tgz
    'freetds.patch'
    'php-54.patch'
)
install="php-${_ext}.install"

build() {
  cd "$srcdir/${_pecl}-${pkgver}"
  phpize
  patch -i ${srcdir}/freetds.patch -p0 || exit 1
  _phpversion=$(php-config --vernum)
  if [ $_phpversion -ge 50400 ]; then
      echo "PHP 5.4.0+ detected, applying additional patch";
      patch -i ${srcdir}/php-54.patch -p0 || exit 1;
  fi;
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${_pecl}-$pkgver"

  make INSTALL_ROOT="$pkgdir" install
  echo ";extension=${_ext}.so" > "${_ext}.ini"
  install -Dm644 "${_ext}.ini" "$pkgdir/etc/php/conf.d/${_ext}.ini"
}

md5sums=('017135f92597e02dcacf1c37319f3b2a'
         '77d3243e4a137bd199ac403caf12a002'
         '75b34f46f3c964904e6a54cf3614cee4')
