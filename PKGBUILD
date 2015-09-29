# Contributor: Randy Heydon <randy dot heydon at clockworklab dot net>
# Maintainer:  saxonbeta <saxonbeta at gmail __com
pkgname=elmerfem
pkgver=8.0
pkgrel=7
pkgdesc="Simulation tool for CFD, FEM, electromagnetics, heat transfer and others featuring a PDE solver."
arch=('i686' 'x86_64')
url="http://www.csc.fi/english/pages/elmer"
license=('GPL')
depends=('qwt' 'vtk' 'arpack' 'glu' 'tk' 'paraview-salome')
makedepends=('gcc-fortran' 'cmake')
conflicts=('elmerfem-git')
options=(!emptydirs !makeflags)

source=("https://github.com/ElmerCSC/$pkgname/archive/release-$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('ac7cb29e1dba205113ed9705a5852ee11117252495fa2b125adecd2b057c8a8f'
            'd2e9f6f2ced11d845149721371ca15d15f9983a34eedc35a88263f8368f721ab')


build() {
    cd "$srcdir/$pkgname-release-$pkgver"
    export LDFLAGS="-lX11"
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DELMER_INSTALL_LIB_DIR=/usr/lib \
        -DELMER_SOLVER_HOME=/usr/share/elmersolver \
        -DWITH_MPI:BOOL=TRUE \
        -DWITH_OpenMP:BOOL=TRUE \
        -DWITH_QWT:BOOL=TRUE \
        -DWITH_VTK:BOOL=TRUE \
        -DWITH_PARAVIEW:BOOL=TRUE \
        -DWITH_ELMERGUI:BOOL=TRUE \
        -DWITH_ELMERGUILOGGER:BOOL=TRUE \
        -DWITH_ELMERPOST:BOOL=TRUE
        
    make all
}


package() {
    cd "$srcdir/$pkgname-release-$pkgver"
    make DESTDIR="$pkgdir" install
    
    #Create directories
    mkdir -p "${pkgdir}/usr/share/applications/"
    mkdir -p "${pkgdir}/usr/share/pixmaps/"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
    
    #Icon and desktop files
    install -D -m644 "ElmerGUI/Application/images/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"
    
    #Enable parallel solver
    ln -s ElmerSolver_mpi "${pkgdir}/usr/bin/ElmerSolver"
    
    #Clean up and move stuff in place
    rm -- "$pkgdir"/usr/lib/{libparpack.so,libarpack.so}
    mv "$pkgdir"/usr/share/elmersolver/lib/*.so "$pkgdir"/usr/lib
    cp "$pkgdir"/usr/share/ElmerGUI/edf-extra/* "$pkgdir"/usr/share/ElmerGUI/edf/
    mv "$pkgdir"/usr/share/ElmerGUI/license_texts/GPL_EXCEPTION "$pkgdir"/usr/share/licenses/${pkgname}/
    rm "$pkgdir"/usr/share/ElmerGUI/license_texts/*
}
 
