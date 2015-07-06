# Maintainer: David Scholl <djscholl at gmail dot com>
_module="tablib"
pkgname=("python-${_module}" "python2-${_module}")
pkgver="0.10.0"
pkgrel="2"
pkgdesc="Format-agnostic tabular data library (XLS, JSON, YAML, CSV)"
arch=("any")
url="http://python-tablib.org"
license=("MIT")
makedepends=("python-setuptools" "python2-setuptools")
checkdepends=("python-pytest" "python2-pytest")
source=("https://pypi.python.org/packages/source/${_module:0:1}/${_module}/${_module}-${pkgver}.tar.gz")
sha256sums=('41c2dad7f491f5557e22783a9af81bed62f7b6fb0d7afd4c2ee301f3eb428c93')

prepare() {
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
    depends=("python2")
    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D -m644 "${srcdir}/${_module}-${pkgver}-python2/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
