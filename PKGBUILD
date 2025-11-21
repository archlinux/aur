# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Daniel Chesters <archlinux@coin-coin.xyz>
# Contributor: RiverOnVenus <error@zhui.dev>

pkgname=python-terminaltexteffects
_pkgname=terminaltexteffects
pkgver=0.13.0
pkgrel=2
pkgdesc='Visual effects engine applied to text in the terminal. '
url="https://github.com/ChrisBuilds/terminaltexteffects"
arch=('any')
license=('MIT')

makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-poetry-core' 'python-hatchling')
depends=('python')

conflicts=('terminaltexteffects')
provides=('tte')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/release-${pkgver}.tar.gz"
		"fix.patch")
b2sums=('1ea2e59d28f5c6f02e73f0c93d41f1e118d20ce53ff23988ed185037a3de26037e6f67d586caf03f41c609c42294e2380067a515b8c45c30b41e0b5f8333cf7f'
        'c40b415890eef27a5722ed88acf424c2d52ec3dc640b5bb3220f916c454ade780496d0b1f29adf431eb78427c35ac5363540b0f951ecea15239ee3ea6c08db1e')

prepare() {
	cd "${srcdir}" || exit

	patch -p1 < ./fix.patch
}

build() {
	cd "${_pkgname}-release-${pkgver}" || exit

	python -m build --wheel --no-isolation
}

package() {
	cd "${_pkgname}-release-${pkgver}" || exit

	python -m installer --destdir="${pkgdir}" dist/*.whl

	rm -rf "${pkgdir}/usr/bin/terminaltexteffects"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
