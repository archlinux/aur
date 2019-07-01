# Maintainer: Ido Rosen <ido@kernel.org>
# Co-Maintainer: Maximilian Stahlberg <maximilian.stahlberg tu-berlin de>
#
# NOTE: To request changes to this package, you can submit a pull request
#       to the GitHub repository at https://github.com/ido/packages-archlinux
#       Otherwise, open a GitHub issue.  Thank you! -Ido

pkgname='mosek'
pkgdesc="A commercial solver for mathematical optimization problems."
epoch=1
_majver=9
_minver=0
_ver=${_majver}.${_minver}
_tnyver=96
pkgver=${_ver}.${_tnyver}
pkgrel=2
arch=('x86_64')
_mosekarch=linux64x86
url='http://mosek.com/'
license=('custom')
depends=('gcc-libs' 'openmp')
options=('!strip')

source=("mosek-${pkgver}.tar.bz2::https://download.mosek.com/stable/${pkgver}/mosektools${_mosekarch}.tar.bz2")

sha512sums=('c2540f21f837b63630afb533f7d42afb622246e3100e5600b53375c7b4fb8a22068025b5f670f68fab78e38c51442d94a74c3ebd348d6539cf10eb3042085dc6')

package() {
	# Install shared libraries.
	cd "${srcdir}/mosek/${_ver}/tools/platform/${_mosekarch}/bin"
	install -dm755 "${pkgdir}/usr/lib"
	install -m755 "libcilkrts.so.5" "${pkgdir}/usr/lib/"
	install -m755 "libmosek64.so.${_ver}" "${pkgdir}/usr/lib/"
	install -m755 "libmosekxx${_majver}_${_minver}.so" "${pkgdir}/usr/lib/"
	ln -rs "${pkgdir}/usr/lib/libmosek64.so.${_ver}" "${pkgdir}/usr/lib/libmosek64.so"

	# Install command line utilities.
	cd "${srcdir}/mosek/${_ver}/tools/platform/${_mosekarch}/bin"
	install -dm755 "${pkgdir}/usr/bin"
	install -m755 mosek "${pkgdir}/usr/bin/"

	# Install C bindings.
	cd "${srcdir}/mosek/${_ver}/tools/platform/${_mosekarch}/h"
	install -dm755 "${pkgdir}/usr/include"
	install -m755 mosek.h "${pkgdir}/usr/include/"

	# Install Python bindings.
	cd "${srcdir}/mosek/${_ver}/tools/platform/${_mosekarch}/python"
	python2 2/setup.py install --root="${pkgdir}" --optimize=1
	python3 3/setup.py install --root="${pkgdir}" --optimize=1

	# Install documentation.
	cd "${srcdir}/mosek/${_ver}"
	install -Dm644 mosek-eula.pdf "${pkgdir}/usr/share/licenses/mosek/eula.pdf"
	install -dm755 "${pkgdir}/usr/share/doc/mosek"
	cp -r doc/*.pdf tools/examples "${pkgdir}/usr/share/doc/mosek/"
	rm "${pkgdir}/usr/share/doc/mosek/examples/ampl/test.sh"
	rm "${pkgdir}/usr/share/doc/mosek/examples/"{c,dotnet,java}/Makefile
	rm "${pkgdir}/usr/share/doc/mosek/examples/fusion/"{cxx,dotnet,java}/Makefile
}
