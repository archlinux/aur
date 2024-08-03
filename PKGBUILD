# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-astrocut
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.11.1
pkgrel=1
pkgdesc="Tools for making image cutouts from sets of TESS full frame images"
arch=('any')
url="https://astrocut.readthedocs.io"
license=('BSD-3-Clause')
makedepends=('python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-sphinx-astropy'
             'python-sphinx_rtd_theme'
             'python-matplotlib'
             'python-gwcs'
             'python-scipy'
             'python-s3fs'
             'python-s3path')
checkdepends=('python-pytest-doctestplus'
#             'python-pytest-xdist'
              'python-astroquery'
              'python-pillow')   # gwcs, scipy, s3fs, s3path already in makedepends
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('d630d9791c3f1bd4a329538c9c13be67')

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
        --deselect=astrocut/tests/test_cube_cut.py::test_s3_tica_cube_cut \
        --deselect=astrocut/tests/test_cutouts.py::test_fits_cut || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4
}

package_python-astrocut() {
    depends=('python>=3.9' 'python-asdf>=2.15.0' 'python-astropy' 'python-fsspec' 'python-s3fs' 'python-scipy' 'python-pillow' 'python-roman-datamodels>=0.17.0' 'python-s3path>=0.5.7')
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
