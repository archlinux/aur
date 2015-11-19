# Maintainer: Carl George < arch at cgtx dot us >

_name="ddt"
_module="${_name}"
_check="enabled"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="1.0.1"
pkgrel="1"
pkgdesc="Data-Driven/Decorated Tests"
arch=("any")
url="https://github.com/txels/ddt"
license=("MIT")
makedepends=("python-setuptools" "python2-setuptools")
checkdepends=("python-coverage" "python-nose" "python-six"
              "python2-coverage" "python2-nose" "python2-six")
# Once https://github.com/txels/ddt/issues/32 is resolved, switch back to the pypi tarball.
#source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz"
#        "https://raw.githubusercontent.com/txels/ddt/master/LICENSE.md")
source=("https://github.com/txels/${_name}/archive/${pkgver}.tar.gz")
sha256sums=('1f768e2a63f2221af4bbbdcf2e3a2602f096f15f29e9480ff9f3c23bbe919d37')

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

package_python-ddt() {
    depends=("python")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm0644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-ddt() {
    depends=("python2")
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm0644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
