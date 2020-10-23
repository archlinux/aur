# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=python-python-pkcs11
_name=${pkgname#python-}
pkgver=0.7.0
pkgrel=1
pkgdesc='PKCS#11/Cryptoki support for Python'
arch=('x86_64')
url='https://github.com/danni/python-pkcs11'
license=('MIT')
depends=('python' 'python-asn1crypto' 'python-cached-property' 'python-setuptools')
makedepends=('cython' 'python-setuptools-scm')
checkdepends=('python-cryptography' 'python-oscrypto' 'softhsm')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        'python-pkcs11_mark-tests-as-xfail.patch')
sha256sums=('9737e0c24cabb8bc9d48bf8c57c3df2a70f8cdd96b70c50290803286f9e46bf7'
            '28a5ce996fe6cb455b55c98e8a46fcd0539dc0b3a70677a390f4dddbe1b55d65')

prepare() {
	cd "$_name-$pkgver"

	sed -n '/^Copyright/,$p' README.rst > LICENSE

	# test_sign_eddsa and test_self_sign_certificate always fail in our build environment
	# (https://github.com/danni/python-pkcs11/issues/63#issuecomment-526812900)
	patch --forward --strip=1 --input="$srcdir/python-pkcs11_mark-tests-as-xfail.patch"
}

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

check() {
	cd "$_name-$pkgver"
	softhsm2-util --init-token --free --label TEST --pin 1234 --so-pin 5678
	export PKCS11_MODULE=/usr/lib/libsofthsm2.so
	export PKCS11_TOKEN_LABEL=TEST
	export PKCS11_TOKEN_PIN=1234
	export PKCS11_TOKEN_SO_PIN=5678
	python setup.py test
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
