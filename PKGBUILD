# Maintainer: Myles English <myles at rockhead dot biz>
pkgname=petsc-maint
_pkgname=petsc
pkgver=54093.928c5b4
pkgrel=1
_config=arch-linux2-cxx-opt
# if --with-debugging=yes is set then PETSC_ARCH is automatically set to
#"arch-linux2-cxx-debug" for some things, so the _config should be changed too
#_config=arch-linux2-cxx-debug
pkgdesc="Portable, extensible toolkit for scientific computation"
arch=('i686' 'x86_64')
url="http://www.mcs.anl.gov/petsc/petsc-as"
license=('MIT compatible')
options=(staticlibs)
depends=('python2' 'openmpi' 'boost' 'lapack')
makedepends=('gcc' 'gcc-fortran' 'cmake' 'git')
provides=('petsc')
conflicts=('petsc')
install=petsc.install
source=(git+https://bitbucket.org/petsc/petsc#branch=maint)
md5sums=('SKIP')

_install_dir=/opt/petsc/${_config}

# to avoid: "make[2]: *** No rule to make target `libptesmumps.a', needed by `main_esmumps'.  Stop."
export MAKEFLAGS="-j1"

pkgver() {
  cd "$_pkgname"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	_build_dir="${srcdir}/${_pkgname}"

	cd ${_build_dir}
	#patch -Np1 -i ${startdir}/patch_debug.diff

	unset PETSC_ARCH
	export PETSC_DIR=${_build_dir}

	find ${srcdir} -name "*" -type f -exec \
	sed -i 's#\(/usr/bin/env \|/usr/bin/\)python[2-3]*#\1python2#' {} \;
	sed -i 's/self.publicInstall    = 1/self.publicInstall    = 0/' ${_build_dir}/config/BuildSystem/config/package.py

	CONFOPTS="--with-shared-libraries=1 --with-clanguage=C++ --COPTFLAGS=-O2 --CXXOPTFLAGS=-O2"

	# External downloads
	for external_pkg in ptscotch scalapack metis parmetis superlu mumps pastix hypre suitesparse; do
		CONFOPTS="${CONFOPTS} --download-${external_pkg}=yes"
	done

	if [ "${TRILINOS_DIR}" ]; then
		CONFOPTS="${CONFOPTS} --with-ml=1 --with-ml-lib=${TRILINOS_DIR}/lib/libml.so --with-ml-include=${TRILINOS_DIR}/include"
	fi

	# Arch specific
	CONFOPTS="${CONFOPTS} --with-boost=1 --with-boost-dir=/usr"

	# to enable use of type()
	CONFOPTS="${CONFOPTS} --with-fortran-datatypes --FOPTFLAGS=-O2"

	python2 ./configure \
		--prefix=${_install_dir} \
		--PETSC_ARCH=${_config} \
		${CONFOPTS}

	make ${MAKEFLAGS} PETSC_DIR=${_build_dir} PETSC_ARCH=${_config} all
}

package() {
	_build_dir="${srcdir}/${_pkgname}"
	_dest_dir="${pkgdir}${_install_dir}"
	cd ${_build_dir}
	echo "make ${MAKEFLAGS} PETSC_DIR=${_build_dir} PETSC_ARCH=${_config} DESTDIR=${_dest_dir} install"
	export PETSC_DIR=${_build_dir}
	make ${MAKEFLAGS} PETSC_DIR=${_build_dir} PETSC_ARCH=${_config} DESTDIR=${_dest_dir} install   # > /dev/null

 	sed -i 's#'"${_build_dir}"'#'"${_install_dir}"'#g' "${_dest_dir}/lib/pkgconfig/PETSc.pc"
 	sed -i 's#'"${_build_dir}"'#'"${_install_dir}"'#g' "${_dest_dir}/lib/petsc/conf/variables"
 	sed -i 's#'"${_build_dir}"'#'"${_install_dir}"'#g' "${_dest_dir}/lib/petsc/conf/petscvariables"
 	sed -i 's#'"${_build_dir}"'#'"${_install_dir}"'#g' "${_dest_dir}/lib/petsc/conf/rules"
 	sed -i 's#'"${_build_dir}"'#'"${_install_dir}"'#g' "${_dest_dir}/include/petscconf.h"
 	sed -i 's#'"${_build_dir}"'#'"${_install_dir}"'#g' "${_dest_dir}/include/petscconfiginfo.h"
 	sed -i 's#'"${_build_dir}"'#'"${_install_dir}"'#g' "${_dest_dir}/lib/petsc/conf/petscrules"

	export PETSC_DIR=${_install_dir}
	
	# Note: the hyperlinks between documentation, tutorials and examples are
	# not perfect yet

	mkdir -p ${pkgdir}/usr/share/doc/$_pkgname/
	# tutorials
	cp -r ${_build_dir}/tutorials ${pkgdir}/usr/share/doc/$_pkgname/

	# src for tutorials
	cp -r ${_build_dir}/src ${pkgdir}/usr/share/doc/$_pkgname/

	mkdir -p ${pkgdir}/etc/profile.d
	echo "export PETSC_DIR=${_install_dir}" > ${pkgdir}/etc/profile.d/petsc.sh
	chmod +x ${pkgdir}/etc/profile.d/petsc.sh

	# show where the shared libraries are
	install -d -m755 "${pkgdir}"/etc/ld.so.conf.d/
	echo "${_install_dir}/lib" > "${pkgdir}"/etc/ld.so.conf.d/petsc.conf
}
