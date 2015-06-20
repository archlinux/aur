 
# Maintainer: Xwang <xwaang1976@gmail.com>
pkgname=openmodelica-git
pkgver=1.9.3.dev.r335.g8c5d48e
pkgrel=2
pkgdesc="The Open Source Modelica Suite"
arch=('i686' 'x86_64')
url="https://openmodelica.org"
license=('GPL3')

depends=('java-environment' 'lpsolve' 'hdf5-openmpi' 'omniorb' 'openscenegraph' 'qtwebkit' 'sundials' 'libatomic_ops' 'python' 'gtkglext' 'ruby' 'ipopt' 'qjson' 'suitesparse' 'boost-libs')

makedepends=('autoconf' 'automake' 'libtool' 'gcc' 'gcc-fortran-multilib' 'boost' 'clang' 'cmake' 'jre7-openjdk' 'antlr2' 'subversion' 'lib32-expat' 'lib32-ncurses' 'lib32-readline')

conflicts=('openmodelica-svn')

#source=('openmodelica::git+https://openmodelica.org/git-readonly/OpenModelica.git')
source=()
md5sums=()

_gitmod="openmodelica"

pkgver() {
    cd "${srcdir}/${_gitmod}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}"
   
    if [ -d ${_gitmod} ] ; then
         msg "Directory ${srcdir}/${_gitmod} already exists: updating from git ... "
         cd "${_gitmod}" 
         git pull --recurse-submodules && git submodule update --recursive
         msg "The local files are updated."
    else
        msg "Directory ${srcdir}/${_gitmod} does not exist: cloning from git ... "
        git clone https://openmodelica.org/git-readonly/OpenModelica.git "${_gitmod}" --recursive
        msg "Cloning completed."
    fi
    sleep 10
   
    #rm -r -f "${srcdir}/${_gitmod}"
    #git clone https://openmodelica.org/git-readonly/OpenModelica.git "${_gitmod}" --recursive
}



build() {
    cd "${srcdir}/${_gitmod}"
    autoconf
    ./configure --prefix=/usr/ --with-omniORB  --with-cppruntime --with-lapack='-llapack -lblas'
    make
}

#check() {
#   cd "${srcdir}/${_svnmod}"
#   make test
#}

package() {
    mkdir -p ${pkgdir}/usr/
    cd "${srcdir}/${_gitmod}"
    cp -r build/bin/ ${pkgdir}/usr/bin/
    cp -r build/include/ ${pkgdir}/usr/include/
    cp -r build/lib/ ${pkgdir}/usr/lib/
    cp -r build/share/ ${pkgdir}/usr/share/
}
