# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Alexander Bruegmann <mail[at]abruegmann[dot]eu>

pkgname=python-pytenable
_pkg=pyTenable
pkgver=1.4.4
pkgrel=1
pkgdesc="Python library to interface into Tenable's products and applications"
arch=('any')
url="https://github.com/tenable/pyTenable"
license=('MIT')
depends=(
	'python-box'
	'python-dateutil'
	'python-defusedxml'
	'python-ipaddress'
	'python-marshmallow'
	'python-requests'
	'python-requests-pkcs12'
	'python-restfly'
	'python-semver'
	'python-typing-extensions'
	'python-urllib3')
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-sphinx'
	'python-wheel')
optdepends=('python-docker: Docker support')
checkdepends=(
	'python-pytest'
	'python-pytest-datafiles'
	'python-pytest-vcr'
	'python-responses')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('5c78977314942568925a438ba953b23914a8aebc985ceb4b3adfffe9688e6d5b')

prepare() {
	cd "$_pkg-$pkgver"
	sed -i '/exclude=/s/tests/*tests*/' setup.py
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
	make -C docs man
}

check() {
	cd "$_pkg-$pkgver"
	pytest -x --disable-warnings
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 docs/_build/man/pytenable.1 -t "$pkgdir/usr/share/man/man1/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/$_pkg-$pkgver.dist-info/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/"
}
