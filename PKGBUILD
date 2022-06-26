# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=python-pypinfo
_pkg="${pkgname#python-}"
pkgver=21.0.0
pkgrel=1
pkgdesc="View PyPI download statistics with ease"
arch=('any')
url="https://github.com/ofek/pypinfo"
license=('MIT')
depends=(
	'python>=3.7'
	'python-binary'
	'python-click'
	'python-google-cloud-bigquery'
	'python-packaging'
	'python-platformdirs'
	'python-tinydb'
	'python-tinyrecord')
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-wheel')
changelog=CHANGELOG.rst
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('4a500a989977de2f2ea2b05e4d84a5a0caef7d43dffbe40ab581cbf60cc78293')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/$_pkg-$pkgver.dist-info/license_files/LICENSE.txt" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
