# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=opencalphad-git
_pkgbase=opencalphad
pkgver=5.041
pkgrel=1
pkgdesc="A thermodynamic calculation code"
arch=('x86_64')
license=('GPL')
url="http://www.opencalphad.com"
depends=('gcc-libs')
makedepends=('gcc-fortran' 'git' 'sed')
conflicts=("$_pkgbase")
source=("git+https://github.com/sundmanbo/opencalphad.git")
sha256sums=('SKIP')

pkgver() {
    cd $_pkgbase
    grep "version=" $srcdir/$_pkgbase/pmain1-save.F90 | sed 's/[^0-9,.]*//g'
}

build() {
    cd $srcdir/$_pkgbase
    sed -i 's/#gcc -c -DLinux/gcc -c -DLinux/g' Makefile
    make -j1 FCOPT="$FCFLAGS -fopenmp"
}

package() {
    cd $srcdir/$_pkgbase
    install -dm755 $pkgdir/usr/{bin,share/$_pkgbase/{documentation,manual}}
    install -m755 oc5P $pkgdir/usr/bin
    install -m755 documentation/*.pdf $pkgdir/usr/share/$_pkgbase/documentation
    install -m755 manual/*.pdf $pkgdir/usr/share/$_pkgbase/manual
}
