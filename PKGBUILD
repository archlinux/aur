# Maintainer: Myles English <myles at rockhead dot biz>
pkgname=petsc
pkgver=3.6.0
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
makedepends=('gcc' 'gcc-fortran' 'cmake')
install=petsc.install
source=(http://ftp.mcs.anl.gov/pub/petsc/release-snapshots/${pkgname}-${pkgver/_/-}.tar.gz)
md5sums=('f0dcbf25a8dd7f3069c1f094338c5263')

_install_dir=/opt/petsc/${_config}

# to avoid: "make[2]: *** No rule to make target `libptesmumps.a', needed by `main_esmumps'.  Stop."
export MAKEFLAGS="-j1"

build() {
	_build_dir="${srcdir}/${pkgname}-${pkgver/_/-}"

	cd ${_build_dir}
	#patch -Np1 -i ${startdir}/patch_debug.diff

	unset PETSC_ARCH
	export PETSC_DIR=${_build_dir}

	find ${srcdir} -name "*" -type f -exec \
	sed -i 's#\(/usr/bin/env \|/usr/bin/\)python[2-3]*#\1python2#' {} \;

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
		--prefix=${pkgdir}${_install_dir} \
		--PETSC_ARCH=${_config} \
		${CONFOPTS}

	make ${MAKEFLAGS} PETSC_DIR=${_build_dir} PETSC_ARCH=${_config} all
}

package() {
	_build_dir="${srcdir}/${pkgname}-${pkgver/_/-}"
	cd ${_build_dir}
	echo "make ${MAKEFLAGS} PETSC_DIR=${_build_dir} PETSC_ARCH=${_config} install"
	export PETSC_DIR=${_build_dir}
	make ${MAKEFLAGS} PETSC_DIR=${_build_dir} PETSC_ARCH=${_config} install # > /dev/null

	sed -i 's#'"${pkgdir}"'##g' "${pkgdir}${_install_dir}/lib/pkgconfig/PETSc.pc"
	sed -i 's#'"${pkgdir}"'##g' "${pkgdir}${_install_dir}/conf/variables"
	sed -i 's#'"${pkgdir}"'##g' "${pkgdir}${_install_dir}/conf/petscvariables"
	sed -i 's#'"${pkgdir}"'##g' "${pkgdir}${_install_dir}/conf/rules"
	sed -i 's#'"${pkgdir}"'##g' "${pkgdir}${_install_dir}/include/petscconf.h"
	sed -i 's#'"${pkgdir}"'##g' "${pkgdir}${_install_dir}/include/petscconfiginfo.h"
	sed -i 's#'"${pkgdir}"'##g' "${pkgdir}${_install_dir}/conf/petscrules"

	export PETSC_DIR=${_install_dir}
	
	# Note: the hyperlinks between documentation, tutorials and examples are
	# not perfect yet

	# documentation
	mkdir -p ${pkgdir}/usr/share/doc/$pkgname/
	cp -r ${_build_dir}/docs ${pkgdir}/usr/share/doc/$pkgname/

	# tutorials
	cp -r ${_build_dir}/tutorials ${pkgdir}/usr/share/doc/$pkgname/

	# src for tutorials
	cp -r ${_build_dir}/src ${pkgdir}/usr/share/doc/$pkgname/

	# html versions of header files
	mkdir -p ${pkgdir}/usr/share/doc/$pkgname/include
	cp -r ${_build_dir}/include/*.html ${pkgdir}/usr/share/doc/$pkgname/include/

	# install licenCe (even though there is no such word as licenSes)
	mkdir -p ${pkgdir}/usr/share/licenses/petsc
	cp ${_build_dir}/docs/copyright.html ${pkgdir}/usr/share/licenses/$pkgname/

	mkdir -p ${pkgdir}/etc/profile.d
	echo "export PETSC_DIR=${_install_dir}" > ${pkgdir}/etc/profile.d/petsc.sh
	chmod +x ${pkgdir}/etc/profile.d/petsc.sh

	# show where the shared libraries are
	install -d -m755 "${pkgdir}"/etc/ld.so.conf.d/
	echo "${_install_dir}/lib" > "${pkgdir}"/etc/ld.so.conf.d/petsc.conf
}
