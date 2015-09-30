# Maintainer: Carl George < arch at cgtx dot us >

_name="GitPython"
_module="git"
_check="disabled"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="1.0.1"
pkgrel="3"
pkgdesc="Python Git Library"
arch=("any")
url="https://github.com/gitpython-developers/${_name}"
license=("BSD")
makedepends=("python-setuptools" "python2-setuptools")
if [[ "${_check}" == "enabled" ]]; then
    checkdepends=("python-mock"
                  "python-nose"
                  "python-gitdb"
                  "python2-mock"
                  "python2-nose"
                  "python2-gitdb")
fi
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('9c88c17bbcae2a445ff64024ef13526224f70e35e38c33416be5ceb56ca7f760')

prepare() {
    cp -a "${srcdir}/${_name}-${pkgver}" "${srcdir}/${_name}-${pkgver}-python2"
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py build
}

check() {
    if [[ "${_check}" == "enabled" ]]; then
        cd "${srcdir}/${_name}-${pkgver}"
        nosetests
        cd "${srcdir}/${_name}-${pkgver}-python2"
        nosetests2
    else
        echo "_check is not set to \"enabled\", skipping check()"
    fi
}

package_python-git() {
    depends=("git>=1.7" "python-gitdb>=0.6.4")
    provides=("python-gitpython=${pkgver}-${pkgrel}")
    conflicts=("python-gitpython")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-git() {
    depends=("git>=1.7" "python2-gitdb>=0.6.4")
    provides=("python2-gitpython=${pkgver}-${pkgrel}")
    conflicts=("python2-gitpython")
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
