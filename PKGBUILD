# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-sacrebleu
_pkg="${pkgname#python-}"
pkgver=2.3.0
pkgrel=1
pkgdesc='Reference BLEU implementation that auto-downloads test sets'
arch=('any')
url="https://github.com/mjpost/sacrebleu"
license=('Apache')
depends=(
	'python-colorama'
	'python-lxml'
	'python-numpy'
	'python-portalocker'
	'python-regex'
	'python-tabulate')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::https://github.com/mjpost/$_pkg/archive/refs/tags/v$pkgver.zip"
        'setup.py.patch')
sha256sums=('88686b7e9fed754c4e667fa380ed1127e0d82923a16d1f0d95af02f5bc0c12c5'
            'f1c476ca26f36cdf55cad6c4452c3a9d84ff7b962b17e28a7c2a622753f6ced7')

prepare() {
    patch -p1 -d "$_pkg-$pkgver" < setup.py.patch
}

build() {
	python -m build -nw "$_pkg-$pkgver"
}

check() {
	cd "$_pkg-$pkgver"
	PYTHONPATH="$PWD" pytest -x
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
}
