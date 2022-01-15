# Maintainer: Yangtse Su <yangtsesu@gmail.com>
# Contributor: Iyán Méndez Veiga <me (at) iyanmv (dot) com>

_pkgname=nfcpy
pkgname=(python-${_pkgname}-git python-${_pkgname}-examples-git)
pkgver=1.0.3.r19.gacc6d32
pkgrel=2
arch=('any')
url="https://github.com/nfcpy/nfcpy"
license=('custom:EUPL')
makedepends=('python-setuptools')
source=("${_pkgname}::git+https://github.com/${_pkgname}/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	python setup.py build
}

package_python-nfcpy-git() {
	pkgdesc="Module to read/write NFC tags or communicate with another NFC device."
	depends=(
	    'python-libusb1'
	    'python-pyserial'
	    'python-ndeflib'
	    'python-pydes'
	)
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")

	cd "${srcdir}/${_pkgname}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}

package_python-nfcpy-examples-git() {
	pkgdesc="Python nfcpy examples."
	depends=('python-nfcpy')
        provides=("${pkgname%-git}")
        conflicts=("${pkgname%-git}")

	cd "${srcdir}/${_pkgname}"
	install -dm755 ${pkgdir}/usr/share/python-${_pkgname}/examples/
	install -Dm755 examples/* \
	  ${pkgdir}/usr/share/python-${_pkgname}/examples
}
