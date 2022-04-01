# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-fdutil
_name=fdutil
pkgver=1.16.0
pkgrel=2
pkgdesc="Collection of Python utilities for manipulating files and data"
url="https://bitbucket.org/davisowb/fdutil"
arch=('any')
license=('MIT')
depends=(
	'python-future'
	'python-ruamel-yaml'
	'python-pyperclip'
	'python-logging-helper' ## AUR
	'python-configurationutil' ## AUR
	'python-conversionutil' ## AUR
	'python-stateutil' ## AUR
	'python-watchdog'
	'python-dominate')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/f/fdutil/fdutil-$pkgver.tar.gz")
sha256sums=('990da8f8012aeb9dcf7db82e56d9cfd9644a43e9655e424de7b9db2a91134538')

prepare() {
	cd "$_name-$pkgver"
	sed -i "/packages=/s/()/(exclude=['*unittests*'])/" setup.py
}

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

## FIXME: unit tests are missing test data
# check() {
# 	cd "$_name-$pkgver"
# 	python -m unittest discover
# }

package() {
	cd "$_name-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl

	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/$_name-$pkgver.dist-info/LICENSE.txt" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
