# Maintainer: Carl George < arch at cgtx dot us >

_name="smmap"
_module="${_name}"
_check="enabled"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="0.9.0"
pkgrel="3"
pkgdesc="A pure git implementation of a sliding window memory map manager"
arch=("any")
url="https://github.com/gitpython-developers/${_name}"
license=("BSD")
makedepends=("python-setuptools" "python2-setuptools")
if [[ "${_check}" == "enabled" ]]; then
    checkdepends=("python-nose" "python2-nose")
fi
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/gitpython-developers/${_name}/v${pkgver}/LICENSE")
sha256sums=('0e2b62b497bd5f0afebc002eda4d90df9d209c30ef257e8673c90a6b5c119d62'
            '88e9d93f708d110b328a834302dd1d5c6afbda530e7721d15d80b3511d86f235')

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

package_python-smmap() {
    depends=("python")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-smmap() {
    depends=("python2")
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
