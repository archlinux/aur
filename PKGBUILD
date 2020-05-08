# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=python-tpm2-pytss
_name=${pkgname#python-}
pkgver=0.1.5
pkgrel=1
pkgdesc='Python bindings for tpm2-tss'
arch=('x86_64')
url='https://github.com/tpm2-software/tpm2-pytss'
license=('BSD')
depends=('python-setuptools' 'tpm2-tss')
makedepends=('swig')
checkdepends=('ibm-sw-tpm2' 'python-cryptography')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        'https://raw.githubusercontent.com/tpm2-software/tpm2-pytss/ad4c2a961135a069ba86410e1236162a9071e66b/examples/fapi_get_random.py')
sha256sums=('fb68f3f47ffe9fe365d3fd1e832b5c0568e21c0c962487cca5de50acdda6b181'
            '648beb5331a8c905e276c62fca3ea2e3231fa3c011a8ff277b69344ede3c4761')

prepare() {
	cd "$_name-$pkgver"
	# Add missing file required by the test suite
	# (https://github.com/tpm2-software/tpm2-pytss/pull/32)
	mkdir examples
	cp "$srcdir/fapi_get_random.py" -t examples
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
