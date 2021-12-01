# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Patrick Lühne <patrick-arch@luehne.de>

pkgname=python-miio
pkgver=0.5.9
pkgrel=1
pkgdesc="Python library & console tool for controlling Xiaomi smart appliances"
url="https://github.com/rytilahti/python-miio"
arch=('any')
license=('GPL3')
depends=(
	'python>=3.6'
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
	'python-dephell'
	'python-setuptools'
	'python-pytest'
	'python-sphinx'
	'python-sphinx-click'
	'python-sphinx_rtd_theme'
	'python-sphinxcontrib-apidoc')
install=miio.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('d5b67e7cfb4781b1e55e4d931bd5c88b53ddd072494b5c25ab3bcd2339b89ad75f7195f4c2baa83f34fcefd19ab8f097f102d46428413922c3853c57e9945b05')

prepare() {
	cd "$pkgname-$pkgver"
	dephell deps convert --from pyproject.toml --to setup.py
}

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
	cd docs
	PYTHONPATH=../ make man
}

package() {
	cd "$pkgname-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --optimize=1 --root="${pkgdir}" --skip-build
	install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 "docs/_build/man/$pkgname.1" -t "$pkgdir/usr/share/man/man1/"
}
