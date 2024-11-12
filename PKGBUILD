# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

pkgauthor=balta2ar
pkgname=brotab
pkgver=1.4.2
pkgrel=1
pkgdesc="Control your browser's tabs from the command line"
arch=('any')
url="https://github.com/${pkgauthor}/${pkgname}"
license=('MIT')
depends=('python' 'python-flask' 'python-requests' 'python-psutil')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest' 'python-pytest-cov')
provides=("${pkgname}")
conflicts=("${pkgname}-bin" "${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d078a3ea5e0c5cc960e3ca9d0be767fa739355e096f5836b13f4c4352a58f262')

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
