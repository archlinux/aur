# Maintainer: Ido Rosen <ido@kernel.org>
# Co-Maintainer: Maximilian Stahlberg <maximilian.stahlberg tu-berlin de>
#
# NOTE: To request changes to this package, you can submit a pull request
#       to the GitHub repository at https://github.com/ido/packages-archlinux
#       Otherwise, open a GitHub issue.  Thank you! -Ido

pkgname='mosek'
pkgdesc="A commercial solver for mathematical optimization problems."
epoch=1
_majver=10
_minver=1
_ver=${_majver}.${_minver}
_tnyver=29
pkgver=${_ver}.${_tnyver}
pkgrel=1
arch=('x86_64')
_mosekarch=linux64x86
url='http://mosek.com/'
license=('custom')
depends=('gcc-libs' 'openmp')
makedepends=('python-setuptools')
optdepends=('python: Python bindings')
options=('!strip')

source=("mosek-${pkgver}.tar.bz2::https://download.mosek.com/stable/${pkgver}/mosektools${_mosekarch}.tar.bz2")

sha512sums=('721dd144d241043e34f3ac7e5b3910293ff163ccaf7ee76e33b47a8eebd71cc4a3e09ccb8942fc68c941d0ee812cdc4494d68a4e1309febd50e81c82a84ec73b')

package() {
	# Install shared libraries.
	cd "${srcdir}/mosek/${_ver}/tools/platform/${_mosekarch}/bin"
	install -dm755 "${pkgdir}/usr/lib"
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
	cd "${srcdir}/mosek/${_ver}/tools/platform/${_mosekarch}/python/3"
	python setup.py install --root="${pkgdir}" --optimize=1

	# Install documentation.
	cd "${srcdir}/mosek/${_ver}"
	install -Dm644 mosek-eula.pdf "${pkgdir}/usr/share/licenses/mosek/eula.pdf"
	install -dm755 "${pkgdir}/usr/share/doc/mosek"
	cp -r doc/*.pdf tools/examples "${pkgdir}/usr/share/doc/mosek/"
	rm "${pkgdir}/usr/share/doc/mosek/examples/ampl/test.sh"
	rm "${pkgdir}/usr/share/doc/mosek/examples/"{c,java}/Makefile
	rm "${pkgdir}/usr/share/doc/mosek/examples/fusion/"{cxx,java}/Makefile
}
