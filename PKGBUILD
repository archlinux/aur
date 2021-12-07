# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=python-tpm2-pytss-git
_name=${pkgname#python-}
pkgver=0.1.9.r736.0f48299
pkgrel=1
pkgdesc='Python bindings for tpm2-tss'
arch=('x86_64')
url='https://github.com/tpm2-software/tpm2-pytss'
license=('BSD')
depends=('python' 'python-asn1crypto' 'python-cffi' 'python-cryptography' 'tpm2-tss'
         'libtss2-esys.so' 'libtss2-fapi.so' 'libtss2-mu.so' 'libtss2-rc.so' 'libtss2-tctildr.so')
makedepends=('git' 'python-pkgconfig' 'python-setuptools' 'python-setuptools-scm' 'python-toml')
checkdepends=('python-pytest' 'swtpm')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=('tpm2-pytss-git')
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
	cd "${_name%-git}"
	git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	cd "${_name%-git}"
	python setup.py build
}

check() {
	cd "${_name%-git}"
	cp build/lib.*/tpm2_pytss/_libtpm2_pytss.abi3.so tpm2_pytss
	cp build/lib.*/tpm2_pytss/internal/type_mapping.py tpm2_pytss/internal
	python -B -m pytest
}

package() {
	cd "${_name%-git}"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
