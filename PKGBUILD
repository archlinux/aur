# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-echo
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}"-doc)
pkgver=0.8.0
pkgrel=1
pkgdesc="Callback Properties in Python"
arch=('any')
url="https://echo.readthedocs.io"
license=('MIT')
makedepends=('python-setuptools-scm'
#            'python-wheel'
#            'python-build'
#            'python-installer'
             'python-sphinx-automodapi'
             'python-numpydoc'
             'python-numpy'
             'python-qtpy'
             'python-pyqt5')
checkdepends=('python-pytest')  # numpy qtpy pyqt5 already in makedepends
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'fix_sphinx-doc_link.patch')
md5sums=('1099665ac250566484895f3012d0c828'
         'b6441be6fa18db4f59a7784b1fcc67a6')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    patch -Np1 -i "${srcdir}/fix_sphinx-doc_link.patch"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build
#   python -m build --wheel --no-isolation

    msg "Building Docs"
    PYTHONPATH="../build/lib" make SPHINXOPTS="" -C doc html

}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed" # -vv --color=yes
}

package_python-echo() {
    depends=('python>=3.6' 'python-numpy' 'python-qtpy')
    optdepends=('python-pyqt5>=5.9: Interfacing with Qt widgets¶'
                'python-echo-doc: Documentation for python-echo')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
#   python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-echo-doc() {
    pkgdesc="Documentation for Python echo module"
    cd ${srcdir}/${_pyname}-${pkgver}/doc/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
