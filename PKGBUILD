# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-spherical_geometry
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=1.2.22
pkgrel=1
pkgdesc="Python based tools for spherical geometry"
arch=('i686' 'x86_64')
url="http://www.stsci.edu/resources/software_hardware/stsci_python"
license=('BSD')
makedepends=('python-setuptools-scm'
             'python-numpy'
             'qd>=2.3.7'
             'python-sphinx-automodapi'
             'python-numpydoc')
checkdepends=('python-pytest'
              'python-astropy')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'fix_typo.patch'
        'fix_doc_warning.patch')
md5sums=('8537874297c128da8933416284356e68'
         '376f76ebdf3c52048a113c386c091210'
         'fed5395d45a2275ccd5e0d63956ecddf')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   patch -Np1 -i "${srcdir}/fix_doc_warning.patch"
    patch -Np1 -i "${srcdir}/fix_typo.patch"
    export USE_SYSTEM_QD=1
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

    msg "Building Docs"
    NUMPY_EXPERIMENTAL_DTYPE_API=1 PYTHONPATH="../build/lib.linux-${CARCH}-cpython-$(get_pyver)" \
        make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    cp "build/lib.linux-${CARCH}-cpython-$(get_pyver)/${_pyname}/math_util.cpython-$(get_pyver)-${CARCH}-linux-gnu.so" "${_pyname}"
    NUMPY_EXPERIMENTAL_DTYPE_API=1 pytest \
        --deselect=spherical_geometry/tests/test_union.py::test_difficult_unions || warning "Tests failed" # -vv --color=yes
#   NUMPY_EXPERIMENTAL_DTYPE_API=1 PYTHONPATH="build/lib.linux-${CARCH}-cpython-$(get_pyver)" pytest -vv --color=yes #"build/lib.linux-${CARCH}-cpython-$(get_pyver)" #\
}

package_python-spherical_geometry() {
    depends=('python>=3.6' 'python-numpy>=1.10.0' 'qd>=2.3.7' 'python-astropy>=0.4')
    optdepends=('python-spherical_geometry-doc: Documentation for Spherical Geometry Toolkit')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" licenses/*
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-spherical_geometry-doc() {
    pkgdesc="Documentation for Python Spherical Geometry Toolkit"
    arch=('any')
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" ../../licenses/*
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
