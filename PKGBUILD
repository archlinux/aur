# Maintainer: Carl George < arch at cgtx dot us >

_name="ddt"
_module="${_name}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="1.0.0"
pkgrel="2"
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
sha256sums=("cc8fcfd3097ddd4818d9f0ff23daa4325c5d71d02436c808a3bedc451ea9afdf")

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
    cd "${srcdir}/${_name}-${pkgver}"
    nosetests -s --with-coverage --cover-package=ddt --cover-html
    cd "${srcdir}/${_name}-${pkgver}-python2"
    nosetests2 -s --with-coverage --cover-package=ddt --cover-html
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
