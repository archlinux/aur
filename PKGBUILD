# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=python-tpm2-pytss
pkgver=1.0.0
_tag=cad39f77780f3fcb45d0cec79d5bf282c853a4e9 # git rev-parse "$pkgver"
pkgrel=2
pkgdesc='Python bindings for tpm2-tss'
arch=('x86_64')
url='https://github.com/tpm2-software/tpm2-pytss'
license=('BSD')
depends=('python' 'python-asn1crypto' 'python-cffi' 'python-cryptography' 'python-pkgconfig' 'tpm2-tss'
         'libtss2-esys.so' 'libtss2-fapi.so' 'libtss2-mu.so' 'libtss2-rc.so' 'libtss2-tctildr.so')
makedepends=('git' 'python-setuptools' 'python-setuptools-scm' 'python-toml')
checkdepends=('python-pytest' 'swtpm')
source=("git+$url.git?signed#tag=$_tag")
sha512sums=('SKIP')
validpgpkeys=('5B482B8E3E19DA7C978E1D016DE2E9078E1F50C1') # William Roberts (Bill Roberts) <william.c.roberts@intel.com>

pkgver() {
	cd "${pkgname#python-}"
	git describe | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	cd "${pkgname#python-}"
	python setup.py build
}

check() {
	cd "${pkgname#python-}"
	cp build/lib.*/tpm2_pytss/_libtpm2_pytss.abi3.so tpm2_pytss
	cp build/lib.*/tpm2_pytss/internal/type_mapping.py tpm2_pytss/internal
	python -B -m pytest
}

package() {
	cd "${pkgname#python-}"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
