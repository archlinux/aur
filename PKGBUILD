# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=python-tpm2-pytss-git
_name=${pkgname#python-}
pkgver=0.1.0.r8.f30f04f
pkgrel=1
pkgdesc='Python bindings for tpm2-tss'
arch=('x86_64')
url='https://github.com/tpm2-software/tpm2-pytss'
license=('BSD')
depends=('python-setuptools' 'tpm2-tss')
makedepends=('git' 'swig')
checkdepends=('ibm-sw-tpm2' 'python-cryptography')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=('tpm2-pytss-git')
source=("git+$url.git" 'git+https://github.com/tpm2-software/tpm2-swig.git')
sha512sums=('SKIP' 'SKIP')

pkgver() {
	cd "${_name%-git}"
	git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
	cd "${_name%-git}"
	git submodule init
	git config submodule.tpm2_pytss/swig.url "$srcdir/tpm2-swig"
	git submodule update
}

build() {
	cd "${_name%-git}"
	python setup.py build
}

check() {
	cd "${_name%-git}"
	python setup.py test
}

package() {
	cd "${_name%-git}"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
