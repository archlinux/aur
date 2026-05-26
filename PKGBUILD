# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-romanisim
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.14.0
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
##           'python-astroquery'
             'python-crds'
             'python-galsim'
             'python-photutils'
             'python-roman-datamodels'
             'graphviz')  # wheel required by new setuptools; scipy <- photutils; gwcs <- roman
# takes long time and needs big data
# @pytest.mark.bigdata: ci_watson
#checkdepends=(
#'python-pytest-doctestplus'
#'python-ci_watson'
#             'python-pytest-xdist'
#             'python-pytest-timeout'
#              'python-defusedxml'
#              'python-stpsf'
#              )   # galsim, roman-datamodels, crds, scipy <- photutils, astropy-healpix, astroquery
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
       "https://stsci.box.com/shared/static/kqfolg2bfzqc4mjkgmujo06d3iaymahv.gz"
   )
md5sums=('3ed1df89433abcf1f5248c545d0bb9e3'
         'b5cc6fe3fe5c7ae4dfe413691338a05a')

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
##   mkdir .crds
##   STPSF_PATH=${srcdir}/stpsf-data CRDS_PATH="${srcdir}/${_pyname}-${pkgver}/.crds" CRDS_SERVER_URL=https://roman-crds.stsci.edu pytest -vv -l -ra --color=yes -o console_output_style=count "build/lib.linux-${CARCH}-cpython-$(get_pyver)" -p xdist -n 4 --timeout 300 \
#    STPSF_PATH=${srcdir}/stpsf-data pytest -vv -l -ra --color=yes -o console_output_style=count "build/lib.linux-${CARCH}-cpython-$(get_pyver)" -p xdist -n 4 --timeout 300 \
#        --deselect=build/lib.linux-${CARCH}-cpython-$(get_pyver)/romanisim/tests/test_l3.py::test_scaling \
#        --deselect=build/lib.linux-${CARCH}-cpython-$(get_pyver)/romanisim/tests/test_psf.py::test_make_psf[args8-kwargs8-None] \
#        --deselect=build/lib.linux-${CARCH}-cpython-$(get_pyver)/romanisim/tests/test_psf.py::test_make_psf[args2-kwargs2-None] \
#        --deselect=build/lib.linux-${CARCH}-cpython-$(get_pyver)/romanisim/tests/test_psf.py::test_make_psf[args11-kwargs11-None] \
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
#        --deselect=build/lib.linux-${CARCH}-cpython-$(get_pyver)/romanisim/tests/test_image.py::test_fast_epsf \
#        --deselect=build/lib.linux-${CARCH}-cpython-$(get_pyver)/romanisim/tests/test_psf.py::test_make_psf[args12-kwargs12-position12] \
#        --deselect=build/lib.linux-${CARCH}-cpython-$(get_pyver)/romanisim/tests/test_l3.py::test_exptime_array \
#        --deselect=build/lib.linux-${CARCH}-cpython-$(get_pyver)/romanisim/tests/test_l3.py::test_simulate_vs_cps \
#        --deselect=build/lib.linux-${CARCH}-cpython-$(get_pyver)/romanisim/tests/test_wcs.py::test_wcs_crds_match
#
#
##        --deselect=romancal/stpipe/tests/test_core.py
##        || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
#}

package_python-romanisim() {
    depends=('python>=3.11'
             'python-asdf>=4.1.0'
             'python-astropy-healpix>=1.1.2'
             'python-astroquery>=0.4.11'
             'python-crds>=13.0.2'
             'python-defusedxml>=0.5.0'
             'python-galsim>=2.5.1'
             'python-roman-datamodels>=0.29.0'
             'python-gwcs>=0.25.0'
             'python-photutils>=2.3.0')
    optdepends=('python-romanisiml-doc: Documentation for romanisim')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-romanisim-doc() {
    pkgdesc="Documentation for Python Romanisim"
    arch=('any')
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
