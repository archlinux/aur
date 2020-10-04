# Maintainer: Darjan Krijan (daren) <darjan_krijan@gmx.de>
# Manual download of '${pkgname}-linux-gcc-${pkgver}.tar.gz' required from upstream
# Manual download of '${pkgname}-linux-aocc-${pkgver}.tar.gz' required from upstream

pkgbase=aocl
pkgname=(aocl-aocc aocl-gcc)
pkgver=2.2
_pkgrel=4
pkgrel=1
pkgdesc="AMD Optimizing CPU Libraries"
arch=('x86_64')
license=('custom')
url="https://developer.amd.com/amd-aocl/"
source=(
	"local://${pkgbase}-linux-aocc-${pkgver}-${_pkgrel}.tar.gz"
	"local://${pkgbase}-linux-gcc-${pkgver}-5.tar.gz"
	"local://${pkgbase}-aocc.install"
	"local://${pkgbase}-gcc.install"
	"local://modulefile"
)
options=('staticlibs' '!strip')
depends=('env-modules')
sha256sums=(
	"4bdc5caec0233066ded3e2bfedb1e03bdeec82725361764d8860075f64ff4031"
	"2cdfbf9f03be7b4756316f0ecd117cf323d3a54e0d66d7fcaa4bc947e1846540"
	"SKIP"
	"SKIP"
	"SKIP"
)

if [ -z ${MODULESHOME} ]; then
	echo "Environment variable MODULESHOME from env-modules is unset."
	echo "Restart your shell or source the env-modules scripts for your shell."
	exit 1
fi

package_aocl-aocc() {
	install=${pkgname}.install

	aocl_prefix=/opt/${pkgname}
	prefix=${pkgdir}/${aocl_prefix}
	mkdir -p ${prefix}

	cd ${srcdir}/${pkgbase}-linux-aocc-${pkgver}-${_pkgrel}

	cp AOCL_User_Guide_${pkgver}.pdf ${prefix}

	./install.sh -t ${prefix}

	# strip unneeded directories
	mv ${prefix}/${pkgver}/* ${prefix}
	rm -r ${prefix}/${pkgver}

	# delete libs directory with broken symlinks
	rm -rf ${prefix}/libs

	# modulefile
	echo -e "\nSymlinking modulefile..."
	cp ${srcdir}/modulefile ${prefix}
	mkdir -p ${pkgdir}${MODULESHOME}/modulefiles/
	ln -s ${aocl_prefix}/modulefile ${pkgdir}${MODULESHOME}/modulefiles/${pkgname}
}

package_aocl-gcc() {
	install=${pkgname}.install

	aocl_prefix=/opt/${pkgname}
	prefix=${pkgdir}/${aocl_prefix}
	mkdir -p ${prefix}

	cd ${srcdir}/${pkgbase}-linux-gcc-${pkgver}-5

	cp AOCL_User_Guide_${pkgver}.pdf ${prefix}

	./install.sh -t ${prefix}

	# strip unneeded directories
	mv ${prefix}/${pkgver}/* ${prefix}
	rm -r ${prefix}/${pkgver}

	# modulefile
	echo -e "\nSymlinking modulefile..."
	cp ${srcdir}/modulefile ${prefix}
	sed -e "s/aocl-aocc/aocl-gcc/g" \
		-e "s/conflict aocl-gcc/conflict aocl-aocc/g" \
		-i ${prefix}/modulefile
	mkdir -p ${pkgdir}${MODULESHOME}/modulefiles/
	ln -s ${aocl_prefix}/modulefile ${pkgdir}${MODULESHOME}/modulefiles/${pkgname}
}

# vim:set ts=4
