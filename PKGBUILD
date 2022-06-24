# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=python-pyinstrument
_pkg="${pkgname#python-}"
pkgver=4.1.1
pkgrel=2
pkgdesc="Call stack profiler for Python"
arch=('x86_64')
url="https://github.com/joerick/pyinstrument"
license=('BSD')
depends=('python>=3.7')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
# checkdepends=(
# 	'python-pytest'
# 	'python-pytest-asyncio'
# 	'python-flaky'
# 	'python-trio'
# 	'python-django'
# 	'python-sphinx'
# 	'python-myst-parser'
# 	'python-greenlet')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('1dc2791d2cd2fd3459cb55010004a5cc2a9a8b4625a0cbea45a4b1aebbe2c3a2')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

# check() {
# 	cd "$_pkg-$pkgver"
# 	local _ver="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
# 	PYTHONPATH="$PWD/build/lib.linux-$CARCH-$_ver" pytest -x
# }

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
