# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-romancal
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.21.0
pkgrel=1
pkgdesc="Library for calibration of science observations from Nancy Grace Roman Space Telescope"
arch=('any')
url="https://roman-pipeline.readthedocs.io"
license=('MIT')
makedepends=('python-setuptools-scm>=3.4'
             'python-build'
             'python-installer'
             'python-sphinx-automodapi'
             'python-stsci_rtd_theme'
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
#              'python-pytest-doctestplus'
#             'python-pytest-xdist'
#             'python-pytest-timeout'
#              'python-ci_watson'
#               'python-deepdiff'
#               'python-pysiaf'
#               'python-romanisim'
#              )   # gwcs <- roman-datamodels, jsonschema, photutils <- romanisim, stcal, stpipe already in makedepends
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
#       "${pkgver}-overview.png::https://github.com/spacetelescope/romancal/raw/refs/tags/${pkgver}/docs/roman/associations/graphics/overview.png"
#       "${pkgver}-overview_classes.png::https://github.com/spacetelescope/romancal/raw/refs/tags/${pkgver}/docs/roman/associations/graphics/overview_classes.png")
md5sums=('c068665580ddfeb9eb06f143ca4d99ef')

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
#    CRDS_PATH=".crds" CRDS_SERVER_URL=https://roman-crds.stsci.edu pytest -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 --timeout 300 \
#        --deselect=romancal/flatfield/tests/test_flatfield.py \
#        --deselect=romancal/multiband_catalog/tests/test_multiband_catalog.py \
#        --deselect=romancal/ramp_fitting/tests/test_ramp_fit_cas22.py::test_fits \
#        --deselect=romancal/photom/tests/test_photom.py::test_photom_step_interface[WFI-WFI_IMAGE] \
#        --deselect=romancal/source_catalog/tests/test_source_catalog.py::test_forced_catalog \
#        --deselect=romancal/source_catalog/tests/test_source_catalog.py::test_l3_source_catalog_keywords[20-10-5-False-False-MosaicSourceCatalogModel-expected_outputs3] \
#        --deselect=romancal/source_catalog/tests/test_source_catalog.py \
#        --deselect=romancal/stpipe/tests/test_core.py::test_get_reference_file[RomanPipeline] \
#        --deselect=romancal/skycell/tests/test_skycell.py \
#        --deselect=romancal/skycell/tests/test_skycell_match.py \
#        --deselect=romancal/stpipe/tests/test_core.py \
#        --deselect=romancal/pipeline/tests/test_exposure_pipeline.py::test_elp_save_results[False] \
#        --deselect=romancal/pipeline/tests/test_exposure_pipeline.py::test_elp_save_results[True]
##       --deselect=parfive/tests/test_downloader.py::test_ftp #|| warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
#}

package_python-romancal() {
    depends=('python>=3.11'
             'python-jsonschema>=4.8'
             'python-scipy>=1.14.1'
             'python-photutils>=2.3.0'
             'python-pyarrow>=10.0.1'
             'python-pandas>=2.0.0'
             'python-roman-datamodels>=0.28.0'
             'python-romanisim>=0.11.1'
             'python-crds>=13.0.2'
             'python-drizzle>=2.1.1'
             'python-gwcs>=0.25.2'
             'python-stcal>=1.15.1'
             'python-stpipe>=0.11.0'
             'python-spherical_geometry>=1.3.3'
             'python-stsci.imagestats>=1.8.3')
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
