# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>

_pkgname='rtfde'
_srcname='RTFDE'
pkgname="python-${_pkgname}"
pkgver=0.1.2.2
pkgrel=1
pkgdesc='RTF de-encapsulator for extracting HTML and plain text from encapsulated RTF bodies'
arch=('any')
url="https://github.com/seamustuohy/${_srcname}"
license=('LGPL-3.0-or-later')
depends=(
	'python'
	'python-lark-parser>=1.3.0'
	'python-lark-parser<1.4'
	'python-oletools>=0.56'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-wheel'
)
checkdepends=(
	'python-lxml>=6.0'
	'python-lxml<7'
)
source=(
	"${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
	'fix-flaky-binary-data-test.patch'
)
b2sums=(
	'66650f29417947048262ba3310a2cab8ea5a4de9123ddc4ebed48cc3be3b3bcc0213b121a85cf5ea3ecf4e06d9939e5ed394371673e2553a2a76aa8175d65315'
	'f4c459dcf4d460b52639475897a496709bae842f39a77ea16105339d66186a77c0cc12ebd528634f94cd5d7fb929112f7c9eedbb2945458468310ba772e373fc'
)

prepare() {
	cd -- "${_srcname}-${pkgver}" || return 1
	patch -Np1 -i "${srcdir}/fix-flaky-binary-data-test.patch"
}

build() {
	cd -- "${_srcname}-${pkgver}" || return 1
	python -m build --wheel --no-isolation
}

check() {
	cd -- "${_srcname}-${pkgver}" || return 1
	python -m unittest discover -v
}

package() {
	cd -- "${_srcname}-${pkgver}" || return 1
	python -m installer --destdir="${pkgdir}" --compile-bytecode 2 dist/*.whl
}
