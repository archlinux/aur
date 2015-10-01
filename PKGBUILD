# Maintainer: Carl George < arch at cgtx dot us >

_name="click-plugins"
_module="${_name}"
_check="enabled"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="1.0.2"
pkgrel="1"
pkgdesc="An extension module for click to enable registering CLI commands via setuptools entry-points."
arch=("any")
url="https://github.com/click-contrib/click-plugins"
license=("BSD")
makedepends=("python-setuptools" "python2-setuptools")
if [[ "${_check}" == "enabled" ]]; then
    checkdepends=("python-click>=3.0"
                  "python-pytest"
                  "python2-click>=3.0"
                  "python2-pytest")
fi
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('3e33f24dafbc8f52dd2a557f5fb1452acc7ab67ff354220a832a393bdedb46a8')

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
        export LC_ALL="en_US.UTF-8"
        cd "${srcdir}/${_name}-${pkgver}"
        py.test tests
        cd "${srcdir}/${_name}-${pkgver}-python2"
        py.test2 tests
    else
        echo "_check is not set to \"enabled\", skipping check()"
    fi
}

package_python-click-plugins() {
    depends=("python-click>=3.0")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-click-plugins() {
    depends=("python2-click>=3.0")
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
