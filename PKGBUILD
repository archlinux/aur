# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-jwst
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=1.16.0
pkgrel=1
pkgdesc="Library for calibration of science observations from the James Webb Space Telescope"
arch=('i686' 'x86_64')
url="https://jwst-pipeline.readthedocs.io"
license=('BSD-3-Clause')
makedepends=('python-setuptools-scm>=3.4'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-numpy>=2.0'
             'python-sphinx-automodapi'
             'python-sphinx_rtd_theme'
             'python-psutil'
             'python-pytest-doctestplus'
             'python-bayesicfitting'
             'python-drizzle'
             'python-jsonschema'
             'python-photutils'
             'python-poppy'
             'python-spherical_geometry'
             'python-scikit-image'
             'python-stcal'
             'python-stdatamodels'
             'python-stpipe'
             'python-synphot'
             'python-tweakwcs'
             'python-wiimatch'
             'graphviz'
             'texlive-latexextra')  # latex.fmt: -latex; anyfontsize.sty: latexextra
#checkdepends=('python-pytest-doctestplus'
#              'python-pytest-xdist'
#              'python-ci_watson'
#              'python-pysiaf'
#              'python-requests-mock'
#              'rsync'
#              ) # psutil, bayesicfitting, drizzle, jsonschema, photutil, poppy, skimage, stcal, stdatamodel, stpipe, synphot, tweakwcs, wiimatch already in makedepends
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('0e76a1a3a354a054dc43800f62bd1205')

get_pyinfo() {
    [[ $1 == "site" ]] && python -c "import site; print(site.getsitepackages()[0])" || \
        python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation --skip-dependency-check

    msg "Building Docs"
    ln -rs ${srcdir}/${_pyname}-${pkgver}/${_pyname/-/_}*egg-info \
        build/lib.linux-${CARCH}-cpython-$(get_pyinfo)/${_pyname/-/_}-${pkgver}-py$(get_pyinfo .).egg-info
    PYTHONPATH="../build/lib.linux-${CARCH}-cpython-$(get_pyinfo)" make -C docs html
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    # Takes long time
#    mkdir -p .crds/config/jwst
#    touch .crds/config/jwst/server_config
##    python -m installer --destdir=tmp_install dist/*.whl
##    rm -r tmp_install/usr/lib pytest_crds
#    for sos in $(find build -name '*.so' | sed "s:build/lib.linux-${CARCH}-cpython-$(get_pyinfo)/::g"); do
#        cp -v {build/lib.linux-${CARCH}-cpython-$(get_pyinfo)/,}$sos
#    done
#    CRDS_PATH=".crds" CRDS_SERVER_URL=https://jwst-crds.stsci.edu CRDS_CONTEXT=jwst_1281.pmap PATH="${PWD}/tmp_install/usr/bin:${PATH}" \
#        PYTHONPATH="build/lib.linux-${CARCH}-cpython-$(get_pyinfo)" pytest -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 \
#        --ignore=jwst/refpix/tests/test_refpix.py \
#        --ignore=jwst/resample/tests/test_resample_step.py \
#        --ignore=jwst/assign_wcs/tests/test_miri.py \
#        --ignore=jwst/assign_wcs/tests/test_nircam.py \
#        --ignore=jwst/assign_wcs/tests/test_niriss.py \
#        --ignore=jwst/assign_wcs/tests/test_nirspec.py \
#        --ignore=jwst/extract_1d/tests/test_expected_skips.py \
#        --ignore=jwst/regtest \
#        --deselect=jwst/ami/tests/test_ami_interface.py::test_ami_analyze_even_oversample_fail \
#        --deselect=jwst/ami/tests/test_ami_interface.py::test_ami_analyze_step \
#        --deselect=jwst/assign_wcs/tests/test_wcs.py::test_sip_approx \
#        --deselect=jwst/flatfield/tests/test_flatfield.py::test_nirspec_flatfield_step_interface \
#        --deselect=jwst/cube_build/tests/test_cube_build_step.py::test_call_cube_build_nirspec \
#        --deselect=jwst/background/tests/test_background.py::test_nrc_wfss_background \
#        --deselect=jwst/background/tests/test_background.py::test_nirspec_gwa \
#        --deselect=jwst/background/tests/test_background.py::test_nis_wfss_background \
#        --deselect=jwst/combine_1d/tests/test_dq.py::test_dq \
#        --deselect=jwst/dark_current/tests/test_dark_sub.py::test_basic_step \
#        --deselect=jwst/dark_current/tests/test_dark_sub.py::test_average_dark_current \
#        --deselect=jwst/datamodels/tests/test_api.py::test_stdatamodels_api \
#        --deselect=jwst/dq_init/tests/test_dq_init.py::test_fullstep \
#        --deselect=jwst/emicorr/tests/test_emicorr.py::test_EmiCorrStep \
#        --deselect=jwst/extract_2d/tests/test_grisms.py::test_extract_tso_object_fails_without_xref_yref \
#        --deselect=jwst/lib/tests/test_engdb_tools.py::test_environmental_bad \
#        --deselect=jwst/mrs_imatch/tests/test_apply_background.py::test_apply_background_2d \
#        --deselect=jwst/linearity/tests/test_linearity.py::test_saturation \
#        --deselect=jwst/linearity/tests/test_linearity.py::test_err_array \
#        --deselect=jwst/master_background/tests/test_master_background.py::test_master_background_userbg \
#        --deselect=jwst/master_background/tests/test_master_background.py::test_master_background_logic \
#        --deselect=jwst/msaflagopen/tests/test_msa_open.py::test_get_failed_open_shutters \
#        --deselect=jwst/msaflagopen/tests/test_msa_open.py::test_create_slitlets \
#        --deselect=jwst/msaflagopen/tests/test_msa_open.py::test_msaflagopen_step \
#        --deselect=jwst/outlier_detection/tests/test_outlier_detection.py::test_outlier_step_no_outliers \
#        --deselect=jwst/outlier_detection/tests/test_outlier_detection.py::test_outlier_step \
#        --deselect=jwst/ramp_fitting/tests/test_ramp_fit_step.py::test_ramp_fit_step \
#        --deselect=jwst/ramp_fitting/tests/test_ramp_fit_step.py::test_subarray_5groups \
#        --deselect=jwst/ramp_fitting/tests/test_ramp_fit_step.py::test_int_times1 \
#        --deselect=jwst/ramp_fitting/tests/test_ramp_fit_step.py::test_int_times2 \
#        --deselect=jwst/resample/tests/test_interface.py::test_multi_integration_input \
#        --deselect=jwst/source_catalog/tests/test_source_catalog.py::test_source_catalog \
#        --deselect=jwst/saturation/tests/test_saturation.py::test_full_step \
#        --deselect=jwst/superbias/tests/test_bias_sub.py::test_full_step
#
#}

package_python-jwst() {
    depends=('python-asdf>=3.1.0'
             'python-astropy>=5.3'
             'python-bayesicfitting>=3.0.1'
             'python-crds>=11.17.14'
             'python-drizzle>=1.15.0'
             'python-gwcs>=0.21.0'
             'python-numpy>=1.22'
             'python-opencv>=4.6.0.66'
             'python-photutils>=1.5.0'
             'python-psutil>=5.7.2'
             'python-poppy>=1.0.2'
             'python-pyparsing>=2.2.1'
             'python-requests>=2.22'
             'python-scikit-image>=0.19'
             'python-scipy>=1.9.3'
             'python-spherical_geometry>=1.2.22'
             'python-stcal>=1.9.0'
             'python-stdatamodels>=2.1.0'
             'python-stpipe>=0.7.0'
             'python-stsci.image>=2.3.5'
             'python-stsci.imagestats>=1.6.3'
             'python-synphot>=1.2'
             'python-tweakwcs>=0.8.8'
             'python-asdf-astropy>=0.3.0'
             'python-wiimatch>=0.2.1'
             'python-packaging>20.0'
             'python-importlib-metadata>=4.11.4'
             'python-jsonschema>=4.8')
    optdepends=('python-jwst-doc: Documentation for Python JWST')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-jwst-doc() {
    pkgdesc="Documentation for Python JWST Pipeline"
    arch=('any')
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" ../../LICENSE
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
