# Maintainer: David Scholl <djscholl at gmail dot com>
_module="tablib"
pkgname=("python-${_module}" "python2-${_module}")
pkgver="0.11.3"
pkgrel="1"
pkgdesc="Format-agnostic tabular data library (XLS, JSON, YAML, CSV)"
arch=("any")
url="http://python-tablib.org"
license=("MIT")
makedepends=("python-setuptools" "python2-setuptools")
checkdepends=("python-pytest" "python2-pytest")
source=("https://pypi.python.org/packages/12/93/2bdd501dad13f253cfc8bd066ff18313e4741c1c11d336dd9bbd78aa7845/${_module}-${pkgver}.tar.gz"
       'remove-locale-from-str-regex.patch')
sha256sums=('6369662b116a7ed7a13545ebac266c063f170ff9215e918ba01a1ef20a864c9a'
            '18ba282dbdc710edfda125ba80ca97a46bf9eb7e6183dc11eb1a47825f3b12ae')

prepare() {
    cd "${srcdir}/${_module}-${pkgver}"
    patch -p1 < ${srcdir}/remove-locale-from-str-regex.patch
    cp -a "${srcdir}/${_module}-${pkgver}"{,-python2}
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py build
}

check() {
    cd "${srcdir}/${_module}-${pkgver}"
    PYTHONPATH="$PWD/build/lib:$PYTHONPATH" py.test
    cd "${srcdir}/${_module}-${pkgver}-python2"
    PYTHONPATH="$PWD/build/lib:$PYTHONPATH" py.test2
}

package_python-tablib() {
    depends=("python")
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D -m644 "${srcdir}/${_module}-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-tablib() {
    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D -m644 "${srcdir}/${_module}-${pkgver}-python2/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
