# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: David Runge <dvzrv@archlinux.org>

pkgname=python-milksnake
_pkg="${pkgname#python-}" # milkshake
# we pin to current HEAD, because upstream is abandonware:
# https://github.com/getsentry/milksnake/issues/28
_commit=ef0723e41df23d8f6357570c69c1e69cb31f9e9e
pkgver=0.1.5.r3.gef0723e
_pkgver="${pkgver%.r*}"
pkgrel=2
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
            '3de5520219bc857aa20a38af0eaf2562eb646b1445889ed6b2379f89d46ad1a6')

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
	PYTHONPATH="build:$PYTHONPATH" pytest -v -c /dev/null
}

package() {
	cd "$_pkg-$_commit"
	python -m installer --destdir "$pkgdir" dist/*.whl
}
