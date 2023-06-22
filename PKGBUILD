# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: pfm <vorticity at mail dot ru>

pkgname=python-pem
_name=${pkgname#python-}
pkgver=23.1.0
pkgrel=1
pkgdesc="Parsing and splitting PEM files"
arch=('any')
url="https://github.com/hynek/pem"
license=('MIT')
depends=('python' 'python-pyopenssl' 'python-twisted')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' 'python-hatch-vcs' 'python-hatch-fancy-pypi-readme')
checkdepends=('python-pytest' 'python-certifi' 'python-pretend')
changelog=CHANGELOG.rst
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('06503ff2441a111f853ce4e8b9eb9d5fedb488ebdbf560115d3dd53a1b4afc73')
#validpgpkeys=('C2A04F86ACE28ADCF817DBB7AE2536227F69F181') ## Hynek Schlawack

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_name-$pkgver"
	PYTHONPATH=./src pytest -x --disable-warnings -k 'not test_packaging'
}

package() {
	export PYTHONHASHSEED=0
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl

	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/pem-$pkgver.dist-info/licenses/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
