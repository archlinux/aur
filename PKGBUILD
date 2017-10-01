# Maintainer: Ben Wolsieffer <benwolsieffer@gmail.com>
_py_pkgname=port-for
_github_url=https://github.com/kmike/port-for
pkgbase=python-${_py_pkgname}
pkgname=(python-${_py_pkgname} python2-${_py_pkgname})
pkgver=0.4
pkgrel=1
pkgdesc="Utility that helps with local TCP ports managment. It can find an unused TCP localhost port and remember the association."
arch=('any')
url="${_github_url}"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-tox' 'python2-tox')
source=(${_py_pkgname}::git+${_github_url}.git#tag=$pkgver)
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${_py_pkgname}"
    python setup.py build
    python2 setup.py build
}

check() {
    cd "${srcdir}/${_py_pkgname}"
    tox -e py2
    tox -e py3
}

# Automatically create package functions using Bash magic
source /dev/stdin << EOF
package_python-${_py_pkgname}() {
    depends=('python')
    optdepends=()

    cd "\${srcdir}/${_py_pkgname}"

    python setup.py install --skip-build --root="\${pkgdir}" --optimize=1

    install -Dm644 LICENSE.txt "\${pkgdir}/usr/share/licenses/\${pkgname}/LICENSE"
}

package_python2-${_py_pkgname}() {
    depends=('python2')
    optdepends=()

    cd "\${srcdir}/${_py_pkgname}"

    python2 setup.py install --skip-build --root="\${pkgdir}" --optimize=1

    install -Dm644 LICENSE.txt "\${pkgdir}/usr/share/licenses/\${pkgname}/LICENSE"
    
    mv "\${pkgdir}/usr/bin/port-for" "\${pkgdir}/usr/bin/port-for2"
}
EOF

# vim:set ts=4 sw=4 et:
