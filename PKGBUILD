# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Christian Schwarz <me@cschwarz.com>

pkgname=python-yoctopuce
_pkg="${pkgname#python-}"
pkgver=1.10.50357
pkgrel=1
pkgdesc="Yoctopuce library for Python"
arch=('any')
url='https://github.com/yoctopuce/yoctolib_python'
license=('custom')
depends=('python' 'yoctopuce')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/y/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('9309fbc0fc55bcf3ee5f2c4ec0186dc768aefafcb2bb6fac5eed91ed7cbaf4f0')

prepare() {
	cd "$_pkg-$pkgver/$_pkg/"
	rm cdll/*
	sed -i '/yoctopuce/c\recursive-include   yoctopuce *.py *.so' ../MANIFEST.in
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/" "$pkgdir/$_site/$_pkg/cdll"
	ln -s "$_site/$_pkg-$pkgver.dist-info/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	ln -s /usr/lib/libyapi.so "$pkgdir/$_site/$_pkg/cdll/"
}
