# Maintainer: Toria <ninetailedtori@uwu.gal>
# Maintainer: Darjan Krijan [https://disc-kuraudo.eu]
# Contributor: Jesse R Codling <codling@umich.edu>
# Manual download of 'aocl-linux-aocc-${pkgver}.tar.gz' required from upstream
# Manual download of 'aocl-linux-gcc-${pkgver}.tar.gz'  required from upstream

pkgbase=aocl
pkgname=(aocl-aocc aocl-gcc)
_major=5-1
pkgver=5.1.0
pkgrel=2
pkgdesc="AMD Optimizing CPU Libraries"
arch=('x86_64')
license=('custom')
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
_url_aocc="https://download.amd.com/developer/eula/aocl/aocl-${_major}/aocl-linux-aocc-${pkgver}.tar.gz"
_url_gcc="https://download.amd.com/developer/eula/aocl/aocl-${_major}/aocl-linux-gcc-${pkgver}.tar.gz"
url="https://www.amd.com/en/developer/aocl.html"
source=(
	"$_url_aocc"
	"$_url_gcc"
	"${pkgbase}-aocc.install"
	"${pkgbase}-gcc.install"
	"modulefile"
)
options=('staticlibs' '!strip')
makedepends=('patchelf')
optdepends=('env-modules')
_sha256sum1=$(curl -A 'Mozilla' "$url" | grep --perl-regexp '\w{64}(?=\<\/td\>)' --only-matching | sed -n '1 p')
_sha256sum2=$(curl -A 'Mozilla' "$url" | grep --perl-regexp '\w{64}(?=\<\/td\>)' --only-matching | sed -n '4 p')
sha256sums=("$_sha256sum1"
            "$_sha256sum2"
            '4f58524e1948b2cb470b856546b87656b2fbce0b98b0d43d345fcedb101f1295'
            'fe5245a7b34253a67105ee5e6bb868bbb69ebf318af32dc81e1cdd7d7277b639'
            'bbf75a4d30aa4f8c4eb46d3c6193c011c43683352266fa56314f16212e409965')
# NB: I should've made my checksum variable lambdas such that they will find all sums,
# even if AMD change their website, but if they remove the </td> tag from the end,
# this may fail. In which case, we can possible YOLO remove the lookahead.

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
