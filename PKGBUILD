# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-akshare-git
pkgver=1.4.50.r45.g27d1bdea
pkgrel=1
pkgdesc="Financial data interface library"
arch=('any')
url='https://www.akshare.xyz'
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
	'git'
	'python-setuptools'
	'python-build'
	'python-installer'
	'python-wheel')
provides=("${pkgname%-git}=${pkgver%.r*}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+https://github.com/akfamily/akshare")
sha256sums=('SKIP')

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^release-v//;s/-/.r/;s/-/./'
}

prepare() {
	cd "$pkgname"
	sed -i "/find_packages/s/()/(exclude=['tests'])/" setup.py
}

build() {
	cd "$pkgname"
	python -m build --wheel --no-isolation
}

package() {
	export PYTHONHASHSEED=0
	cd "$pkgname"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
