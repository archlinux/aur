# Maintainer: Darjan Krijan (daren) <darjan_krijan@gmx.de>
# Manual download of '${pkgname}-linux-gcc-${pkgver}.tar.gz' required from upstream

pkgname=aocl
pkgver=2.1
pkgrel=0
pkgdesc="AMD Optimizing CPU Libraries"
arch=('x86_64')
license=('custom')
url="https://developer.amd.com/amd-aocl/"
os=ubuntu
source=(
	"local://${pkgname}-linux-gcc-${pkgver}.tar.gz"
	"local://aocl.install"
	"local://modulefile"
)
options=('staticlibs' '!strip')
depends=('env-modules')
install=aocl.install
sha256sums=(
	"4fd14dc838ce13a6d1468ed0812905b102d85709b17ab8228513da37448d2993"
	"SKIP"
	"SKIP"
)

if [ -z ${MODULESHOME} ]; then
	echo "Environment variable MODULESHOME from env-modules is unset."
	echo "Restart your shell or source the env-modules scripts for your shell."
	exit 1
fi

aocl_prefix=/opt/aocl

package() {
	prefix=${pkgdir}/${aocl_prefix}
	mkdir -p ${prefix}

	cd ${srcdir}/${pkgname}-linux-gcc-${pkgver}

	cp AOCL_User_Guide_${pkgver}.pdf ${prefix}

	./install.sh -t ${prefix}

	# strip unneeded directories
	mv ${prefix}/amd/${pkgname}/${pkgver}/* ${prefix}
	rm -r ${prefix}/amd

	# fix amd-libm
	sed -e "s/__mm256/__m256/g" \
		-e "s/emmintrin.h/immintrin.h/g" \
		-i ${prefix}/amd-libm/include/amdlibm.h

	# modulefile
	echo -e "\nSymlinking modulefile..."
	cp ${srcdir}/modulefile ${pkgdir}${aocl_prefix}
	mkdir -p ${pkgdir}${MODULESHOME}/modulefiles/
	ln -s ${aocl_prefix}/modulefile ${pkgdir}${MODULESHOME}/modulefiles/${pkgname}
}
