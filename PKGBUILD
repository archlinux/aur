# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Patrick Lühne <patrick-arch@luehne.de>

pkgname=python-miio
pkgver=0.5.10
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
	'python-sphinx'
	'python-sphinx-click'
	'python-sphinx_rtd_theme'
	'python-sphinxcontrib-apidoc')
install=miio.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('5997b973ed9119b0f33ec532fbb90af81cab34e08bbcd3e23b23c0d041b57994712a026ef7f79d7ac242e8db685af4c09b833cd19eea289a5edf85f5717eed3d')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --skip-dependency-check --no-isolation
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
