# Maintainer: Ismo Toijala <ismo.toijala@gmail.com>

pkgname=pmclib
pkgver=1.2
pkgrel=3
pkgdesc="Population Monte Carlo"
arch=('x86_64')
url="http://www2.iap.fr/users/kilbinge/CosmoPMC/"
license=('none')
depends=('gsl' 'fftw')
makedepends=('python2')
source=(
	'http://www2.iap.fr/users/kilbinge/CosmoPMC/pmclib_v1.01.tar.gz'
	'http://www2.iap.fr/users/kilbinge/CosmoPMC/patch_pmclib_1.x_1.2.tar.gz'
)

prepare() {
	cd "$srcdir/pmclib_v1.01"

	cp ../patch_pmclib_1.x_1.2/{maths,mvdens,pmc,tools}.c "pmclib/src"
	cp ../patch_pmclib_1.x_1.2/{maths,mvdens}.h "pmclib/include"
}

build() {
	cd "$srcdir/pmclib_v1.01"

	python2 waf configure \
		--m64 \
		--lua_link=... \
		--lapack_link=... \
		--prefix=/usr

	python2 waf build
}

package() {
	cd "$srcdir/pmclib_v1.01"

	python2 waf --destdir="$pkgdir" install

	cd "$pkgdir/usr/include"

	find pmclib pmctools -name "*.h" \
		-exec sed -i \
			-e 's/#include "errorlist\.h"/#include <pmctools\/errorlist.h>/' \
			-e 's/#include "io\.h"/#include <pmctools\/io.h>/' \
			-e 's/#include "mvdens\.h"/#include <pmctools\/mvdens.h>/' \
			-e 's/#include "maths\.h"/#include <pmctools\/maths.h>/' \
			-e 's/#include "maths_base\.h"/#include <pmctools\/maths_base.h>/' \
			{} \;

	sed -i \
		-e 's/^double fmin(double/\/\/&/' \
		-e 's/^double fmax(double/\/\/&/' \
		pmctools/maths.h
}

md5sums=('da2095518601ae59ee23c2716b6729cd'
         '288e3c361c8145a5179ac84ebf72566e')
