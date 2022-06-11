# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kazuki Sawada <kazuki@6715.jp>
# Contributor: Lalit Maganti <laitmaganti@gmail.com>
# Contributor: Brendan MacDonell <macdonellba at gmail dot com>

pkgname=s3ql
pkgver=4.0.0
pkgrel=1
pkgdesc="A full-featured file system for online data storage."
arch=('x86_64')
url="https://github.com/s3ql/s3ql"
license=('GPL3')
depends=(
	'python-cryptography'
	'python-defusedxml'
	'python-apsw'
	'python-trio'
	'python-pyfuse3'
	'python-dugong'
	'python-systemd'
	'python-requests'
	'python-google-auth'
	'python-google-auth-oauthlib')
makedepends=('git' 'cython' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
install=s3ql.install
changelog=CHANGELOG
source=("$pkgname::git+$url#tag=release-$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('ED31791B2C5C1613AF388B8AD113FCAC3C4E599F') # Nikolaus Rath

prepare() {
	cd "$pkgname"
	## disable developer mode
	rm MANIFEST.in
}

build() {
	cd "$pkgname"
	## python-build doesn't build cython objects first
	python setup.py build_cython
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}
