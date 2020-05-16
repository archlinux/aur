# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=python-tpm2-pytss
_name=${pkgname#python-}
pkgver=0.1.6
pkgrel=2
pkgdesc='Python bindings for tpm2-tss'
arch=('x86_64')
url='https://github.com/tpm2-software/tpm2-pytss'
license=('BSD')
depends=('python-setuptools' 'tpm2-tss')
makedepends=('swig')
checkdepends=('ibm-sw-tpm2' 'python-cryptography')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "python-tpm2-pytss-0.1.6-fix-tpm2-tss-2.4.1-tests.patch::$url/commit/74f7cf1b71ad4617b83f810da92484cb0f64875e.patch")
sha256sums=('f15510d72d85100eb81c96f92657b9141d7d0b36fe858b69f220b30e50186f55'
            '125d8b74c592fb0522bd157eef5331b903714e41ddd69e147a5ad9ac05aeedb2')

prepare() {
	# Fix test failure with tpm2-tss 2.4.1 (https://github.com/tpm2-software/tpm2-pytss/pull/33)
	cd "$_name-$pkgver"
	patch --strip=1 --input="$srcdir/python-tpm2-pytss-0.1.6-fix-tpm2-tss-2.4.1-tests.patch"
}

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

check() {
	cd "$_name-$pkgver"
	python setup.py test
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
