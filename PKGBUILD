# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Patrick Lühne <patrick-arch@luehne.de>

## Using tarballs from GitHub to build manpages

pkgname=python-miio
pkgver=0.5.12
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
	'python-build'
	'python-installer'
	'python-poetry-core'
	'python-pytest'
	'python-sphinx'
	'python-sphinx-click'
	'python-sphinx_rtd_theme'
	'python-sphinxcontrib-apidoc'
	'python-wheel')
install=miio.install
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        'remove-tests.patch')
sha256sums=('8a2d369913247e0e62102ee11d6fc026917c710e831863362d4abdcef818e3f1'
            'a0f3a1e3b926221f41704601d89142c5fb999d009743b7781cb63446c810f4dd')

prepare() {
	patch -p1 -d "$pkgname-$pkgver" < remove-tests.patch
}

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
	PYTHONPATH="$PWD" make -C docs man
}

package() {
	cd "$pkgname-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 "docs/_build/man/$pkgname.1" -t "$pkgdir/usr/share/man/man1/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/${pkgname/-/_}-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
