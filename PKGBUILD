# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=python-aioimaplib
_pkg="${pkgname#python-}"
pkgver=0.9.0
pkgrel=3
pkgdesc='Python asyncio IMAP4rev1 client library'
arch=('any')
url='https://github.com/bamthomas/aioimaplib'
license=('GPL3')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=(
	'python-asynctest'
	'python-docutils'
	'python-imaplib2' ## AUR
	'python-mock'
	'python-nose'
	'python-pyopenssl'
	'python-pytz'
	'python-twine'
	'python-tzlocal')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "python310.patch::$url/compare/0.9.0...21da21f.diff")
sha256sums=('3d4700f019e7a6459a6b88ef5f1ee3441f600554938490405f172313835e2749'
            '43030b610417278c3046eac82a71f8d8e207c13ce81015dedb04ac1df878b46b')

prepare() {
	patch -p1 -d "$_pkg-$pkgver" < python310.patch
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg-$pkgver"
	nosetests
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
}
