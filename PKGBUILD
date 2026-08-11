# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Grey Christoforo <first name at last name dot net>

_pkgname='tesserocr'
pkgname="python-${_pkgname}"
pkgver='2.11.0'
pkgrel=1
pkgdesc='A simple, Pillow-friendly, Python wrapper around tesseract-ocr API using Cython'
arch=('x86_64')
url="https://github.com/sirfz/${_pkgname}"
license=('MIT')
depends=(
	'leptonica'
	'python'
	'tesseract'
	'python-cysignals'
)
makedepends=(
	'cython'
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-wheel'
)
optdepends=('python-pillow: support PIL.Image objects')
source=(
	"${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
	'cython-3.2.patch'
)
b2sums=(
	'90afc4841a98ea81ef4ab7d8d9803f7e7d2814c92618f9341cd02abba95412f3eff975396f7624c04a2488330232739223df7acd92c953d5ef7ac208a1d0529f'
	'c4ac810091946baec5b15774d3027d08c1518a16c51cf72e58c5b1943b5bee1fdebfb9afc3b5abd1ebc0c4cd3a525c5b2d9494ae2fca01886cc0f929dc19c276'
)

prepare() {
	cd -- "${_pkgname}-${pkgver}" || return 1
	patch -Np1 -i "${srcdir}/cython-3.2.patch"
}

build() {
	cd -- "${_pkgname}-${pkgver}" || return 1
	python -m build --wheel --no-isolation
}

package() {
	cd -- "${_pkgname}-${pkgver}" || return 1
	python -m installer --destdir="${pkgdir}" --compile-bytecode 2 dist/*.whl
	install -D -m644 -- LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
