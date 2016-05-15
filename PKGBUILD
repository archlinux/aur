# Maintainer:  saxonbeta <saxonbeta [[at]] gmail _dot com
# Contributor: Randy Heydon <randy dot heydon at clockworklab dot net>

pkgname=elmerfem
pkgver=8.2
pkgrel=2
pkgdesc="Simulation tool for CFD, FEM, electromagnetics, heat transfer and others featuring a PDE solver."
arch=('i686' 'x86_64')
url="http://www.csc.fi/english/pages/elmer"
license=('GPL')
depends=('qwt' 'vtk-qt4' 'arpack' 'glu' 'tk' 'paraview-salome')
makedepends=('gcc-fortran' 'cmake')
conflicts=('elmerfem-git')
options=(!emptydirs !makeflags)

#Use custom VTK-QT4 package
_VTK_ROOT_DIR=/opt/vtk-qt4

source=("https://github.com/ElmerCSC/$pkgname/archive/release-$pkgver.tar.gz"
        "$pkgname.desktop"
        "cmake_vtk.patch"
        "elmerfem.sh")
sha256sums=('ed4c87895c76003dd81faa464b6d0f38225d43e584f75290df21df629d0a4ecc'
            'd2e9f6f2ced11d845149721371ca15d15f9983a34eedc35a88263f8368f721ab'
            '6012ac4784bcaa24f3bc408ae0bacaf7e9d7f8708875c937232da29ddcbbcc58'
            '394b5c5d73e453397f4fdcf6e5bdc63349721607352ca5af61a80c1cc1bb93b4')


prepare() {
    cd "$srcdir/$pkgname-release-$pkgver"
    patch -p1 < "${srcdir}/cmake_vtk.patch"
}
            
            
build() {
    cd "$srcdir/$pkgname-release-$pkgver"

    
    _LDFLAGS="-L${_VTK_ROOT_DIR}/lib -lX11 "
    _LDFLAGS+=$LDFLAGS
    LDFLAGS=$_LDFLAGS
	export LDFLAGS
    cmake  \
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
        -DWITH_ELMERPOST:BOOL=TRUE \
        -DVTK_ROOT_DIR:PATH=$_VTK_ROOT_DIR
    make all
}


package() {
    cd "$srcdir/$pkgname-release-$pkgver"
    make DESTDIR="$pkgdir" install
    
    #Create directories
    install -dv "${pkgdir}/usr/share/applications/"
    install -dv "${pkgdir}/usr/share/pixmaps/"
    install -dv "${pkgdir}/usr/share/licenses/${pkgname}/"
    
    #Icon and desktop files
    install -D -m644 "ElmerGUI/Application/images/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"
    
    #Enable parallel solver
    ln -s ElmerSolver_mpi "${pkgdir}/usr/bin/ElmerSolver"
    
    #ld configuration
    install -D -m 755 "${srcdir}/elmerfem.sh" "${pkgdir}/etc/profile.d/elmerfem.sh"

    #Clean up and move stuff in place
    rm -- "$pkgdir"/usr/lib/{libparpack.so,libarpack.so}
    mv "$pkgdir"/usr/share/elmersolver/lib/*.so "$pkgdir"/usr/lib
    cp "$pkgdir"/usr/share/ElmerGUI/edf-extra/* "$pkgdir"/usr/share/ElmerGUI/edf/
    mv "$pkgdir"/usr/share/ElmerGUI/license_texts/GPL_EXCEPTION "$pkgdir"/usr/share/licenses/${pkgname}/
    rm "$pkgdir"/usr/share/ElmerGUI/license_texts/*
}
 
