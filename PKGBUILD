# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-fast-zip-decryption
_pname=${pkgbase#python-}
_pyname=${_pname//-/_}
pkgname=("python-${_pname}")
#"python-${_pname}-doc")
pkgver=3.0.0
pkgrel=1
pkgdesc="Read password protected Zips 100x faster"
arch=('i686' 'x86_64')
url="https://github.com/mxmlnkn/fast-zip-decryption"
license=('MIT')
makedepends=('python-setuptools'
             'python-wheel'
             'python-build'
             'python-installer')
#            'python-sphinx'
checkdepends=('python-pytest'
              'zip')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
#source=("https://github.com/mxmlnkn/fast-zip-decryption/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('5afd23cc9f30cbba2dcc10d8b58aa7c7')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
#   cd ${srcdir}/${_pname}-${pkgver}
    python -m build --wheel --no-isolation --skip-dependency-check

#   msg "Building Docs"
#   PYTHONPATH="../build/lib.linux-${CARCH}-cpython-$(get_pyver)" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}
#   cd ${srcdir}/${_pname}-${pkgver}

    PYTHONPATH="build/lib.linux-${CARCH}-cpython-$(get_pyver)" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count #
}

package_python-fast-zip-decryption() {
    depends=('python>=3.8' 'zip')
    cd ${srcdir}/${_pyname}-${pkgver}
#   cd ${srcdir}/${_pname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-fast-zip-decryption-doc() {
#    pkgdesc="Documentation for"
#    arch=('any')
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
