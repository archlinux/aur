# Maintainer: Jeremy Gust	<jeremy AT plasticsoup DOT net>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail>

pkgname=python-desktop-notifier
pkgver=3.5.6
pkgrel=1
pkgdesc='Python library for cross-platform desktop notifications'
arch=('any')
url="https://github.com/SamSchott/desktop-notifier"
license=('MIT')
depends=(
	'python-dbus-next'
	'python-packaging'
	'python-certifi'
	'python-charset-normalizer'
	)
makedepends=(
	'python-build'
	'python-installer'
	'python-sphinx'
	'python-sphinx-autoapi'
	'python-sphinx-furo'
	'python-sphinx_mdinclude'
	'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c8bcfcbb49bcc763d9b2af1caea18c4fd4cf2a91238da1f4cfd6d7537622735a')

prepare() {
	cd "${pkgname}-${pkgver}"
	sed -i 's/dekstop/desktop/' docs/conf.py
}

build() {
	cd "${pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
	cd docs
	sphinx-build -b man ./ ./_build/man/
}

package() {
	cd "${pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}/" dist/*.whl
	install -Dvm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dvm644 docs/_build/man/desktop-notifier.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
	install -Dvm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
