# Maintainer: M. Mastroeni <The_Maxtro AT hotmail DOT it>
# Contributor: Xwang <xwaang1976@gmail.com>

pkgname=openmodelica-git
pkgver=1.16.0.dev.r267.g0c0d97d31
pkgrel=3
pkgdesc="The Open Source Modelica Suite"
arch=('i686' 'x86_64')
url="https://openmodelica.org"
license=('OSMC-PL')
depends=('java-environment' 'lpsolve' 'openscenegraph' 'python' 'ruby' 'suitesparse' 'qt5-webkit' 'qt5-xmlpatterns'  'fmilib'  'qwt' 'coin-or-ipopt' 'python2' 'lib32-gcc-libs' 'lib32-zlib')
makedepends=('autoconf' 'automake' 'libtool' 'gcc' 'gcc-fortran-multilib' 'boost' 'clang' 'cmake' 'jre7-openjdk' 'antlr2' 'subversion' 'lib32-expat' 'lib32-ncurses' 'lib32-readline')
provides=('openmodelica')
conflicts=('openmodelica' 'openmodelica-svn' 'openmodelica-dev')
#source=('git+https://github.com/ppenguin/OpenModelica.git')
#md5sums=('SKIP')

prepare() {
    # clone all submodules
    #place for openmodelica-git.sh
    #./openmodelica-git.sh
    
    mkdir -p "$srcdir/$pkgname"
    if [ ! -d "$srcdir/$pkgname/.git" ]; then
        MY_FORK=MyGitHubUserName ; git clone https://github.com/ppenguin/OpenModelica --recursive && (cd OpenModelica && git remote set-url --push origin git@github.com:$MY_FORK/OpenModelica.git && git submodule foreach --recursive 'git remote set-url --push origin `git config --get remote.origin.url | sed s,^.*/,git@github.com:'$MY_FORK'/,`')
         echo "***** CLONING COMPLETED!!!!! ****"
    fi
}
 
#pkgver() {
    #cd "$pkgname"
    #git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
#}
 
build() {
cd "$srcdir/OpenModelica"
./build.sh
make -j1
}
 
package() {  
    cd "$srcdir/OpenModelica" 
    make install DESTDIR=${pkgdir}
    
    install -D -m644 "OMEdit/OMEditLIB/Resources/icons/omedit.ico" "${pkgdir}/opt/OpenModelica/share/icons/omedit.ico"
    install -D -m644 "OMNotebook/OMNotebook/OMNotebookGUI/Resources/OMNotebook_icon.ico" "${pkgdir}/opt/OpenModelica/share/icons/omnotebook.ico"
#   install -D -m644 "OMOptim/OMOptim/GUI/Resources/omoptim.ico" "${pkgdir}/opt/OpenModelica/share/icons/omoptim.ico"
    install -D -m644 "OMShell/OMShell/OMShellGUI/Resources/omshell.ico" "${pkgdir}/opt/OpenModelica/share/icons/omshell.ico"
    install -D -m644 "OMPlot/OMPlot/OMPlotGUI/Resources/icons/omplot.ico" "${pkgdir}/opt/OpenModelica/share/icons/omplot.ico"
    install -D -m644 "OMCompiler/COPYING" "${pkgdir}/usr/share/licenses/openmodelica/LICENSE"
#    mkdir ${pkgdir}/usr/OMSens/
    cp -r "OMSens" "${pkgdir}/opt/OpenModelica" #Copy OMSens' modules in the working directory
#This MANUALLY solves the issues about the folders; otherwise a patch will be needed
#    rmdir usr/OMSens
#    mv "${pkgdir}/usr/share/openmodelica/icons/" "${pkgdir}/opt/OpenModelica/share/icons/"
    echo "OMSens is now in /opt/OpenModelica"
}
