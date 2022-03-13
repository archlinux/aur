# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-selectolax
pkgver=0.3.6
pkgrel=1
pkgdesc="HTML5 parser with CSS selectors"
arch=('x86_64')
url="https://github.com/rushter/selectolax"
license=('MIT')
depends=('python')
makedepends=(
	'python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'cython')
checkdepends=('python-pytest')
changelog=CHANGES.rst
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/s/selectolax/selectolax-$pkgver.tar.gz")
sha256sums=('d71d7ae7bec6e856b83111f270bc783e531d86e02ad3a78a37d8591ff8f3620f')

build() {
	cd "selectolax-$pkgver"
	python -m build --wheel --no-isolation
}

## FIXME: cannot run due to circular imports
# check() {
# 	cd "selectolax-$pkgver"
# 	local _version="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
# 	PYTHONPATH="$PWD/build/lib.linux-$CARCH-$_version" pytest -x
# }

package() {
	export PYTHONHASHSEED=0
	cd "selectolax-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl

	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/selectolax-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
