# Maintainer: Romain Beucher <rbeucher@thermo-geology.fr>
pkgname=underworld2-git
pkgver=r1454.078b148
pkgrel=1
pkgdesc=""
arch=('x86_64')
url="http://underworldcode.org"
license=('GPL')
groups=()
depends=('openmpi' 'hdf5-openmpi' 'petsc' 'python2-matplotlib' 'python2-numpy' 'python2-mpi4py'
         'python2-h5py-openmpi' 'swig' )
makedepends=('git' 'gcc-fortran' 'swig') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('underworld2::git+https://github.com/underworldcode/underworld2#branch=development')
noextract=()
md5sums=('SKIP')

_install_dir=/opt

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
        sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
            -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
            -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
            -e "s|python -c|python2 -c|" \
            -i $(find . -name '*.py')
        export PETSC_DIR=/opt/petsc/linux-c-opt/
        export PETSC_INC_DIR=/opt/petsc/linux-c-opt/include
        export PETSC_LIB_DIR=/opt/petsc/linux-c-opt/lib
          
}

build() {
	cd "$srcdir/${pkgname%-git}"
        cd libUnderworld
        ./configure.py
        ./compile.py
        rm -fr h5py_ext              
        rm .sconsign.dblite          
        rm -fr .sconf_temp           
        cd build                     
        rm -fr libUnderworldPy       
        rm -fr StGermain             
        rm -fr gLucifer              
        rm -fr Underworld            
        rm -fr StgFEM                
        rm -fr StgDomain             
        rm -fr PICellerator          
        rm -fr Solvers               
}

package() {
        _build_dir="$srcdir/${pkgname%-git}" 

        mkdir -p ${pkgdir}/opt
        cp -rf $_build_dir ${pkgdir}/opt

	mkdir -p ${pkgdir}/usr/share/licenses/$pkgname
        cp $_build_dir/LICENSE.md ${pkgdir}/usr/share/licenses/$pkgname/

        mkdir -p ${pkgdir}/etc/profile.d
	echo "export PYTHONPATH=$_install_dir/underworld2:$_install_dir/underworld2/glucifer:$PYTHONPATH" > ${pkgdir}/etc/profile.d/underworld.sh
	chmod +x ${pkgdir}/etc/profile.d/underworld.sh
}
