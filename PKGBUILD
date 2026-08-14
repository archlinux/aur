# Maintainer: @RubenKelevra <cyrond@gmail.com>

_pkgname='multibase'
_srcname="py-${_pkgname}"
pkgname="python-${_pkgname}"
pkgver=2.0.0
pkgrel=1
pkgdesc='Multibase implementation for Python'
arch=('any')
url="https://github.com/multiformats/${_srcname}"
license=('MIT')
depends=(
	'python>=3.10'
	'python<4'
	'python-baseconv>=1.2.0'
	'python-baseconv<2'
	'python-six>=1.10.0'
	'python-six<2'
	'python-morphys>=1.0'
	'python-morphys<2'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-wheel'
)
checkdepends=('python-pytest')
source=(
	"${_srcname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
	'fix-setuptools-license-metadata.patch'
)
b2sums=(
	'8c79430c18fbc4a1329be1656157ac56ff5c35465fb950afa01f5169c6fba0a57d06cc8afcaf0be38b1c384d166974caca94b82a1066d48ed731e0c9ae36989d'
	'321e2b908e2866476db379bb3e0e95f287b6381f4085ae0b9473b72899f96a0aa5f8cbcc11c50324e857d86486824c0aeb9dbee32a59e2facbf79e7a573f2545'
)

prepare() {
	cd -- "${_srcname}-${pkgver}" || return 1
	patch --forward --fuzz=0 --strip=1 --input="${srcdir}/fix-setuptools-license-metadata.patch"
}

build() {
	cd -- "${_srcname}-${pkgver}" || return 1
	python -m build --wheel --no-isolation
}

check() {
	cd -- "${_srcname}-${pkgver}" || return 1
	python -m pytest
}

package() {
	cd -- "${_srcname}-${pkgver}" || return 1
	python -m installer --destdir="${pkgdir}" --compile-bytecode 2 dist/*.whl
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
