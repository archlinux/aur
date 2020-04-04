# Maintainer: Sigvald Marholm <marholm@marebakken.com>
# Maintainer: Georg S. Voelker <voelker@maibox.org>
# Contributor: Andreas Bilke <abilke at cosy dot sbg dot ac dot at>
# Contributor: Myles English <myles at rockhead dot biz>
# Contributor: Lucas H. Gabrielli <heitzmann at gmail dot com>
# Contributor: Hawdaa

pkgname=slepc
pkgver=3.13.0
pkgrel=1
pkgdesc="Scalable library for Eigenvalue problem computations"
arch=('i686' 'x86_64')
url="http://slepc.upv.es"
license=('BSD')
depends=("petsc>=${pkgver}")
makedepends=('python')
install=slepc.install
source=(http://slepc.upv.es/download/distrib/${pkgname}-${pkgver/_/-}.tar.gz)
sha256sums=('f1f3c2d13a1a6914e7bf4746d38761e107ea866f50927b639e4ad5918dd1e53b')


build() {
	# get SLEPC_DIR
	source /etc/profile.d/petsc.sh		# gets PETSC_DIR

	_build_dir=${srcdir}/${pkgname}-${pkgver/_/-}
	_install_dir=/opt/slepc/`basename ${PETSC_DIR}`

	cd ${_build_dir}

	unset PETSC_ARCH
	export SLEPC_DIR=${_build_dir}

	python ./configure --prefix=${pkgdir}${_install_dir} --with-clean
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
