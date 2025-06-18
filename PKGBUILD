# Maintainer: envolution
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dor com>
# shellcheck shell=bash disable=SC2034,SC2154

_pkgauthor=ilyakurdyukov
pkgname=jpeg-quantsmooth
_pkgbin=jpegqs
pkgver=1.20240129
pkgrel=1
pkgdesc="JPEG artifacts removal based on quantization coefficients"
arch=('x86_64' 'i686')
url="https://github.com/${_pkgauthor}/${pkgname}"
license=('LGPL-2.1-only')

provides=("${_pkgbin}")
makedepends=('gcc' 'make' 'libjpeg-turbo')

source=("https://github.com/${_pkgauthor}/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('fd29e96eede90575de12664556d30d5fd81261da23e70f555af4cb4ecaab640f')


if [[ ${CCARCH} -eq ${arch[0]} ]]; then
	_MFLAGS="-m64"
else
	_MFLAGS="-m32"
fi

build() {
	cd ${pkgname}-${pkgver} || exit 1

	gzip "${_pkgbin}.1"

	make -j SIMD=select MFLAGS="${_MFLAGS}" app
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}" || exit 1

	install -Dm755 "${_pkgbin}" "${pkgdir}/usr/bin/${_pkgbin}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${_pkgbin}.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgbin}.1.gz"
}
# vim:set ts=2 sw=2 et:
