# Maintainer: Darjan Krijan [https://disc-kuraudo.eu]
# Contributor: Jesse R Codling <codling@umich.edu>
# Manual download of 'aocl-linux-aocc-${pkgver}.tar.gz' required from upstream
# Manual download of 'aocl-linux-gcc-${pkgver}.tar.gz'  required from upstream

pkgbase=aocl
pkgname=(aocl-aocc aocl-gcc)
pkgver=4.2.0
pkgrel=1
pkgdesc="AMD Optimizing CPU Libraries"
arch=('x86_64')
license=('custom')
url="https://developer.amd.com/amd-aocl/"
source=(
	"local://${pkgbase}-linux-aocc-${pkgver}.tar.gz"
	"local://${pkgbase}-linux-gcc-${pkgver}.tar.gz"
	"${pkgbase}-aocc.install"
	"${pkgbase}-gcc.install"
	"modulefile"
)
options=('staticlibs' '!strip')
makedepends=('patchelf')
optdepends=('env-modules')
sha256sums=('d25aa17dec5b50b89414d7faff2d72a2c959987fe1a4a0a5842878a3fe079d5c'
            '0cb761d4705c72e6a7b8956cf33211dadaa128e3193cfe9b24daa6d3ec3dadbe'
            '1b538de9561a5de59a69b5697ba5f494391897bd6d34101e7847e821e10ce550'
            'c9ddea1c7e02048239dd6f800bd2ec807bcb0b2e632fe26537b2be0d8eafba37'
            'dddc96efcb7db40eb98b4b00eaa78c4b5f01b552ebf3c58a2a1949cfba1d722e')

package_aocl-aocc() {
	install=${pkgname}.install

	aocl_prefix=/opt/aocl
	prefix=${pkgdir}/${aocl_prefix}
	mkdir -p ${prefix}

	cd ${srcdir}/${pkgbase}-linux-aocc-${pkgver}

	#cp AOCL_User_Guide_${pkgver}.pdf ${prefix}

	# Option: set '-i ilp64' for ILP64 libraries as default
	./install.sh -t ${prefix} -i lp64

	# strip unneeded directories
	mv ${prefix}/${pkgver}/* ${prefix}
	rm -r ${prefix}/${pkgver}

	# add missing libFLAME dependency on BLIS
	patchelf --add-needed ${aocl_prefix}/aocc/lib_ILP64/libblis-mt.so ${prefix}/aocc/lib_ILP64/libflame.so
	patchelf --add-needed ${aocl_prefix}/aocc/lib_LP64/libblis-mt.so ${prefix}/aocc/lib_LP64/libflame.so

	# fix amd-libs.cfg containing ${pkgdir}
	sed -e "s:=.*/opt:=/opt:g" -i ${prefix}/aocc/amd-libs.cfg

	# env-modules (optional)
	cp ${srcdir}/modulefile ${prefix}/aocc
	mkdir -p ${pkgdir}/etc/modules/modulefiles
	ln -s ${aocl_prefix}/aocc/modulefile ${pkgdir}/etc/modules/modulefiles/${pkgname}
}

package_aocl-gcc() {
	install=${pkgname}.install

	aocl_prefix=/opt/aocl
	prefix=${pkgdir}/${aocl_prefix}
	mkdir -p ${prefix}

	cd ${srcdir}/${pkgbase}-linux-gcc-${pkgver}

	#cp AOCL_User_Guide_${pkgver}.pdf ${prefix}

	# Option: set '-i ilp64' for ILP64 libraries as default
	./install.sh -t ${prefix} -i lp64

	# strip unneeded directories
	mv ${prefix}/${pkgver}/* ${prefix}
	rm -r ${prefix}/${pkgver}

	# add missing libFLAME dependency on BLIS
	patchelf --add-needed ${aocl_prefix}/gcc/lib_ILP64/libblis-mt.so ${prefix}/gcc/lib_ILP64/libflame.so
	patchelf --add-needed ${aocl_prefix}/gcc/lib_LP64/libblis-mt.so ${prefix}/gcc/lib_LP64/libflame.so

	# fix amd-libs.cfg containing ${pkgdir} and ${pkgver}
	sed -e "s:=.*/opt:=/opt:g" -e "s:/${pkgver}::g" -i ${prefix}/gcc/amd-libs.cfg

	# env-modules (optional)
	cp ${srcdir}/modulefile ${prefix}/gcc
	sed -e "s/aocc/gcc/g" \
		-e "s/conflict aocl-gcc/conflict aocl-aocc/g" \
		-i ${prefix}/gcc/modulefile
	mkdir -p ${pkgdir}/etc/modules/modulefiles
	ln -s ${aocl_prefix}/gcc/modulefile ${pkgdir}/etc/modules/modulefiles/${pkgname}
}

# vim:set ts=4
