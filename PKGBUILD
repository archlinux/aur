# Maintainer: Ido Rosen <ido@kernel.org>
# Co-Maintainer: Maximilian Stahlberg <maximilian.stahlberg tu-berlin de>
#
# NOTE: To request changes to this package, you can submit a pull request
#       to the GitHub repository at https://github.com/ido/packages-archlinux
#       Otherwise, open a GitHub issue.  Thank you! -Ido

pkgname='mosek'
pkgdesc="A commercial solver for mathematical optimization problems."
epoch=1
_majver=8
_minver=1
pkgver=${_majver}.${_minver}.0.45
pkgrel=1
arch=('x86_64')
_mosekarch=linux64x86
url='http://mosek.com/'
license=('custom')
depends=('gcc-libs' 'openmp')
options=('!strip')

source=("http://download.mosek.com/stable/${pkgver}/mosektools${_mosekarch}.tar.bz2")

sha512sums=('064dec647bcffe443e34774825ae394dd9786dc4907271e9e7ba6497e7f06a771448afc1de3cd33fc3bc6d9a481ee35960513f11f2d3970bb80238cb5ed2d2fa')

package() {
	# Install shared libraries.
	cd "${srcdir}/mosek/${_majver}/tools/platform/${_mosekarch}/bin"
	install -dm755 "${pkgdir}/usr/lib"
	install -m755 "libmosek64.so.${_majver}.${_minver}" "${pkgdir}/usr/lib/"
	install -m755 "libmosekxx${_majver}_${_minver}.so" "${pkgdir}/usr/lib/"
	install -m755 "libmosekscopt${_majver}_${_minver}.so" "${pkgdir}/usr/lib/"
	ln -rs "${pkgdir}/usr/lib/libmosek64.so.${_majver}.${_minver}" "${pkgdir}/usr/lib/libmosek64.so"

	# Install command line utilities.
	cd "${srcdir}/mosek/${_majver}/tools/platform/${_mosekarch}/bin"
	install -dm755 "${pkgdir}/usr/bin"
	install -m755 mosek "${pkgdir}/usr/bin/"

	# Install C bindings.
	cd "${srcdir}/mosek/${_majver}/tools/platform/${_mosekarch}/h"
	install -dm755 "${pkgdir}/usr/include"
	install -m755 mosek.h "${pkgdir}/usr/include/"

	# Install Python bindings.
	cd "${srcdir}/mosek/${_majver}/tools/platform/${_mosekarch}/python"
	python2 2/setup.py install --root="${pkgdir}" --optimize=1
	python3 3/setup.py install --root="${pkgdir}" --optimize=1

	# Install documentation.
	cd "${srcdir}/mosek/${_majver}"
	install -Dm644 mosek-eula.pdf "${pkgdir}/usr/share/licenses/mosek/eula.pdf"
	install -dm755 "${pkgdir}/usr/share/doc/mosek"
	cp -r intro.pdf doc/*.pdf tools/examples "${pkgdir}/usr/share/doc/mosek/"
	rm "${pkgdir}/usr/share/doc/mosek/examples/"{fusion/,}python/run.sh
	rm "${pkgdir}/usr/share/doc/mosek/examples/ampl/test.sh"
	rm "${pkgdir}/usr/share/doc/mosek/examples/"{c,dotnet,java}/Makefile
	rm "${pkgdir}/usr/share/doc/mosek/examples/fusion/"{cxx,dotnet,java}/Makefile
}
