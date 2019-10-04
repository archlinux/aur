# Maintainer: Darjan Krijan (daren) <darjan_krijan@gmx.de>
# Manual download of 'aocl-ubuntu-${pkgver}.tar.gz' required from upstream

pkgname=aocl
pkgver=2.0
pkgrel=1
pkgdesc="AMD Optimizing CPU Libraries"
arch=('x86_64')
license=('custom')
url="https://developer.amd.com/amd-aocl/"
source=(
	"local://aocl-ubuntu-${pkgver}.tar.gz"
	"local://amd-blis.pc"
	"local://amd-blis-mt.pc"
	"local://amd-fftw3.pc"
	"local://amd-fftw3f.pc"
	"local://amd-libflame.pc"
	"local://amd-libm.pc"
	"local://amd-rng.pc"
	"local://amd-rng-omp.pc"
	"local://amd-securerng.pc"
	"local://modulefile"
)
options=('staticlibs' '!strip')
depends=('env-modules')
install=aocl.install
sha256sums=(
	"4fd14dc838ce13a6d1468ed0812905b102d85709b17ab8228513da37448d2993"
	"SKIP"
	"SKIP"
	"SKIP"
	"SKIP"
	"SKIP"
	"SKIP"
	"SKIP"
	"SKIP"
	"SKIP"
	"SKIP"
)

package() {
	mkdir -p ${pkgdir}/opt/aocl

	cd ${srcdir}/aocl-ubuntu-${pkgver}

	./install.sh -t ${pkgdir}/opt/aocl
	cp AOCL_User_Guide_${pkgver}.pdf ${pkgdir}/opt/aocl
	mv ${pkgdir}/opt/aocl/amd/aocl/${pkgver}/* ${pkgdir}/opt/aocl

	# clean amd-libm
	mv ${pkgdir}/opt/aocl/amd-libm/lib/dynamic/* \
		${pkgdir}/opt/aocl/amd-libm/lib
	mv ${pkgdir}/opt/aocl/amd-libm/lib/static/* \
		${pkgdir}/opt/aocl/amd-libm/lib
	rm -r ${pkgdir}/opt/aocl/amd-libm/lib/dynamic
	rm -r ${pkgdir}/opt/aocl/amd-libm/lib/static

	# clean amd-rng
	mv ${pkgdir}/opt/aocl/amd-rng/rng-omp/lib_omp/* \
		${pkgdir}/opt/aocl/amd-rng/rng-omp/lib
	rm -r ${pkgdir}/opt/aocl/amd-rng/rng-omp/lib_omp/
	rm -r ${pkgdir}/opt/aocl/amd-rng/rng/lib/libamdsecrng*
	rm -r ${pkgdir}/opt/aocl/amd-rng/rng-omp/lib/libamdsecrng*

	rm -rf ${pkgdir}/opt/aocl/amd ${pkgdir}/opt/aocl/libs

	cd ${srcdir}

	# pkg-config
	mkdir -p ${pkgdir}/opt/aocl/pkgconfig
	cp ${srcdir}/*.pc ${pkgdir}/opt/aocl/pkgconfig

	# modulefile
	cp modulefile ${pkgdir}/opt/aocl
	mkdir -p ${pkgdir}${MODULESHOME}/modulefiles/
	ln -s /opt/aocl/modulefile ${pkgdir}${MODULESHOME}/modulefiles/aocl
}
