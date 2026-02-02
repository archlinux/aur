# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor=balta2ar
pkgname=brotab
pkgver=1.5.0
pkgrel=2
pkgdesc="Control your browser's tabs from the command line"
arch=('any')
url="https://github.com/${pkgauthor}/${pkgname}"
license=('MIT')
depends=('python' 'python-flask' 'python-requests' 'python-psutil')
makedepends=('git' 'python-setuptools')
provides=("${pkgname}")
conflicts=("${pkgname}-bin" "${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
		"json-output.patch"
		"asyncio.patch")
sha256sums=('1159b201abfdd4436c1a114985e052e97db87deffebf8c92df8e8b64f3a131b5'
            '68d6c02c64afcc7da5755795ec86c33a95a7aa00c4f4b99557aaf03b70b4b64d'
            '57aec43cfda79a277a7429032fc82a1ad412a60a4a2f5c8564c9a366d822a21c')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}" || return

	patch --forward --strip=1 --input="${srcdir}/json-output.patch"
	patch --forward --strip=1 --input="${srcdir}/asyncio.patch"
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}" || return

	sed -i '/^import pip$/d' setup.py || :
	sed -i 's/==.*//' requirements/*.txt

	python3 setup.py build
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
