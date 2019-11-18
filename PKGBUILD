# Packager: Joseph R. Quinn <quinn.josephr@protonmail.com>
# Maintainer: Joseph R. Quinn <quinn.josephr@protonmail.com>
pkgname=php-phalcon3
pkgver=3.4.5
pkgrel=1
pkgdesc="Web framework delivered as a C-extension for PHP. 3.x version line."
arch=('i686' 'x86_64')
url="http://phalconphp.com"
license=('PHP')
depends=('php>=5.5')
makedepends=('gcc')
optdepends=('composer' 'php-fpm')
provides=('php-phalcon')
conflicts=('php-phalcon' 'php70-phalcon' 'php-phalcon-git')
backup=('etc/php/conf.d/phalcon.ini')
source=(
  "https://github.com/phalcon/cphalcon/archive/v$pkgver.zip"
  'phalcon.ini'
)
sha1sums=('31f2f0f2977332dba4fefc76d25bafe503b9afb9'
          'ed25858fa5e997332d5bbed453f54ba3c8659b13')

_PHP_VERSION=`php-config --version`
[ "${PHP_VERSION:0:1}" == "5" ] && _PHP_VERSION='php5' || _PHP_VERSION='php7'

[ $CARCH == "x86_64" ] && _arch="64bits" || _arch="32bits"

build() {
  export CPPFLAGS+="-DPHALCON_RELEASE"
  cd "$srcdir/cphalcon-$pkgver/build/$_PHP_VERSION/$_arch"
  phpize
  ./configure --prefix=/usr --enable-phalcon
  make
}

package() {
  cd "$srcdir/cphalcon-$pkgver/build/$_PHP_VERSION/$_arch"
  make INSTALL_ROOT="$pkgdir" install
  install -Dm644 "$srcdir/phalcon.ini" "$pkgdir/etc/php/conf.d/phalcon.ini"
}
