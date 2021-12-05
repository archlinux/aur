# Maintainer: Jamie Christian <itschristian at gmail dot com>

_pkgname=openglide
pkgbase=openglide-git
pkgname=openglide-git
pkgver=last.cvs.r50.g1ecc60a
pkgrel=1
pkgdesc="Glide wrapper, useful for DOSBox with Glide support"
arch=(i686 x86_64)
url="https://github.com/voyageur/openglide"
license=('GPL2')
options=(!libtool)
depends=('mesa' 'sdl' 'glu' 'libsm')
makedepends=('git')
conflicts=('openglide-cvs')
source=("$_pkgname::git+https://github.com/voyageur/openglide")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  
  sed -e '/install-data-hook/,/$p/d' -i Makefile.am
  # Fix autoconf files
  sed -e 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/' \
      -i configure.ac
  sed -e '/INCLUDES/d' -i Makefile.am

}

build() {
  cd "$srcdir/$_pkgname"

  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/" install
}
