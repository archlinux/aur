# Maintainer: Darjan Krijan [https://disc-kuraudo.eu]
# Manual download of 'aocl-linux-aocc-${pkgver}.tar.gz' required from upstream
# Manual download of 'aocl-linux-gcc-${pkgver}.tar.gz'  required from upstream

pkgbase=aocl
pkgname=(aocl-aocc aocl-gcc)
pkgver=4.0
pkgrel=2
pkgdesc="AMD Optimizing CPU Libraries"
arch=('x86_64')
license=('custom')
url="https://developer.amd.com/amd-aocl/"
source=(
	"local://${pkgbase}-linux-aocc-${pkgver}.tar.gz"
	"local://${pkgbase}-linux-gcc-${pkgver}.tar.gz"
	"local://${pkgbase}-aocc.install"
	"local://${pkgbase}-gcc.install"
	"local://modulefile"
)
options=('staticlibs' '!strip')
optdepends=('env-modules')
sha256sums=(
	"8a249e727beb8005639b4887074e1ea75020267ed1ac25520876a7ad21d0f4f6"
	"0817dac88d4ed63e8eff5c4c77451254930a0665b83a26e05ec6a3d354ef71da"
	"SKIP"
	"SKIP"
	"SKIP"
)

package_aocl-aocc() {
	install=${pkgname}.install

	aocl_prefix=/opt/${pkgname}
	prefix=${pkgdir}/${aocl_prefix}
	mkdir -p ${prefix}

	cd ${srcdir}/${pkgbase}-linux-aocc-${pkgver}

	#cp AOCL_User_Guide_${pkgver}.pdf ${prefix}

	# Option: set '-i ilp64' for ILP64 libraries as default
	./install.sh -t ${prefix} -i lp64

	# strip unneeded directories
	mv ${prefix}/${pkgver}/* ${prefix}
	rm -r ${prefix}/${pkgver}

	# fix amd-libs.cfg containing ${pkgdir}
	sed -e "s:=.*/opt:=/opt:g" -i ${prefix}/amd-libs.cfg

	# env-modules (optional)
	cp ${srcdir}/modulefile ${prefix}
	mkdir -p ${pkgdir}/etc/modules/modulefiles
	ln -s ${aocl_prefix}/modulefile ${pkgdir}/etc/modules/modulefiles/${pkgname}
}

package_aocl-gcc() {
	install=${pkgname}.install

	aocl_prefix=/opt/${pkgname}
	prefix=${pkgdir}/${aocl_prefix}
	mkdir -p ${prefix}

	cd ${srcdir}/${pkgbase}-linux-gcc-${pkgver}

	#cp AOCL_User_Guide_${pkgver}.pdf ${prefix}

	# Option: set '-i ilp64' for ILP64 libraries as default
	./install.sh -t ${prefix} -i lp64

	# strip unneeded directories
	mv ${prefix}/${pkgver}/* ${prefix}
	rm -r ${prefix}/${pkgver}

	# fix amd-libs.cfg containing ${pkgdir} and ${pkgver}
	sed -e "s:=.*/opt:=/opt:g" -e "s:/${pkgver}::g" -i ${prefix}/amd-libs.cfg

	# env-modules (optional)
	cp ${srcdir}/modulefile ${prefix}
	sed -e "s/aocl-aocc/aocl-gcc/g" \
		-e "s/conflict aocl-gcc/conflict aocl-aocc/g" \
		-i ${prefix}/modulefile
	mkdir -p ${pkgdir}/etc/modules/modulefiles
	ln -s ${aocl_prefix}/modulefile ${pkgdir}/etc/modules/modulefiles/${pkgname}
}

# vim:set ts=4
