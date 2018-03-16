# Maintainer: James An <james@jamesan.ca>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=php-suhosin7-git
_pkgname=${pkgname%-git}
__pkgname=${_pkgname#php-}
pkgver=0.10.0dev.r58.ge55e273
pkgrel=2
pkgdesc='An advanced protection system for PHP installations'
arch=('i686' 'x86_64')
url='http://suhosin.org/'
license=('PHP')
depends=('php')
checkdepends=('php-cgi')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
backup=("etc/php/conf.d/$__pkgname.ini")
source=("$_pkgname"::"git+https://github.com/sektioneins/$__pkgname.git"
        'php-7.2.patch')
md5sums=('SKIP'
         '70da87c05c34e16f6953f27b9cc13e74')

prepare() {
  cd $_pkgname
  
  patch -p1 < ../php-7.2.patch
}

build() {
  cd $_pkgname

  phpize
  ./configure --prefix=/usr --enable-$__pkgname --enable-$__pkgname-experimental --enable-static=no
  make
}

check() {
  cd $_pkgname

  make test NO_INTERACTION=1 REPORT_EXIT_STATUS=1
}

package() {
  cd $_pkgname

  make INSTALL_ROOT=$pkgdir install
  install -D -m644 $__pkgname.ini $pkgdir/etc/php/conf.d/$__pkgname.ini
}
