# Maintainer: Ben Wolsieffer <benwolsieffer@gmail.com>

_py_pkgname=port-for
_github_url=https://github.com/kmike/port-for
pkgbase=python-${_py_pkgname}
pkgname=(python-${_py_pkgname} python2-${_py_pkgname})
pkgver=0.3.1
pkgrel=2
pkgdesc="Utility that helps with local TCP ports managment. It can find an unused TCP localhost port and remember the association."
arch=('any')
url="${_github_url}"
license=('custom')
depends=()
makedepends=('python-setuptools' 'python2-setuptools')
backup=()
source=(${_py_pkgname}::git+${_github_url}.git#tag=$pkgver)
sha256sums=('SKIP')

prepare() {
    cp -a "${srcdir}/${_py_pkgname}" "${srcdir}/python2-${_py_pkgname}"
}

build() {
    cd "${srcdir}/${_py_pkgname}"
    python setup.py build
    cd "${srcdir}/python2-${_py_pkgname}"
    python2 setup.py build
}

# Automatically create package functions using Bash magic
source /dev/stdin << EOF
package_python-${_py_pkgname}() {
    depends=('python')

    cd "\${srcdir}/${_py_pkgname}"

    python setup.py install --skip-build --root="\${pkgdir}" --optimize=1

    install -Dm644 LICENSE.txt "\${pkgdir}/usr/share/licenses/\${pkgname}/LICENSE"
}

package_python2-${_py_pkgname}() {
    depends=('python2')

    cd "\${srcdir}/python2-${_py_pkgname}"

    python2 setup.py install --skip-build --root="\${pkgdir}" --optimize=1

    install -Dm644 LICENSE.txt "\${pkgdir}/usr/share/licenses/\${pkgname}/LICENSE"
    
    # Add suffix to command
    mv "\${pkgdir}/usr/bin/${_py_pkgname}" "\${pkgdir}/usr/bin/${_py_pkgname}-python2"
}
EOF

# vim:set ts=4 sw=4 et:
