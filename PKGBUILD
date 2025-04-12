# Maintainer: Maximilian Stahlberg <maximilian.stahlberg tuhh de>
# Maintainer: Ido Rosen <ido@kernel.org>

pkgname=mosek
pkgdesc="A commercial solver for mathematical optimization problems."
pkgver=11.0.16
pkgrel=1
epoch=1
arch=('x86_64')
_ver=${pkgver%.*}
_mosekarch=linux64x86
url='https://www.mosek.com'
license=('custom')
depends=('gcc-libs' 'openmp')
makedepends=('python-setuptools' 'execstack')
optdepends=('python: Python bindings')
options=('!strip')
source=("mosek-${pkgver}.tar.bz2::https://download.mosek.com/stable/${pkgver}/mosektools${_mosekarch}.tar.bz2")
sha256sums=('322716fd9f9f580854027a43c4c7f5f9587321e5b5e57a53ffdc91dac2494f79')

prepare() {
	# Work around "ImportError: libmosek64.so.11.0: cannot enable executable
	# stack as shared object requires: Invalid argument"
	execstack -c "${srcdir}/mosek/${_ver}/tools/platform/${_mosekarch}/bin/libmosek64.so.${_ver}"
}

package() {
	# Install shared libraries.
	cd "${srcdir}/mosek/${_ver}/tools/platform/${_mosekarch}/bin"
	install -dm755 "${pkgdir}/usr/lib"
	install -m755 "libmosek64.so.${_ver}" "${pkgdir}/usr/lib/"
	install -m755 "libmosekxx${_ver/./_}.so" "${pkgdir}/usr/lib/"
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
	rm "${pkgdir}/usr/share/doc/mosek/examples/"{c,java}/Makefile
	rm "${pkgdir}/usr/share/doc/mosek/examples/fusion/"{cxx,java}/Makefile
}
