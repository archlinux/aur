# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-romanisim
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.11.1
pkgrel=1
pkgdesc="Nancy Grace Roman Space Telescope WFI Simulator"
arch=('i686' 'x86_64')
url="https://romanisim.readthedocs.io"
license=('BSD-3-Clause')
makedepends=('python-setuptools-scm>=3.4'
             'cython>=0.29.21'
             'python-build'
             'python-installer'
             'python-numpy>=2.0.0'
             'python-sphinx-automodapi'
             'python-sphinx_rtd_theme'
             'python-numpydoc'
             'python-astropy-healpix'
             'python-astroquery'
             'python-galsim'
             'python-photutils'
             'python-roman-datamodels'
             'graphviz')  # wheel required by new setuptools; latex.fmt: -latex; anyfontsize.sty: latexextra
# takes long time and needs big data
#checkdepends=('python-pytest-doctestplus'
#             'python-pytest-xdist'
#             'python-pytest-timeout'
#              'python-defusedxml'
#              'python-crds'
#              'python-stpsf'
#              )   # galsim, roman-datamodels, scipy <- photutils, astropy-healpix, astroquery
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
#       "https://stsci.box.com/shared/static/kqfolg2bfzqc4mjkgmujo06d3iaymahv.gz"
#   )
md5sums=('0d3036cb2fb14d546c1764e2fe5c3c61')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    ln -rs ${srcdir}/${_pyname}-${pkgver}/${_pyname/-/_}*egg-info \
        build/lib.linux-${CARCH}-cpython-$(get_pyver)/${_pyname/-/_}-${pkgver}-py$(get_pyver .).egg-info
    PYTHONPATH="../build/lib.linux-${CARCH}-cpython-$(get_pyver)" make -C docs html
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    # deselect tests that may take long time
#    mkdir .crds
#    STPSF_PATH=${srcdir}/stpsf-data CRDS_PATH="${srcdir}/${_pyname}-${pkgver}/.crds" CRDS_SERVER_URL=https://roman-crds.stsci.edu pytest -vv -l -ra --color=yes -o console_output_style=count "build/lib.linux-${CARCH}-cpython-$(get_pyver)" -p xdist -n 4 --timeout 300 \
#        --deselect=build/lib.linux-${CARCH}-cpython-$(get_pyver)/romanisim/tests/test_catalog.py::test_make_gaia_stars \
#        --deselect=build/lib.linux-${CARCH}-cpython-$(get_pyver)/romanisim/tests/test_image.py::test_image_rendering \
#        --deselect=build/lib.linux-${CARCH}-cpython-$(get_pyver)/romanisim/tests/test_image.py::test_reference_file_crds_match[1] \
#        --deselect=build/lib.linux-${CARCH}-cpython-$(get_pyver)/romanisim/tests/test_image.py::test_psftypes_location[epsf] \
#        --deselect=build/lib.linux-${CARCH}-cpython-$(get_pyver)/romanisim/tests/test_linear.py::test_inverse_then_linearity \
#        --deselect=build/lib.linux-${CARCH}-cpython-$(get_pyver)/romanisim/tests/test_image.py::test_simulate_counts_generic \
#        --deselect=build/lib.linux-${CARCH}-cpython-$(get_pyver)/romanisim/tests/test_image.py::test_inject_source_into_image \
#        --deselect=build/lib.linux-${CARCH}-cpython-$(get_pyver)/romanisim/tests/test_image.py::test_add_objects  \
#        --deselect=build/lib.linux-${CARCH}-cpython-$(get_pyver)/romanisim/tests/test_l3.py::test_simulate_cps \
#        --deselect=build/lib.linux-${CARCH}-cpython-$(get_pyver)/romanisim/tests/test_image.py::test_reference_file_crds_match[2] \
#        --deselect=build/lib.linux-${CARCH}-cpython-$(get_pyver)/romanisim/tests/test_image.py::test_simulate_counts \
#        --deselect=build/lib.linux-${CARCH}-cpython-$(get_pyver)/romanisim/tests/test_image.py::test_psftypes_similar[epsf] \
#        --deselect=build/lib.linux-${CARCH}-cpython-$(get_pyver)/romanisim/tests/test_image.py::test_simulate \
#        --deselect=build/lib.linux-${CARCH}-cpython-$(get_pyver)/romanisim/tests/test_l3.py::test_exptime_array \
#        --deselect=build/lib.linux-${CARCH}-cpython-$(get_pyver)/romanisim/tests/test_l3.py::test_simulate_vs_cps
#
#
##        --deselect=romancal/stpipe/tests/test_core.py
##        || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
#}

package_python-romanisim() {
    depends=('python>=3.11'
             'python-asdf>=4.1.0'
             'python-astropy-healpix>=1.1.2'
             'python-astroquery'
             'python-crds>=13.0.2'
             'python-defusedxml>=0.5.0'
             'python-galsim>=2.5.1'
             'python-roman-datamodels>=0.28.0'
             'python-gwcs>=0.25.0'
             'python-photutils>=2.3.0'
             'cython>=0.29.21')
    optdepends=('python-romanisiml-doc: Documentation for romanisim')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-romanisim-doc() {
    pkgdesc="Documentation for Python Romanisim"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
