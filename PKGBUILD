# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

pkgauthor=balta2ar
pkgname=brotab
pkgver=1.4.2
pkgrel=2
pkgdesc="Control your browser's tabs from the command line"
arch=('any')
url="https://github.com/${pkgauthor}/${pkgname}"
license=('MIT')
depends=('python' 'python-flask' 'python-requests' 'python-psutil')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest' 'python-pytest-cov')
provides=("${pkgname}")
conflicts=("${pkgname}-bin" "${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
		"json-output.patch")
sha256sums=('d078a3ea5e0c5cc960e3ca9d0be767fa739355e096f5836b13f4c4352a58f262'
            '68d6c02c64afcc7da5755795ec86c33a95a7aa00c4f4b99557aaf03b70b4b64d')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}" || return

	patch --forward --strip=1 --input="${srcdir}/json-output.patch"
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}" || return

	sed -i '/^import pip$/d' setup.py || :
	sed -i 's/==.*//' requirements/*.txt

	python3 setup.py build
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}" || return

	pytest
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}" || return

	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
	install -Dm644 "INTEGRATION.md" "${pkgdir}/usr/share/doc/${pkgname}/INTEGRATION.md"
	install -Dm644 "DEVELOPMENT.md" "${pkgdir}/usr/share/doc/${pkgname}/DEVELOPMENT.md"
}
