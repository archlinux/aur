# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Victor Engmark <victor.engmark@gmail.com>

pkgname=python-vcard
_pkg="${pkgname#python-}"
pkgver=0.16.1
pkgrel=2
pkgdesc="vCard validator"
arch=('any')
url='https://gitlab.com/engmark/vcard'
license=('AGPL3')
depends=('python-dateutil' 'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-poetry' 'python-wheel')
checkdepends=('python-pytest' 'python-mock')
source=("$pkgname-$pkgver.tar.bz2::$url/-/archive/v$pkgver/vcard-v$pkgver.tar.bz2")
sha256sums=('670fe68bc514e7fea0b7cfe60f6339a3557bcc7132ad2bbe2e0e45e12d473cc4')

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
