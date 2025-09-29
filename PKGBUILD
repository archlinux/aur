# Maintainer: Darjan Krijan [https://disc-kuraudo.eu]
# Contributor: Jesse R Codling <codling@umich.edu>
# Manual download of 'aocl-linux-aocc-${pkgver}.tar.gz' required from upstream
# Manual download of 'aocl-linux-gcc-${pkgver}.tar.gz'  required from upstream

pkgbase=aocl
pkgname=(aocl-aocc aocl-gcc)
pkgver=5.1.0
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
sha256sums=('2a12eb1270fc1cf16618664008dc872d37cc2bd690c492e468c8f2c6937f9488'
            '73ad28baaa1096972804c1a1d42b8ed4724c0b98b60806e94ef6322bc86afa8b'
            '4f58524e1948b2cb470b856546b87656b2fbce0b98b0d43d345fcedb101f1295'
            'fe5245a7b34253a67105ee5e6bb868bbb69ebf318af32dc81e1cdd7d7277b639'
            '5fa50773bb1076ee9ac1010844c86d749757a4da0c703d33b163863f75242670')

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

	# add missing libFLAME dependency on BLIS and AOCL-Utils
	patchelf --add-needed ${aocl_prefix}/aocc/lib_ILP64/libblis-mt.so ${prefix}/aocc/lib_ILP64/libflame.so
	patchelf --add-needed ${aocl_prefix}/aocc/lib_ILP64/libaoclutils.so ${prefix}/aocc/lib_ILP64/libflame.so
	patchelf --add-needed ${aocl_prefix}/aocc/lib_LP64/libblis-mt.so ${prefix}/aocc/lib_LP64/libflame.so
	patchelf --add-needed ${aocl_prefix}/aocc/lib_LP64/libaoclutils.so ${prefix}/aocc/lib_LP64/libflame.so

	# fix amd-libs.cfg, pkgconfig, and cmake files containing ${pkgdir}
	find ${prefix}/aocc \( -name 'amd-libs.cfg' -o -name '*.pc' -o -name '*.cmake' -o -name '*_module' \) -exec sed -e "s:/.*/opt:/opt:g" -s -i {} \;

	# fix provided shell and module files to match ${aocl_prefix}
	sed -e "s:aocl/${pkgver}:aocl:g" -s -i ${prefix}/aocc/*_module ${prefix}/aocc/amd-libs.cfg

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

	# add missing libFLAME dependency on BLIS and AOCL-Utils
	patchelf --add-needed ${aocl_prefix}/gcc/lib_ILP64/libblis-mt.so ${prefix}/gcc/lib_ILP64/libflame.so
	patchelf --add-needed ${aocl_prefix}/gcc/lib_ILP64/libaoclutils.so ${prefix}/gcc/lib_ILP64/libflame.so
	patchelf --add-needed ${aocl_prefix}/gcc/lib_LP64/libblis-mt.so ${prefix}/gcc/lib_LP64/libflame.so
	patchelf --add-needed ${aocl_prefix}/gcc/lib_LP64/libaoclutils.so ${prefix}/gcc/lib_LP64/libflame.so

	# fix amd-libs.cfg, pkconfig, and cmake files containing ${pkgdir} and ${pkgver}
	find ${prefix}/gcc \( -name 'amd-libs.cfg' -o -name '*.pc' -o -name '*.cmake' -o -name '*_module' \) -exec sed -e "s:/.*/opt:/opt:g" -s -i {} \;

	# fix provided shell and module files to match ${aocl_prefix}
	sed -e "s:aocl/${pkgver}:aocl:g" -s -i ${prefix}/gcc/*_module ${prefix}/gcc/amd-libs.cfg

	# env-modules (optional)
	cp ${srcdir}/modulefile ${prefix}/gcc
	sed -e "s/aocc/gcc/g" \
		-e "s/conflict aocl-gcc/conflict aocl-aocc/g" \
		-i ${prefix}/gcc/modulefile
	mkdir -p ${pkgdir}/etc/modules/modulefiles
	ln -s ${aocl_prefix}/gcc/modulefile ${pkgdir}/etc/modules/modulefiles/${pkgname}
}

# vim:set ts=4
