# Maintainer: Sigvald Marholm <marholm@marebakken.com>
# Maintainer: Georg S. Voelker <voelker@maibox.org>
# Contributor: Andreas Bilke <abilke at cosy dot sbg dot ac dot at>
# Contributor: Myles English <myles at rockhead dot biz>
# Contributor: Lucas H. Gabrielli <heitzmann at gmail dot com>
# Contributor: Hawdaa
# Contributor: Xantares

pkgname=slepc
pkgver=3.12.2
pkgrel=3
pkgdesc="Scalable library for Eigenvalue problem computations"
arch=('i686' 'x86_64')
url="http://slepc.upv.es"
license=('BSD')
depends=('petsc>=3.12' 'petsc<3.13')
install=slepc.install
source=(http://slepc.upv.es/download/distrib/${pkgname}-${pkgver/_/-}.tar.gz)
sha256sums=('a586ce572a928ed87f04961850992a9b8e741677397cbaa3fb028323eddf4598')

export MAKEFLAGS="-j1"

prepare() {
	# force using python2
	find ${srcdir} -name "*" -type f -exec \
	sed -i 's#\(/usr/bin/env \|/usr/bin/\)python[2-3]*#\1python2#' {} \;

}

build() {
	# get SLEPC_DIR
	source /etc/profile.d/petsc.sh		# gets PETSC_DIR

	_build_dir=${srcdir}/${pkgname}-${pkgver/_/-}
	_install_dir=/opt/slepc/`basename ${PETSC_DIR}`

	cd ${_build_dir}

	unset PETSC_ARCH
	export SLEPC_DIR=${_build_dir}

	python2 ./configure --prefix=${pkgdir}${_install_dir}
	make
}


package() {
	# get SLEPC_DIR
	source /etc/profile.d/petsc.sh		# gets PETSC_DIR

	_build_dir=${srcdir}/${pkgname}-${pkgver/_/-}
	_install_dir=/opt/slepc/`basename ${PETSC_DIR}`
	_dest_dir=${pkgdir}${_install_dir}

	cd ${_build_dir}
	export SLEPC_DIR=${_build_dir}
	source /etc/profile.d/petsc.sh	# sets PETSC_DIR

	make install > /dev/null # redirect in order to suppress confusing messages

	export SLEPC_DIR=${_install_dir}
	unset PETSC_ARCH

	sed -i "s#${pkgdir}##g" "${_dest_dir}/include/slepcconf.h"
	sed -i "s#${pkgdir}##g" "${_dest_dir}/lib/pkgconfig/SLEPc.pc"
	sed -i "s#${pkgdir}##g" "${_dest_dir}/lib/slepc/conf/modules/${pkgname}/${pkgver}"
	sed -i "s#${pkgdir}##g" "${_dest_dir}/lib/slepc/conf/slepc_rules"
	sed -i "s#${pkgdir}##g" "${_dest_dir}/lib/slepc/conf/slepc_variables"
	# sed -i "s#${pkgdir}##g" "${_dest_dir}/lib/slepc/conf/slepcrules"
	sed -i "s#${pkgdir}##g" "${_dest_dir}/lib/slepc/conf/slepcvariables"
	sed -i "s#${pkgdir}##g" "${_dest_dir}/lib/slepc/conf/uninstall.py"
	sed -i "s#${_build_dir}#${_install_dir}#g" "${_dest_dir}/lib/slepc/conf/uninstall.py"

	# remove logs containing references to the build dir
	rm -f "${_dest_dir}/lib/slepc/conf/configure.log"
	rm -f "${_dest_dir}/lib/slepc/conf/make.log"

	# install licence (even though there is no such word as licenses)
	mkdir -p ${pkgdir}/usr/share/licenses/$pkgname
	cp ${_build_dir}/LICENSE.md ${pkgdir}/usr/share/licenses/$pkgname/

	mkdir -p ${pkgdir}/etc/profile.d
	echo "export SLEPC_DIR=${_install_dir}" > ${pkgdir}/etc/profile.d/slepc.sh
	chmod +x ${pkgdir}/etc/profile.d/slepc.sh

	# show where the shared libraries are
	install -d -m755 "${pkgdir}"/etc/ld.so.conf.d/
	echo "${_install_dir}/lib" > "${pkgdir}"/etc/ld.so.conf.d/slepc.conf
}
