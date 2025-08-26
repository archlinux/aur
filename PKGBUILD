# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Victor Engmark <victor.engmark@gmail.com>

pkgname=python-vcard
_pkg="${pkgname#python-}"
pkgver=1.0.0
pkgrel=1
pkgdesc="vCard validator"
arch=('any')
url='https://gitlab.com/engmark/vcard'
license=('AGPL3')
depends=('python-dateutil' 'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-poetry' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest' 'python-mock')
source=("$pkgname-$pkgver.tar.bz2::$url/-/archive/v$pkgver/vcard-v$pkgver.tar.bz2")
sha256sums=('e075a830cc3e1d29d929cd3138fdaa71c0fe06436e4ac2d15852058012133fc2')

prepare() {
	cd "$_pkg-v$pkgver"
	sed -i '/data_files/d' setup.py
}

build() {
	cd "$_pkg-v$pkgver"
	## python-packaging too new
	python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
	cd "$_pkg-v$pkgver"
	pytest -x
	# python setup.py test
}

package() {
	cd "$_pkg-v$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 bash-completion/vcard -t "$pkgdir/usr/share/bash-completion/completions/"
}
