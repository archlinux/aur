# Maintainer: Niklas <dev@n1klas.net>

pkgbase=python-adb
pkgname=(python-adb python2-adb)
_name=adb
pkgver=1.2.0
pkgrel=2
pkgdesc="A pure Python implementation of the Android ADB and Fastboot protocols"
arch=('any')
url="https://github.com/google/python-adb"
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('2bb02adbd43602471a48f8de92fd660835b9f0dfc41df30ebdbf6408f410ff56fc7e073b0e636ac1f1ed44aa98719e10ed64f646f5e5477d321a676c7f2f1708')

prepare() {
    cd "${srcdir}"
	cp -a ${_name}-${pkgver}{,-python2}
    find "${_name}-${pkgver}-python2" -name \*.py -exec sed -r 's|^#!(.*)python$|#!\1python2|' -i {} +
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build

    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py build
}

package_python-adb() {
    depends=('python-libusb1' 'python-rsa')
    optdepends=('python-progressbar: progressbar for Fastboot')

    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build  --root="${pkgdir}" --optimize=1
}

package_python2-adb() {
    depends=('python2-libusb1' 'python2-m2crypto')
    optdepends=('python2-progressbar: progressbar for Fastboot')

    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py install --skip-build  --root="${pkgdir}" --optimize=1
}
