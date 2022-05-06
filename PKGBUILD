# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Alexander Bruegmann <mail[at]abruegmann[dot]eu>
# Contributor: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>

pkgname=python-pymisp
_pkg="${pkgname#python-}"
pkgver=2.4.157
pkgrel=1
pkgdesc="Python library to access MISP platforms via their REST API"
arch=('any')
url="https://github.com/MISP/PyMISP"
license=('BSD')
depends=(
	'python>=3.8'
	'python-jsonschema'
	'python-requests'
	'python-dateutil'
	'python-deprecated')
optdepends=(
	'lief: python-pymisp[fileobjects] support'
	'python-oletools: python-pymisp[email] support'
	'python-magic: python-pymisp[fileobjects] support'
	'python-beautifulsoup4: python-pymisp[openioc] support'
	'python-validators: python-pymisp[virustotal] support'
	'python-recommonmark: python-pymisp[docs] support'
  'python-reportlab: python-pymisp[reportlab] support'
	'python-urllib3: python-pymisp[brotli] support'
	'python-pyfaup: python-pymisp[url] support'
	'python-chardet: python-pymisp[url] support')
makedepends=('python-poetry-core' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz"
        'remove-datafiles.patch')
sha256sums=('b19d6d565972b391f90e8fe7050101b3b84f45f83214d3bf9b339a6490856cf2'
            'e97b356e9e3f8af08bb19c4c2356ed7f729b6a3d652b85f9ff4fb263763bb0fc')

prepare() {
	patch -p1 -d "$_pkg-$pkgver" < remove-datafiles.patch
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/$_pkg-$pkgver.dist-info/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/"
}
