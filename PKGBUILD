# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-akshare
pkgver=1.4.50
pkgrel=1
pkgdesc="Financial data interface library"
arch=('any')
url='https://github.com/akfamily/akshare'
license=('MIT')
depends=(
	'python-beautifulsoup4'
	'python-lxml'
	'python-matplotlib'
	'python-numpy'
	'python-pandas'
	'python-requests'
	'python-urllib3'
	'python-pillow'
	'python-pinyin'
	'python-websocket-client'
	'python-html5lib'
	'python-tqdm'
	'python-xlrd'
	'python-openpyxl'
	'python-jsonpath-ng'
	'python-tabulate'
	'python-decorator'
	'python-pyminiracer')
makedepends=(
	'python-setuptools'
	'python-build'
	'python-installer'
	'python-wheel'
	'python-sphinx'
	'python-sphinx_rtd_theme'
	'python-sphinx-markdown-tables'
	'python-recommonmark')
changelog=changelog.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/release-v$pkgver.tar.gz")
sha256sums=('27a0e1b10eac88124942bc03c1498ed633817fcafd03ed782446b67b4aa955cc')

prepare() {
	cd "akshare-release-v$pkgver"
	sed -i "/find_packages/s/()/(exclude=['tests'])/" setup.py
}

build() {
	cd "akshare-release-v$pkgver"
	python -m build --wheel --no-isolation
	( cd docs; make man )
}

package() {
	export PYTHONHASHSEED=0
	cd "akshare-release-v$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 docs/build/man/akshare.1 -t "$pkgdir/usr/share/man/man1/"
}
