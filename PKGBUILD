# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

pkgname=python-bcj-cffi
_pkg="${pkgname#python-}"
pkgver=0.5.3
_commit=77576ac1fd7e9edb3c1811ecfee286fcf9101673
pkgrel=1
pkgdesc="BCJ(Branch-Call-Jump) filter for python"
arch=('x86_64')
url="https://github.com/miurahr/bcj-cffi"
license=('LGPL')
depends=('python-cffi')
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-setuptools-scm'
	'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('b21159845755ac4df8f06b566730504d5fab53fda16ab09aedc1cfb75159eb04')

prepare() {
	cd "$_pkg-$_commit"
	# thou shalt not force coverage reports on innocent unittest users
	sed -i '8,$d' pyproject.toml
}

build(){
	cd "$_pkg-$_commit"
	SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg-$_commit"
	local python_version="$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')"
	PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$python_version" pytest -x --disable-warnings
}

package() {
	cd "$_pkg-$_commit"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
}
