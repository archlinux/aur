# Submitter: L.G. Sarmiento <lgsarmientop-ala-unal.edu.co>
pkgname=fityk-git
_pkgname=fityk
pkgver=r1641.3967c7e
pkgrel=1
pkgdesc="A program for nonlinear fitting of analytical functions to data."
url="http://fityk.nieto.pl/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('lua' 'wxgtk' 'xylib' 'ruby' 'python')
makedepends=('boost' 'desktop-file-utils' 'git' 'python2-sphinx' 'swig')
optdepends=('gnuplot: can be used with the CLI')
provides=("fityk")
options=('!libtool')
install="fityk.install"
source=($_pkgname::git+https://github.com/wojdyr/fityk.git
       "fityk.install")
md5sums=('SKIP'
         '0f2c2b78511036ea623a9568509bc987')

#_gitroot="http://github.com/wojdyr/fityk.git"

pkgver() {
  cd ${srcdir}/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {

  cd ${srcdir}/$_pkgname

  #it doesn't build with sphinx for python3
  sed -i 's#sphinx-build#sphinx-build2#' doc/Makefile

  ./autogen.sh \
    --prefix=/usr \
    --with-wx-config=/usr/bin/wx-config
  make || return 1
}

package() {
  cd ${srcdir}/${_pkgname}
  make DESTDIR=${pkgdir} install
}
