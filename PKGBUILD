# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>
# Contributor: Tony Benoy <me@tonybenoy.com>
# Contributor: Jean Lucas <jean@4ray.co>

_pkgname='mail-parser'
pkgname="python-${_pkgname}"
pkgver=4.6.4
pkgrel=3
pkgdesc='Email parsing library for extracting structured data from raw messages'
arch=('any')
url="https://github.com/SpamScope/${_pkgname}"
license=('Apache-2.0')
depends=(
	'python>=3.9'
)
makedepends=(
	'python-build'
	'python-hatchling>=1.27'
	'python-installer'
)
checkdepends=(
	'perl-email-outlook-message'
	'python-extract-msg>=0.54'
	'python-pytest'
	'python-pytest-cov'
	'python-pytest-mock'
)
optdepends=(
	'python-extract-msg>=0.54: Outlook .msg support via the preferred extract-msg backend'
	'perl-email-outlook-message: Outlook .msg support via the deprecated msgconvert fallback'
)
source=(
	"${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
	'hatchling-unrestrict.patch'
)
b2sums=(
	'1c09ca1d5b13f1e8bcd86bf5f99ce7e999f5e82812cc595a993215c53190881e43a02e7f0b494bb87ac00d9ef8442697cb8df9231aa35c769d7a0ae1ae040a8d'
	'bcf6dd1763e0747613dea6cb293866fef3f0f196d3b2c5b617ba53a01192ad62c8935a1b4f84fcd5bd197f311d1f0089388c96ca4e79d821be6c73ba3e6f7547'
)

prepare() {
	cd -- "${_pkgname}-${pkgver}" || return 1
	patch -Np1 --fuzz=0 -i "${srcdir}/hatchling-unrestrict.patch"
}

build() {
	cd -- "${_pkgname}-${pkgver}" || return 1
	python -m build --wheel --no-isolation
}

check() {
	cd -- "${_pkgname}-${pkgver}" || return 1
	PYTHONPATH=src python -m pytest
}

package() {
	cd -- "${_pkgname}-${pkgver}" || return 1
	python -m installer --destdir="${pkgdir}" --compile-bytecode 0 --compile-bytecode=2 dist/*.whl
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt NOTICE.txt
}
