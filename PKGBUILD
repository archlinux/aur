# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: pfm <vorticity at mail dot ru>

pkgname=python-pem
pkgver=21.2.0
pkgrel=2
pkgdesc="Parsing and splitting PEM files"
arch=('any')
url="https://github.com/hynek/pem"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-certifi' 'python-pretend' 'python-pyopenssl')
changelog=CHANGELOG.rst
source=(
	"$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/pem/pem-$pkgver.tar.gz"
	"$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/p/pem/pem-$pkgver.tar.gz.asc")
sha256sums=('c491833b092662626fd58a87375d450637d4ee94996ad9bbbd42593428e93e5a'
            'SKIP')
validpgpkeys=('C2A04F86ACE28ADCF817DBB7AE2536227F69F181') ## Hynek Schlawack

build() {
	cd "pem-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "pem-$pkgver"
	PYTHONPATH=./src pytest -x --disable-warnings
}

package() {
	export PYTHONHASHSEED=0
	cd "pem-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl

	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/pem-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
