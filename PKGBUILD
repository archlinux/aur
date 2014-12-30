# Maintainer: Maurizio D'Addona <mauritiusdadd@gmail.com>

_svnname='libsnl'

pkgname=libsnl-svn
pkgver=18
pkgrel=4
pkgdesc="libSNL is a library of routines used for the manipulation of NURBS curves and surfaces."
arch=('i686' 'x86_64')
url="http://libsnl.sourceforge.net/"
license=('GPL2')
provides=('libsnl')
conflicts=('libsnl')
depends=()
makedepends=('svn')

source=("$_svnname::svn://svn.code.sf.net/p/$_svnname/code/trunk")
md5sums=('SKIP')

pkgver() 
{
    cd "$srcdir/$_svnname"
    local ver="$(svnversion)"
    printf "%s" "${ver//[[:alpha:]]}"
}

prepare()
{
    cd "$srcdir/$_svnname/src"
    oldflags="export cflags = -Wall -fPIC -g"
    newflags="export cflags = -Wall -fPIC -O2 -g"
    sed -i -e "s/$oldflags/$newflags/g" ./makefile
}

build() 
{
    cd "$srcdir/$_svnname/src"
    msg "Building..."
    export CXXFLAGS="${CXXFLAGS} -O2"
    export CFLAGS="${CFLAGS} -O2"
    make
    msg2 "Build complete."
}

package()
{
    cd "$srcdir/$_svnname/src"
    msg "Copying files..."
    install -Dm644 libSNL.so.0.2 $pkgdir/usr/lib/libSNL.so.0.2
    ln -s libSNL.so.0.2 $pkgdir/usr/lib/libSNL.so
    install -d $pkgdir/usr/include/libSNL
    cp *.h $pkgdir/usr/include/libSNL
} 