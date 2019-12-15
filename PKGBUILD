# Maintainer: Ben Wolsieffer <benwolsieffer@gmail.com>

_py_pkgname=pynmea2
_github_url=https://github.com/Knio/pynmea2
pkgbase=python-${_py_pkgname}
pkgname=(python-${_py_pkgname} python2-${_py_pkgname})
pkgver=1.15.0
pkgrel=1
pkgdesc="Python library for parsing the NMEA 0183 protocol (GPS)"
arch=('any')
url="${_github_url}"
license=(MIT)
depends=()
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest' 'python2-pytest')
options=()
source=(${_py_pkgname}::git+${_github_url}.git#tag=$pkgver)
sha256sums=('SKIP')

prepare() {
    cp -af "${srcdir}/${_py_pkgname}" "${srcdir}/python2-${_py_pkgname}"
}

build() {
    cd "${srcdir}/${_py_pkgname}"
    python setup.py build
    cd "${srcdir}/python2-${_py_pkgname}"
    python2 setup.py build
}

check() {
    cd "${srcdir}/${_py_pkgname}"
    PYTHONPATH="$(pwd)" py.test
    
    cd "${srcdir}/python2-${_py_pkgname}"
    PYTHONPATH="$(pwd)" py.test2
}

# Automatically create package functions using Bash magic
source /dev/stdin << EOF
package_python-${_py_pkgname}() {
    depends=('python')
    optdepends=()

    cd "\${srcdir}/${_py_pkgname}"

    python setup.py install --skip-build --root="\${pkgdir}" --optimize=1

    install -Dm644 LICENSE "\${pkgdir}/usr/share/licenses/\${pkgname}/LICENSE"
}

package_python2-${_py_pkgname}() {
    depends=('python2')
    optdepends=()

    cd "\${srcdir}/python2-${_py_pkgname}"

    python2 setup.py install --skip-build --root="\${pkgdir}" --optimize=1

    install -Dm644 LICENSE "\${pkgdir}/usr/share/licenses/\${pkgname}/LICENSE"
}
EOF

# vim:set ts=4 sw=4 et:
