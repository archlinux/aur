# Mantainer: Bruno Galeotti <bgaleotti@gmail.com>

pkgname=php-twig-git
pkgver=20120813
pkgrel=1
pkgdesc="PHP Twig extension."
url="http://github.com/fabpot/Twig"
license="BSD"
arch=("any")
depends=("php")
makedepends=("git" "php")
provides=("php-twig")
conflicts=("php-twig")
replaces=("php-twig")
backup=("etc/php/conf.d/twig.ini")

_gitroot="git://github.com/fabpot/Twig.git"
_gitname="twig"

build() {
  cd ${srcdir}

  msg "Connecting to GIT server...."

  if [ -d "${srcdir}/${_gitname}" ] ; then
    cd ${_gitname} && git pull --rebase
  else
    git clone ${_gitroot} ${_gitname} --depth=1
  fi

  msg "GIT checkout done or server timeout"

  if [ -d $_gitname-build ]; then
    msg "Removing old build directory"
    rm -rf $_gitname-build
  fi

  msg "Copying repository to another build directory"
  cp -r $srcdir/$_gitname $srcdir/$_gitname-build

  msg "Starting build"
  cd $srcdir/$_gitname-build/ext/$_gitname

  msg "Running phpize"
  phpize
  ./configure --prefix=/usr --enable-twig
  make
}

package() {
  mkdir -p "$pkgdir"/{/usr/lib/php/modules,/etc/php/conf.d}

  echo ";extension=twig.so" > "twig.ini"

  install -Dm744 $srcdir/$_gitname-build/ext/$_gitname/modules/twig.so $pkgdir/usr/lib/php/modules/twig.so
  install -Dm644 twig.ini $pkgdir/etc/php/conf.d/twig.ini
}

# vim:set ts=2 sw=2 et:
