# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-echo
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}"-doc)
pkgver=0.11.1
pkgrel=1
pkgdesc="Callback Properties in Python"
arch=('any')
url="https://echo.readthedocs.io"
license=('MIT')
makedepends=('python-setuptools-scm'
             'python-build'
             'python-installer'
             'python-sphinx-automodapi'
             'python-numpydoc'
             'python-numpy')
checkdepends=('python-pytest-xvfb'
#             'python-pytest-xdist'
              'xorg-server-xvfb'
              'python-qtpy'
              'python-pyqt6')  # numpy already in makedepends
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'fix_sphinx-doc_link.patch')
md5sums=('3bfc9611a1376d2b8c821a796149d0cd'
         'b6441be6fa18db4f59a7784b1fcc67a6')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    patch -Np1 -i "${srcdir}/fix_sphinx-doc_link.patch"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    ln -rs ${srcdir}/${_pyname}-${pkgver}/${_pyname/-/_}*egg-info \
        build/lib/${_pyname/-/_}-${pkgver}-py$(get_pyver .).egg-info
    PYTHONPATH="../build/lib" make SPHINXOPTS="" -C doc html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 # no need -p xvfb
}

package_python-echo() {
    depends=('python>=3.10' 'python-numpy')
    optdepends=('python-pyqt5>=5.14: Interfacing with Qt widgets¶'
                'python-qtpy: Interfacing with Qt widgets¶'
                'python-echo-doc: Documentation for python-echo')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-echo-doc() {
    pkgdesc="Documentation for Python echo module"
    cd ${srcdir}/${_pyname}-${pkgver}/doc/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
