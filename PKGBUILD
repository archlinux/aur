# Maintainer: M. Mastroeni <The_Maxtro AT hotmail DOT it>
# Contributor: Xwang <xwaang1976@gmail.com>

pkgname=openmodelica-git
pkgver=1.20.0.dev.r320.g9cbaf6232e
pkgrel=1
pkgdesc="The Open Source Modelica Suite"
arch=('i686' 'x86_64')
url="https://openmodelica.org"
license=('OSMC-PL')
source=("$pkgname::git+https://github.com/OpenModelica/OpenModelica"
        git+https://github.com/OpenModelica/OMOptim.git
        git+https://github.com/OpenModelica/OpenModelica-common.git
        git+https://github.com/OpenModelica/OMLibraries.git
        git+https://github.com/OpenModelica/OMSimulator.git
        git+https://github.com/OpenModelica/OMFMISimulator-3rdParty.git
        git+https://github.com/OpenModelica/OMTLMSimulator.git
        git+https://github.com/OpenModelica/OMCompiler-3rdParty
        git+https://github.com/OpenModelica/OMSens
        git+https://github.com/OpenModelica/OMSens_Qt.git)
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')
depends=('java-environment' 'lapack' #'lpsolve' 'openscenegraph' 'python' 'ruby' 'suitesparse'
         'boost-libs' 'qt5-webkit' 'qt5-xmlpatterns' 'qt5-svg' 'qt5-tools' # 'fmilib'
         )
makedepends=('git' 'gcc-fortran' 'boost' 'clang' 'cmake' 'jre-openjdk' 'antlr4-runtime' 'expat' 'ncurses' 'readline')
optdepends=('zip: requested when exporting to FMU'
			'sundials: adds more numerical solvers to the simulation runtime')
provides=('openmodelica')
conflicts=('openmodelica' 'openmodelica-svn' 'openmodelica-dev')

prepare() {

    #mkdir bin
    #ln -s /usr/bin/gfortran-9 bin/gfortran
    export PATH="$PWD/bin:$PATH"
    cd $pkgname
   
    git submodule init
           
    git config submodule.OMOptim.url "$srcdir"/OMOptim
    git config submodule.libraries.url "$srcdir"/OMLibraries
    git config submodule.OMSimulator.url "$srcdir"/OMSimulator
    git config submodule.OMCompiler-3rdParty.url "$srcdir"/OMCompiler-3rdParty
    git config submodule.OMSens.url "$srcdir"/OMSens
    git config submodule.OMSens_Qt.url "$srcdir"/OMSens_Qt
    git submodule update --remote 
    
    cd OMOptim
    git submodule init
    git config submodule.common.url "$srcdir"/OpenModelica-common
    git submodule update
    cd ..
    cd OMSimulator
    git config submodule.3rdParty.url "$srcdir"/OMFMISimulator-3rdParty
    git config submodule.OMTLMSimulator.url "$srcdir"/OMTLMSimulator
    git submodule update
    cd ..
    cd OMSens_Qt
    git submodule init
    git config submodule.common.url "$srcdir"/OpenModelica-common
    git submodule update
    cd .. 

    #cd OMSens
    #python setup.py install
    #cd ..



    #sed -i '18 i #include <qpainterpath.h>' OMPlot/qwt/src/qwt_painter_command.h
    #sed -i '16 i #include <qpainterpath.h>' OMPlot/qwt/src/qwt_null_paintdevice.h
    #sed -i '30 i #include <qpainterpath.h>' OMPlot/qwt/src/qwt_painter.cpp
    #sed -i '14 i #include <qpainterpath.h>' OMPlot/qwt/src/qwt_widget_overlay.cpp
    #sed -i '14 i #include <qpainterpath.h>' OMPlot/qwt/src/qwt_compass_rose.cpp
    #sed -i '16 i #include <qpainterpath.h>' OMPlot/qwt/src/qwt_dial_needle.cpp
}
 
pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
 
build() {
    cd $pkgname
    autoreconf -fi
    autoconf
    #export CPPFLAGS="$CPPFLAGS -DH5_USE_18_API"
    ./configure --prefix=/usr/ --without-omc --with-UMFPACK CC=clang #CXX=clang++
    make
}
 
package() {  
    cd $pkgname
    make install DESTDIR="$pkgdir"
   
    install -D -m644 "OMEdit/OMEditLIB/Resources/icons/omedit.ico" "${pkgdir}/usr/share/openmodelica/icons/omedit.ico"
    install -D -m644 "OMNotebook/OMNotebook/OMNotebookGUI/Resources/OMNotebook_icon.ico" "${pkgdir}/usr/share/openmodelica/icons/omnotebook.ico"
#   install -D -m644 "OMOptim/OMOptim/GUI/Resources/omoptim.ico" "${pkgdir}/usr/share/openmodelica/icons/omoptim.ico"
    install -D -m644 "OMShell/OMShell/OMShellGUI/Resources/omshell.ico" "${pkgdir}/usr/share/openmodelica/icons/omshell.ico"
    install -D -m644 "OMPlot/OMPlot/OMPlotGUI/Resources/icons/omplot.ico" "${pkgdir}/usr/share/openmodelica/icons/omplot.ico"
    install -D -m644 "OMCompiler/COPYING" "${pkgdir}/usr/share/licenses/openmodelica/LICENSE"
    mkdir "$pkgdir"/usr/OMSens/
    cp -r "OMSens" "$pkgdir/usr/share/OMSens" #Copy OMSens' modules in the working directory
}
