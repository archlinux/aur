# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Patrick Lühne <patrick-arch@luehne.de>

pkgname=python-miio
pkgver=0.5.9.1
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
sha512sums=('0b2fa7e27dd3adfa4b79bc96c2d25c335713822704b67bddb0137dce514dd43cfecf6864e976031cf654b5dc92638c8995bf4dfda45ccc03a5f30312e17bc8b2')

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
