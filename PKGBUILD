# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-akshare
pkgver=1.6.21
pkgrel=1
pkgdesc="Financial data interface library"
arch=('any')
url='https://github.com/akfamily/akshare'
license=('MIT')
depends=(
	'python-beautifulsoup4'
	'python-lxml'
	'python-pandas'
	'python-requests'
	'python-requests-cache'
	'python-urllib3'
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
sha256sums=('19d2610c2595a16fa743df720e0939a689fb11059fc06ee8f9ffc21a6b24cbf1')

prepare() {
	cd "akshare-release-v$pkgver"
	sed -i "/find_packages/s/()/(exclude=['tests'])/" setup.py
}

build() {
	cd "akshare-release-v$pkgver"
	python -m build --wheel --no-isolation
	make -C docs man
}

package() {
	cd "akshare-release-v$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 docs/build/man/akshare.1 -t "$pkgdir/usr/share/man/man1/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/akshare-$pkgver.dist-info/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/"
}
