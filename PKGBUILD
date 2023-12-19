# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname=partmc-git
pkgver=2.7.0.r3.g5760bfb5
pkgrel=1
pkgdesc="Particle-resolved Monte Carlo code for atmospheric aerosol simulation"
arch=('x86_64')
url="http://lagrange.mechse.illinois.edu/partmc/"
license=('GPL')
depends=('gsl' 'netcdf-fortran')
# texlive-fontutils is for epstopdf only
makedepends=('cmake' 'doxygen' 'graphviz' 'texlive-fontutils')
source=(
	'git+https://github.com/compdyn/partmc'
)
md5sums=(
	'SKIP'
)

pkgver() {
	git -C "$srcdir/${pkgname%-git}" describe --long --tags --always | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cmake -S "$srcdir/${pkgname%-git}" \
		-B "$srcdir/build" \
		-D CMAKE_BUILD_TYPE=release \
		-D CMAKE_C_FLAGS_RELEASE=" \
			-O2 -g \
			-Werror -Wall -Wextra \
		" \
		-D CMAKE_Fortran_FLAGS_RELEASE=" \
			-O2 -g \
			-Werror -Wall -Wextra -Wconversion -Wunderflow -Wimplicit-interface -Wno-compare-reals -Wno-unused -Wno-unused-parameter -Wno-unused-dummy-argument \
			-fimplicit-none -fbounds-check \
		" \
		-D ENABLE_GSL:BOOL=TRUE \
		-D ENABLE_SUNDIALS:BOOL=FALSE \
		-D ENABLE_MOSAIC:BOOL=FALSE \
		-D ENABLE_CAMP:BOOL=FALSE \
		-D ENABLE_MPI:BOOL=FALSE

	make -j1 -C "$srcdir/build"
	make -j1 -C "$srcdir/${pkgname%-git}/doc"
}

check() {
	make -C "$srcdir/build/" test
}

package() {
	pkgusr="$pkgdir/usr"
	pkgdoc="$pkgusr/share/doc/${pkgname%-git}"

	install -Dm755 "$srcdir/build/partmc" "$pkgusr/bin/partmc"

	cd "$srcdir/${pkgname%-git}/doc/"
	install -Dm644 ChangeLog.html "$pkgdoc/ChangeLog.html"
	install -Dm644 README.html "$pkgdoc/README.html"
	install -Dm644 partmc_modules.pdf "$pkgdoc/partmc_modules.pdf"
	cp -R html "$pkgdoc"
}
