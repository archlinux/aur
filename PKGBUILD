# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Ben Westover <kwestover.kw@gmail.com>

pkgname=python-blspy
_pkg="${pkgname#python-}"
pkgver=1.0.16
pkgrel=1
pkgdesc='Python BLS Signatures implementation'
url='https://github.com/Chia-Network/bls-signatures'
arch=('x86_64')
license=('Apache')
depends=('python' 'gmp')
makedepends=(
	'cmake'
	'git'
	'pybind11'
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-setuptools-scm'
	'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz"
        'CXXFLAGS.patch')
sha256sums=('5c005d4ba082509a59f4dd55adad3bf15d07a03537daed65df2cfde99287c057'
            '15b18c754175b1a697e62c509e26864316c6a39825f5e2c87495a2f9a1b7bb7f')

prepare() {
	cd "$_pkg-$pkgver"
	patch -p1 < "$srcdir/CXXFLAGS.patch"
	sed -i "s/\${CXXFLAGS}/${CXXFLAGS}/" CMakeLists.txt
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}
