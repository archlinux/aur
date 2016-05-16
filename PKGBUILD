# Maintainer: Carl George < arch at cgtx dot us >

_name="falcon"
_module="${_name}"
_cmd="falcon-bench"
_check="disabled"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="1.0.0"
pkgrel="1"
pkgdesc="An unladen web framework for building APIs and app backends."
arch=("i686" "x86_64")
url="https://github.com/falconry/${_name}"
license=("Apache")
makedepends=("cython"
             "python-setuptools"
             "cython2"
             "python2-setuptools")
if [[ "${_check}" == "enabled" ]]; then
    checkdepends=("python-coverage"
                  "python-ddt"
                  "python-nose"
                  "python-requests"
                  "python-six"
                  "python-testtools"
                  "python-yaml"
                  "python2-coverage"
                  "python2-ddt"
                  "python2-nose"
                  "python2-requests"
                  "python2-six"
                  "python2-testtools"
                  "python2-yaml")
fi
source=("https://pypi.io/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('ddce23a2dd0abba6d19775e9bf7ba64e184b15a0e7163e65f62af63354193f63')

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

package_python-falcon() {
    depends=("python-six>=1.4.0"
             "python-mimeparse")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}

package_python2-falcon() {
    depends=("python2-six>=1.4.0"
             "python2-mimeparse")
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
    mv "${pkgdir}/usr/bin/${_cmd}" "${pkgdir}/usr/bin/${_cmd}-python2"
}
