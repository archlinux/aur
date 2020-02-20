# Maintainer: Darjan Krijan (daren) <darjan_krijan@gmx.de>
# Manual download of '${pkgname}-linux-gcc-${pkgver}.tar.gz' required from upstream
# Manual download of '${pkgname}-linux-aocc-${pkgver}.tar.gz' required from upstream

pkgbase=aocl
pkgname=(aocl-aocc aocl-gcc)
pkgver=2.1
pkgrel=4
pkgdesc="AMD Optimizing CPU Libraries"
arch=('x86_64')
license=('custom')
url="https://developer.amd.com/amd-aocl/"
source=(
	"local://${pkgbase}-linux-aocc-${pkgver}.tar.gz"
	"local://${pkgbase}-linux-gcc-${pkgver}.tar.gz"
	"local://${pkgbase}.install"
	"local://modulefile"
)
options=('staticlibs' '!strip')
depends=('env-modules')
install=${pkgbase}.install
sha256sums=(
	"e7af89ca23a545cc8bea54c2cb5005a42bf359611f5d4c28336f78f691da3a23"
	"8ea9ec16051893e480f7ba09babeaa833897586aa4d0c2c53b22132b5884150c"
	"SKIP"
	"SKIP"
)

if [ -z ${MODULESHOME} ]; then
	echo "Environment variable MODULESHOME from env-modules is unset."
	echo "Restart your shell or source the env-modules scripts for your shell."
	exit 1
fi

package_aocl-aocc() {
	aocl_prefix=/opt/${pkgname}
	prefix=${pkgdir}/${aocl_prefix}
	mkdir -p ${prefix}

	cd ${srcdir}/${pkgbase}-linux-aocc-${pkgver}

	cp AOCL_User_Guide_${pkgver}.pdf ${prefix}

	./install.sh -t ${prefix}

	# strip unneeded directories
	mv ${prefix}/amd/${pkgbase}/${pkgver}/* ${prefix}
	rm -r ${prefix}/amd

	# delete libs directory with broken symlinks
	rm -rf ${prefix}/libs

	# modulefile
	echo -e "\nSymlinking modulefile..."
	cp ${srcdir}/modulefile ${prefix}
	mkdir -p ${pkgdir}${MODULESHOME}/modulefiles/
	ln -s ${aocl_prefix}/modulefile ${pkgdir}${MODULESHOME}/modulefiles/${pkgname}
}

package_aocl-gcc() {
	aocl_prefix=/opt/${pkgname}
	prefix=${pkgdir}/${aocl_prefix}
	mkdir -p ${prefix}

	cd ${srcdir}/${pkgbase}-linux-gcc-${pkgver}

	cp AOCL_User_Guide_${pkgver}.pdf ${prefix}

	./install.sh -t ${prefix}

	# strip unneeded directories
	mv ${prefix}/amd/${pkgbase}/${pkgver}/* ${prefix}
	rm -r ${prefix}/amd

	# delete libs directory with broken symlinks
	rm -rf ${prefix}/libs

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
