# Maintainer: Darjan Krijan [https://disc-kuraudo.eu]
# Manual download of 'aocl-linux-aocc-${pkgver}.tar.gz' required from upstream
# Manual download of 'aocl-linux-gcc-${pkgver}.tar.gz'  required from upstream

pkgbase=aocl
pkgname=(aocl-aocc aocl-gcc)
pkgver=4.1.0
pkgrel=1
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
	"25c3d86970a355205de0d139a23e251f070dd76242114b98390fe8f90503e810"
	"9f37321b86443e1d9e62bd32020e2b886ac0a5b25941c7321dd27019f153bb21"
	"SKIP"
	"SKIP"
	"SKIP"
)

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
