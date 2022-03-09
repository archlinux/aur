# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Patrick Lühne <patrick-arch@luehne.de>

pkgname=python-miio
pkgver=0.5.11
pkgrel=1
pkgdesc="Python library & console tool for controlling Xiaomi smart appliances"
url="https://github.com/rytilahti/python-miio"
arch=('any')
license=('GPL3')
depends=(
	'python-appdirs'
	'python-attrs'
	'python-click'
	'python-construct'
	'python-croniter'
	'python-cryptography'
	'python-defusedxml'
	'python-netifaces'
	'python-pytz'
	'python-tqdm'
	'python-yaml'
	'python-zeroconf')
optdepends=('python-android-backup-tools: Android backup extraction support')
makedepends=(
	'python-poetry-core'
	'python-build'
	'python-installer'
	'python-wheel'
	'python-pytest'
	'python-sphinx'
	'python-sphinx-click'
	'python-sphinx_rtd_theme'
	'python-sphinxcontrib-apidoc')
install=miio.install
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('804029ffa10760d3563b9025e3a074e5622494562c412ef4a3d7d8b62e2bd01ac3f4ee65de1d271143196464355f58a38364460454ead647254989d6ff550b12')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
	cd docs
	PYTHONPATH=../ make man
}

package() {
	export PYTHONHASHSEED=0
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 "docs/_build/man/$pkgname.1" -t "$pkgdir/usr/share/man/man1/"
}
