# Maintainer: Carl George < arch at cgtx dot us >

_name="gitdb"
_module="${_name}"
_check="disabled"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="0.6.4"
pkgrel="2"
pkgdesc="a pure-Python git object database"
arch=("i686" "x86_64")
url="https://github.com/gitpython-developers/${_name}"
license=("BSD")
makedepends=("python-setuptools" "python2-setuptools")
if [[ "${_check}" == "enabled" ]]; then
    checkdepends=("python-nose"
                  "python-smmap"
                  "python2-nose"
                  "python2-smmap")
fi
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('a3ebbc27be035a2e874ed904df516e35f4a29a778a764385de09de9e0f139658')

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

package_python-gitdb() {
    depends=("python-smmap>=0.8.3")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-gitdb() {
    depends=("python2-smmap>=0.8.3")
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
