# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Simone Riva <simone.rva@gmail.com>

pkgname=python-rawpy
_pkg="${pkgname#python-}"
pkgver=0.17.1
pkgrel=1
pkgdesc="Python wrapper for the libraw library"
arch=('x86_64')
license=('MIT')
url="https://github.com/letmaik/rawpy"
depends=('libraw' 'python-numpy')
optdepends=('python-scikit-image' 'python-opencv')
makedepends=('python-setuptools' 'cython' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-imageio' 'python-scikit-image')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('418b8869b6906e0ec247402a2273b5ccca4e44960d0bc7eb2d09a617930654f7')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg-$pkgver"
	local _ver="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
	PYTHONPATH="$PWD/build/lib.linux-$CARCH-$_ver" pytest -x
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
