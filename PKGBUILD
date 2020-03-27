# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=python-tpm2-pytss
_name=${pkgname#python-}
pkgver=0.1.0
_tag=a6ad933536c59991badf98bdfd3f80afc18a1af5 # git show-ref "$pkgver"
pkgrel=1
pkgdesc='Python bindings for tpm2-tss'
arch=('x86_64')
url='https://github.com/tpm2-software/tpm2-pytss'
license=('BSD')
depends=('python-setuptools' 'tpm2-tss')
makedepends=('git' 'swig')
checkdepends=('ibm-sw-tpm2')
source=("git+$url.git#tag=$_tag" 'git+https://github.com/tpm2-software/tpm2-swig.git')
sha512sums=('SKIP' 'SKIP')

pkgver() {
	cd "$_name"
	git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
	cd "$_name"
	git submodule init
	git config submodule.tpm2_pytss/swig.url "$srcdir/tpm2-swig"
	git submodule update
}

build() {
	cd "$_name"
	python setup.py build
}

check() {
	cd "$_name"
	python setup.py test
}

package() {
	cd "$_name"
	python setup.py install --root="$pkgdir" --optimize=1
	rm -r "$pkgdir"/usr/lib/python*/site-packages/tests
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
