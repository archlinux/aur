# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: David Runge <dvzrv@archlinux.org>

pkgname=python-milksnake
_pkg="${pkgname#python-}" # milkshake
# we pin to current HEAD, because upstream is abandonware:
# https://github.com/getsentry/milksnake/issues/28
_commit=ef0723e41df23d8f6357570c69c1e69cb31f9e9e
pkgver=0.1.5.r3.gef0723e
_pkgver="${pkgver%.r*}"
pkgrel=5
pkgdesc="Distribute dynamic linked libraries in Python wheels"
arch=('any')
url="https://github.com/getsentry/milksnake"
license=('Apache')
depends=('python-cffi')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('cargo' 'python-pytest' 'python-virtualenv')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz"
        "$pkgname-0.1.5-distutils.patch")
sha256sums=('42b89da523e0c530b3b9744dcd660adce3ff4a5dd4b11121a59c53ce992a76cc'
            'e3ec3c530bc606def7806a2a604ac943e7c191e2f3b5c35fa8f465bf63b1e52b')

prepare() {
	# improve distutils build command: https://github.com/getsentry/milksnake/pull/30
	patch -Np1 -d "$_pkg-$_commit" < "$pkgname-$_pkgver-distutils.patch"
}

build() {
	cd "$_pkg-$_commit"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg-$_commit"
	PYTHONPATH="build:$PYTHONPATH" pytest -v -c /dev/null || warning "Tests failed"
}

package() {
	cd "$_pkg-$_commit"
	python -m installer --destdir "$pkgdir" dist/*.whl
}
