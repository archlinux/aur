# Maintainer: Darjan Krijan (daren) <darjan_krijan@gmx.de>
# Manual download of '${pkgname}-linux-gcc-${pkgver}-${_pkgrel}.tar.gz'  required from upstream
# Manual download of '${pkgname}-linux-aocc-${pkgver}-${_pkgrel}.tar.gz' required from upstream

pkgbase=aocl
pkgname=(aocl-aocc aocl-gcc)
pkgver=3.0
_pkgrel=6
pkgrel=1
pkgdesc="AMD Optimizing CPU Libraries"
arch=('x86_64')
license=('custom')
url="https://developer.amd.com/amd-aocl/"
source=(
	"local://${pkgbase}-linux-aocc-${pkgver}-${_pkgrel}.tar.gz"
	"local://${pkgbase}-linux-gcc-${pkgver}-${_pkgrel}.tar.gz"
	"local://${pkgbase}-aocc.install"
	"local://${pkgbase}-gcc.install"
	"local://modulefile"
)
options=('staticlibs' '!strip')
optdepends=('env-modules')
sha256sums=(
	"c1f0dd73ad0bfb1ede823cdd681c2834f2b7c88b8e7423c4c4412d6cc624ce39"
	"294e63fbceee8d993c4a98d51e008f81ffe4159b5b163db316ddd93fccc04b52"
	"SKIP"
	"SKIP"
	"SKIP"
)

package_aocl-aocc() {
	install=${pkgname}.install

	aocl_prefix=/opt/${pkgname}
	prefix=${pkgdir}/${aocl_prefix}
	mkdir -p ${prefix}

	cd ${srcdir}/${pkgbase}-linux-aocc-${pkgver}-${_pkgrel}

	cp AOCL_User_Guide_${pkgver}.pdf ${prefix}

	./install.sh -t ${prefix}

	# strip unneeded directories
	mv ${prefix}/${pkgver}-${_pkgrel}/* ${prefix}
	rm -r ${prefix}/${pkgver}-${_pkgrel}

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

	cd ${srcdir}/${pkgbase}-linux-gcc-${pkgver}-${_pkgrel}

	cp AOCL_User_Guide_${pkgver}.pdf ${prefix}

	./install.sh -t ${prefix}

	# strip unneeded directories
	mv ${prefix}/${pkgver}-${_pkgrel}/* ${prefix}
	rm -r ${prefix}/${pkgver}-${_pkgrel}

	# fix amd-libs.cfg containing ${pkgdir}
	sed -e "s:=.*/opt:=/opt:g" -i ${prefix}/amd-libs.cfg

	# env-modules (optional)
	cp ${srcdir}/modulefile ${prefix}
	sed -e "s/aocl-aocc/aocl-gcc/g" \
		-e "s/conflict aocl-gcc/conflict aocl-aocc/g" \
		-i ${prefix}/modulefile
	mkdir -p ${pkgdir}/etc/modules/modulefiles
	ln -s ${aocl_prefix}/modulefile ${pkgdir}/etc/modules/modulefiles/${pkgname}
}

# vim:set ts=4
