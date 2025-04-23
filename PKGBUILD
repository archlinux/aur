# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Maintainer: taotieren <admin@taotieren.com>
# Contributor: Christian Schwarz <me@cschwarz.com>

pkgname=python-yoctopuce
_pkg="${pkgname#python-}"
pkgver=2.1.5971
pkgrel=1
pkgdesc="Yoctopuce library for Python"
arch=('any')
url='https://github.com/yoctopuce/yoctolib_python'
license=('LicenseRef-custom')
depends=(
	'python'
	'yoctopuce'
)
makedepends=(
	'python-build'
	'python-hatchling'
	'python-installer'
	'python-setuptools'
	'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/y/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('c65a3eed271218c5ae662e2099f5b353e880f1ec476d2e056aa73c0707e51344')

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
	ln -s /usr/lib/libyocto.so "$pkgdir/$_site/$_pkg/cdll/"
	install -Dm644 Documentation/yoctolib-python* -t "$pkgdir/usr/share/doc/${pkgname}/"
}
