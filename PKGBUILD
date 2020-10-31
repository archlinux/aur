# Packager: Joseph R Quinn <quinn.josephr@protonmail.com>
# Maintainer: Joseph R Quinn <quinn.josephr@protonmail.com>
pkgname=php-phalcon-git
_pkgname=cphalcon
pkgver=4.1.0
pkgrel=1
pkgdesc="High performance, full-stack PHP framework delivered as a C extension. Git package."
arch=('i686' 'x86_64')
url="https://phalcon.io/"
license=('BSD')
depends=('php>=5.5' 'php-psr' 're2c' 'pcre')
makedepends=('git' 'gcc')
optionaldepends=('php-sqlite: Sqlite support'
  'php-pgsql: PgSQL backend model support' 
  'php-mongodb: MongoDB ODM support'
  'php-redis: Redis caching support'
  'phalcon-devtools'
  'php-scrypt'
  'php-sodium'
  'php-twig'
  'php-yaml'
  'php-memcached'
  'php-gd'
  'curl'
  'php-imagick')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'php70-phalcon' 'php-phalcon3')
backup=('etc/php/conf.d/phalcon.ini')
source=("$_pkgname::git+https://github.com/phalcon/cphalcon.git"
  'phalcon.ini')
sha1sums=('SKIP'
          'ed25858fa5e997332d5bbed453f54ba3c8659b13')

_PHP_VERSION=`php-config --version`
[ "${PHP_VERSION:0:1}" == "5" ] && _PHP_VERSION='php5' || _PHP_VERSION='php7'

[ $CARCH == "x86_64" ] && _arch="64bits" || _arch="32bits"

pkgver() {
  cd $_pkgname
  printf "%s" "$(git describe --abbrev=0 --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/v//g')"
}

build() {
  export CPPFLAGS+="-DPHALCON_RELEASE"
  cd "$srcdir/$_pkgname/build/$_PHP_VERSION/$_arch"
  phpize
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname/build/$_PHP_VERSION/$_arch"
  make INSTALL_ROOT="$pkgdir" install
  install -Dm644 "$srcdir/phalcon.ini" "$pkgdir/etc/php/conf.d/phalcon.ini"
  install -Dm644 "$srcdir/$_pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/php-phalcon/LICENSE.txt"
}
