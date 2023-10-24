# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-astrocut
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.10.0
pkgrel=1
pkgdesc="Tools for making image cutouts from sets of TESS full frame images"
arch=('any')
url="https://astrocut.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-sphinx-astropy'
             'python-sphinx_rtd_theme'
             'python-astropy'
             'python-scipy')
checkdepends=('python-pytest-doctestplus'
              'python-astroquery'
              'python-fsspec'
              'python-pillow')   # scipy already in makedepends; 'python-s3fs' test all deselected
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('5a73196f25266dc32536f9b4a22985b4')

#get_pyver() {
#    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
#}

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i "s/logo/logo_url/g" docs/_templates/layout.html
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    # Skip tests costing lots of time
    pytest \
        --deselect=astrocut/tests/test_make_cube.py::test_invalid_inputs \
        --deselect=astrocut/tests/test_cube_cut.py::test_s3_cube_cut \
        --deselect=astrocut/tests/test_cube_cut.py::test_multithreading \
        --deselect=astrocut/tests/test_cutouts.py::test_fits_cut || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
}

package_python-astrocut() {
    depends=('python>=3.8' 'python-astropy' 'python-fsspec' 'python-s3fs' 'python-scipy' 'python-pillow')
    optdepends=('python-astrocut-doc: Documentation for astrocut')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" licenses/*
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.rst
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-astrocut-doc() {
    pkgdesc="Documentation for python-astrocut"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../licenses/*
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
