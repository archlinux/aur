# Maintainer: Ben Wolsieffer <benwolsieffer@gmail.com>
_py_pkgname=sphinx-autobuild
pkgbase=python-${_py_pkgname}
pkgname=(python-${_py_pkgname} python2-${_py_pkgname})
pkgver=0.7.1
pkgrel=4
pkgdesc="Watch a Sphinx directory and rebuild the documentation when a change is detected. Also includes a livereload enabled web server."
arch=('any')
url="https://github.com/GaretJax/sphinx-autobuild"
license=('MIT')
checkdepends=(
    'python-port-for'
    'python-livereload'
    'python-watchdog'
    'python-pytest'
    'python-mock'
    'python2-port-for'
    'python2-livereload'
    'python2-watchdog'
    'python2-pytest'
    'python2-mock'
)
source=(
    "https://files.pythonhosted.org/packages/source/${_py_pkgname::1}/${_py_pkgname}/${_py_pkgname}-${pkgver}.tar.gz"
    "dependency-updates.patch::https://github.com/GaretJax/sphinx-autobuild/commit/08c4198a971d40abd6293bb54b3336f081b2bb6e.patch"
)
sha256sums=('66388f81884666e3821edbe05dd53a0cfb68093873d17320d0610de8db28c74e'
            '896ef9038482a183bee7ae2a45315fae77edc81a70c3c196498edff1b4c8fc4b')

prepare() {
    cd "${srcdir}/${_py_pkgname}-${pkgver}"
    
    patch -p1 < ../dependency-updates.patch
}

build() {
    cd "${srcdir}/${_py_pkgname}-${pkgver}"
    python setup.py build
    python2 setup.py build
}

check() {
    cd "${srcdir}/${_py_pkgname}-${pkgver}"
    
    py.test
    py.test2
}

# Automatically create package functions using Bash magic
source /dev/stdin << EOF
package_python-${_py_pkgname}() {
    depends=(
        'python-sphinx'
        'python-watchdog'
        'python-argh'
        'python-pathtools'
        'python-yaml'
        'python-tornado'
        'python-port-for'
        'python-livereload'
    )

    cd "\${srcdir}/${_py_pkgname}-${pkgver}"

    python setup.py install --skip-build --root="\${pkgdir}" --optimize=1

    install -Dm644 LICENSE "\${pkgdir}/usr/share/licenses/\${pkgname}/LICENSE"
}

package_python2-${_py_pkgname}() {
    depends=(
        'python2-sphinx'
        'python2-watchdog'
        'python2-argh'
        'python2-pathtools'
        'python2-yaml'
        'python2-tornado'
        'python2-port-for'
        'python2-livereload'
    )

    cd "\${srcdir}/${_py_pkgname}-${pkgver}"

    python2 setup.py install --skip-build --root="\${pkgdir}" --optimize=1

    install -Dm644 LICENSE "\${pkgdir}/usr/share/licenses/\${pkgname}/LICENSE"

    mv "\${pkgdir}/usr/bin/sphinx-autobuild" "\${pkgdir}/usr/bin/sphinx-autobuild2"
}
EOF

# vim:set ts=4 sw=4 et:
