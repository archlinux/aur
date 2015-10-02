# Maintainer: Carl George < arch at cgtx dot us >

_name="click"
_module="${_name}"
_check="enabled"

# Arch normally builds packages with LANG="C".  This causes Python to think
# that it is limited to ASCII data (it isn't) and breaks the test suite.  We
# must export a locale that is unicode aware.  If you have not built
# en_US.UTF-8 on your system, change this variable to locale that you have
# built that is unicode aware.  See http://click.pocoo.org/5/python3/ for more
# details.
_locale="en_US.UTF-8"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="5.1"
pkgrel="4"
pkgdesc="A simple wrapper around optparse for powerful command line utilities."
arch=("any")
url="http://click.pocoo.org/"
license=("BSD")
makedepends=("python-setuptools" "python2-setuptools")
checkdepends=("python-pytest" "python2-pytest")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('678c98275431fad324275dec63791e4a17558b40e5a110e20a82866139a85a5a')

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
        export LANG="${_locale}"
        export PYTHONPATH="$(pwd)/build/lib:$PYTHONPATH"
        cd "${srcdir}/${_name}-${pkgver}"
        py.test --tb=short
        cd "${srcdir}/${_name}-${pkgver}-python2"
        py.test2 --tb=short
    else
        echo "_check is not set to \"enabled\", skipping check()"
    fi
}

package_python-click() {
    depends=("python>=3.3")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-click() {
    depends=("python2>=2.6")
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
