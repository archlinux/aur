# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=tpm2-pytss-git
pkgver=r13.7bcd808
pkgrel=1
pkgdesc='Python bindings for tpm2-tss'
arch=('x86_64')
url='https://github.com/tpm2-software/tpm2-pytss'
license=('BSD')
depends=('python-setuptools' 'tpm2-tss-git')
makedepends=('git' 'swig')
checkdepends=('ibm-sw-tpm2')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git" 'git+https://github.com/tpm2-software/tpm2-swig.git')
sha512sums=('SKIP' 'SKIP')

pkgver() {
	cd "${pkgname%-git}"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${pkgname%-git}"
	git submodule init
	git config submodule.tpm2_pytss/swig.url "$srcdir/tpm2-swig"
	git submodule update
}

build() {
	cd "${pkgname%-git}"
	python setup.py build
}

check() {
	cd "${pkgname%-git}"
	python setup.py test
}

package() {
	cd "${pkgname%-git}"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
