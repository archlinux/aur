# Maintainer: Anton Kudelin <kudelin at protonmail dot com>
# Contributor:  saxonbeta <saxonbeta [[at]] gmail _dot com
# Contributor: Randy Heydon <randy dot heydon at clockworklab dot net>

pkgname=elmerfem
pkgver=8.4
pkgrel=1
pkgdesc="A finite element software for multiphysical problems"
arch=('x86_64')
url="http://www.elmerfem.org"
license=('GPL')
depends=('arpack' 'blas' 'qt5-base' 'qt5-script' 'glu')
makedepends=('gcc-fortran' 'cmake')
conflicts=('elmerfem-git')
options=(!emptydirs !makeflags)
source=("https://github.com/ElmerCSC/$pkgname/archive/release-$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('cc3ce807d76798361592cc14952cdc3db1ad8f9bac038017514033ce9badc5b3'
            'f4b39389e5f258c7860b8d7a6b171fb54bf849dc772f640ac5e7a12c7a384aca')            
            
build() {
    mkdir $srcdir/$pkgname-release-$pkgver/bld
    cd $srcdir/$pkgname-release-$pkgver/bld
    cmake .. \
            -DCMAKE_INSTALL_PREFIX=/usr \
            -DELMER_INSTALL_LIB_DIR=/usr/lib \
            -DWITH_CONTRIB=ON \
            -DWITH_ELMERGUI=ON \
            -DWITH_ElmerIce=ON \
            -DWITH_LUA=ON \
            -DWITH_MATC=ON \
            -DWITH_MPI=ON \
            -DWITH_OpenMP=ON \
            -DWITH_QT5=ON \
            -DWITH_ScatteredDataInterpolator=ON
    make all
}


package() {
    cd $srcdir/$pkgname-release-$pkgver/bld
    make DESTDIR=$pkgdir install
    
    # Remove unecessary libraries    
    rm -rf -- $pkgdir/usr/lib/{*.a,*arpack.so,ElmerGUI} 
    
    #Create directories
    install -dv $pkgdir/usr/share/applications
    install -dv $pkgdir/usr/share/pixmaps
    install -dv $pkgdir/usr/share/licenses/$pkgname
    
    #Icon and desktop files
    install -D -m644 ../ElmerGUI/Application/images/logo.png $pkgdir/usr/share/pixmaps/$pkgname.png
    install -D -m644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications

    #Clean up and move stuff in place
    cp $pkgdir/usr/share/ElmerGUI/edf-extra/* $pkgdir/usr/share/ElmerGUI/edf
    mv $pkgdir/usr/share/ElmerGUI/license_texts/GPL_EXCEPTION $pkgdir/usr/share/licenses/$pkgname
    rm $pkgdir/usr/share/ElmerGUI/license_texts/*
}
