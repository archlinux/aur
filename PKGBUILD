# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-romancal
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=1.0.0
pkgrel=1
pkgdesc="Library for calibration of science observations from Nancy Grace Roman Space Telescope"
arch=('any')
url="https://roman-pipeline.readthedocs.io"
license=('MIT')
makedepends=('python-setuptools-scm>=3.4'
             'python-build'
             'python-installer'
             'python-sphinx-automodapi'
             'python-sphinx_rtd_theme'
             'python-pytest-doctestplus'
             'python-jsonschema'
             'python-photutils'
             'python-roman-datamodels'
             'python-stcal'
             'python-stpipe'
             'texlive-latexextra'
             'graphviz')  # wheel required by new setuptools; latex.fmt: -latex; anyfontsize.sty: latexextra
# inputs_root: ci_watson
#checkdepends=(
#'python-pytest-doctestplus'
#             'python-pytest-xdist'
#             'python-pytest-timeout'
#              'python-ci_watson'
#               'python-pysiaf'
#               'python-romanisim'
#              )   # deepdiff <- rad;  gwcs <- roman-datamodels, jsonschema, photutils <- romanisim, stcal, stpipe already in makedepends
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
#       "${pkgver}-overview.png::https://github.com/spacetelescope/romancal/raw/refs/tags/${pkgver}/docs/roman/associations/graphics/overview.png"
#       "${pkgver}-overview_classes.png::https://github.com/spacetelescope/romancal/raw/refs/tags/${pkgver}/docs/roman/associations/graphics/overview_classes.png")
md5sums=('07cca991937e44ff40c5b491b2fd1471')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

#prepare() {
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/roman/associations/graphics
#
#    ln -rsf {${srcdir}/${pkgver}-,}overview.png
#    ln -rsf {${srcdir}/${pkgver}-,}overview_classes.png
#}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    ln -rs ${srcdir}/${_pyname}-${pkgver}/${_pyname/-/_}*egg-info \
        build/lib/${_pyname/-/_}-${pkgver}-py$(get_pyver .).egg-info
    PYTHONPATH="../build/lib" make -C docs html
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    # deselect tests that may take long time
#    PYTHONPATH="${PWD}" CRDS_PATH=".crds" CRDS_SERVER_URL=https://roman-crds.stsci.edu pytest -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 --timeout 300 \
#        --deselect=romancal/flatfield/tests/test_flatfield.py \
#        --deselect=romancal/multiband_catalog/tests/test_multiband_catalog.py \
#        --deselect=romancal/ramp_fitting/tests/test_ramp_fit_cas22.py::test_fits \
#        --deselect=romancal/photom/tests/test_photom.py::test_photom_step_interface[WFI-WFI_IMAGE] \
#        --deselect=romancal/source_catalog/tests/test_source_catalog.py::test_forced_catalog \
#        --deselect=romancal/source_catalog/tests/test_source_catalog.py::test_l3_source_catalog_keywords[20-10-5-False-False-MosaicSourceCatalogModel-expected_outputs3] \
#        --deselect=romancal/source_catalog/tests/test_source_catalog.py \
#        --deselect=romancal/source_catalog/tests/test_psf.py::test_psf_fit[0.6265404784005448--0.1546255576046831-3727.593720314938] \
#        --deselect=romancal/source_catalog/tests/test_psf.py::test_psf_fit[0.8255111545554434--0.9433606577090741-5179.474679231213] \
#        --deselect=romancal/source_catalog/tests/test_psf.py::test_psf_fit[0.21327155153435973--0.7514334470008721-7196.856730011521] \
#        --deselect=romancal/source_catalog/tests/test_psf.py::test_psf_fit[0.4589931219679968-0.34124882938726064-10000.0] \
#        --deselect=romancal/source_catalog/tests/test_psf.py::test_psf_fit[0.08724998293084574-0.2943790231485002-13894.95494373136] \
#        --deselect=romancal/source_catalog/tests/test_psf.py::test_psf_fit[0.8701448475755365-0.2307702229625077-19306.977288832495] \
#        --deselect=romancal/stpipe/tests/test_core.py::test_get_reference_file[RomanPipeline] \
#        --deselect=romancal/skycell/tests/test_skycell.py \
#        --deselect=romancal/skycell/tests/test_skycell_match.py \
#        --deselect=romancal/stpipe/tests/test_core.py \
#        --deselect=romancal/pipeline/tests/test_exposure_pipeline.py::test_elp_save_results[False] \
#        --deselect=romancal/pipeline/tests/test_exposure_pipeline.py::test_elp_save_results[True] \
#        --deselect=romancal/source_catalog/tests/test_psf.py::test_psf_fit[-0.4604265724722594-0.7263578446997732-1389.4954943731375] \
#        --deselect=romancal/source_catalog/tests/test_psf.py::test_psf_fit[-0.9180529521276106-0.08292244049818343-1930.6977288832495] \
#        --deselect=romancal/source_catalog/tests/test_psf.py::test_psf_fit[-0.9669447289429418--0.40057621892523043-2682.6957952797247] \
#        --deselect=romancal/source_catalog/tests/test_psf.py::test_psf_fit[0.6317071082430643--0.23264489147623313-26826.957952797275] \
#        --deselect=romancal/source_catalog/tests/test_psf.py::test_psf_fit[-0.9945229996597038-0.994419871578422-37275.93720314938] \
#        --deselect=romancal/source_catalog/tests/test_psf.py::test_psf_fit[0.7148085531751387-0.9616706775524602-51794.74679231213] \
#        --deselect=romancal/source_catalog/tests/test_psf.py::test_psf_fit[-0.9328288493890713-0.3710839689613894-71968.56730011514] \
# \
#        --deselect=romancal/source_catalog/tests/test_psf.py::test_add_jitter \
#        --deselect=romancal/source_catalog/tests/test_psf.py::test_azimuthally_average_via_fft \
#        --deselect=romancal/source_catalog/tests/test_psf.py::test_create_convolution_kernel \
#        --deselect=romancal/source_catalog/tests/test_psf.py::test_psf_model_type
#
##       --deselect=parfive/tests/test_downloader.py::test_ftp #|| warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
#}

package_python-romancal() {
    depends=('python>=3.11'
             'python-jsonschema>=4.8'
             'python-scipy>=1.14.1'
             'python-photutils>=3.0'
             'python-pyarrow>=16.0'
             'python-pandas>=2.2.2'
             'python-roman-datamodels>=1.0'
             'python-romanisim>=0.14'
             'python-crds>=13.0.2'
             'python-drizzle>=2.2.0'
             'python-gwcs>=1.0.1'
             'python-stcal>=1.18.0'
             'python-stpipe>=0.11.0'
             'python-spherical_geometry>=1.4.0')
    optdepends=('python-romancal-doc: Documentation for romancal')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-romancal-doc() {
    pkgdesc="Documentation for Python RomanCal"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
