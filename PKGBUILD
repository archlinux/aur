# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-jwst
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=1.19.2
pkgrel=1
pkgdesc="Library for calibration of science observations from the James Webb Space Telescope"
arch=('i686' 'x86_64')
url="https://jwst-pipeline.readthedocs.io"
license=('BSD-3-Clause')
makedepends=('python-setuptools-scm>=3.4'
             'python-build'
             'python-installer'
             'python-numpy>=2.0'
             'python-sphinx-automodapi'
             'python-sphinxcontrib-jquery'
             'python-sphinx_rtd_theme'
             'python-pytest-doctestplus'
             'python-bayesicfitting'
             'python-jsonschema'
             'python-photutils'
             'python-stcal'
             'python-stdatamodels'
             'python-stpipe'
             'python-synphot'
             'python-wiimatch'
             'graphviz'
             'texlive-latexextra')  # latex.fmt: -latex; anyfontsize.sty: latexextra
# scipy <- gwcs <- tweakwcs <- stcal; skimage <- stcal; spherical_geometry <- tweakwcs ..; drizzle <- stcal
# wheel required by new setuptools
# inputs_root: ci_watson
#checkdepends=('python-pytest-doctestplus'
#              'python-pytest-xdist'
#              'python-ci_watson'
#              'python-pysiaf'
##             'python-requests-mock'
#              'rsync'
#              ) # stpipe, gwcs <- tweakwcs <- stcal, jsonschema, stdatamodel, photutils, synphot, wiimatch, bayesicfitting already in makedepends
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('b35dfeb5b3e46f7990434a24dfe67b12')

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
#    python -m installer --destdir=tmp_install dist/*.whl
#    rm -r tmp_install/usr/lib #pytest_crds
#    for sos in $(find build -name '*.so' | sed "s:build/lib.linux-${CARCH}-cpython-$(get_pyinfo)/::g"); do
#        cp -v {build/lib.linux-${CARCH}-cpython-$(get_pyinfo)/,}$sos
#    done
#    CRDS_PATH=".crds" CRDS_SERVER_URL=https://jwst-crds.stsci.edu CRDS_CONTEXT=jwst_1281.pmap PATH="${PWD}/tmp_install/usr/bin:${PATH}" \
#        PYTHONPATH="build/lib.linux-${CARCH}-cpython-$(get_pyinfo)" pytest -vv -l -ra --color=yes -o console_output_style=count \
#        --ignore=jwst/refpix/tests/test_refpix.py \
#        --ignore=jwst/resample/tests/test_resample_step.py \
#        --ignore=jwst/assign_wcs/tests/test_miri.py \
#        --ignore=jwst/assign_wcs/tests/test_nircam.py \
#        --ignore=jwst/assign_wcs/tests/test_niriss.py \
#        --ignore=jwst/assign_wcs/tests/test_nirspec.py \
#        --ignore=jwst/extract_1d/tests/test_expected_skips.py \
#        --ignore=jwst/regtest \
#        --deselect=jwst/ami/tests/test_ami_analyze.py::test_ami_analyze_even_oversample_fail \
#        --deselect=jwst/ami/tests/test_ami_analyze.py::test_ami_analyze_step \
#        --deselect=jwst/ami/tests/test_ami_average.py::test_ami_average_deprecated \
#        --deselect=jwst/ami/tests/test_ami_interface.py::test_ami_analyze_even_oversample_fail \
#        --deselect=jwst/ami/tests/test_ami_interface.py::test_ami_analyze_step \
#        --deselect=jwst/ami/tests/test_ami_normalize.py::test_ami_normalize \
#        --deselect=jwst/ami/tests/test_bp_fix.py::test_fix_bad_pixels \
#        --deselect=jwst/ami/tests/test_find_affine2d_parameters.py::test_find_rotation \
#        --deselect=jwst/ami/tests/test_instrument_data.py::test_niriss \
#        --deselect=jwst/ami/tests/test_lg_model.py::test_simulate \
#        --deselect=jwst/ami/tests/test_lg_model.py::test_make_model \
#        --deselect=jwst/ami/tests/test_lg_model.py::test_fit_image \
#        --deselect=jwst/ami/tests/test_mask_definition_ami.py::test_NRMDefinition \
#        --deselect=jwst/ami/tests/test_nrm_core.py::test_fringe_fitter \
#        --deselect=jwst/assign_wcs/tests/test_wcs.py::test_sip_approx \
#        --deselect=jwst/background/tests/test_background.py::test_asn_input \
#        --deselect=jwst/background/tests/test_background.py::test_miri_subarray_full_overlap \
#        --deselect=jwst/background/tests/test_background.py::test_miri_subarray_full_overlap \
#        --deselect=jwst/background/tests/test_background.py::test_miri_subarray_full_overlap \
#        --deselect=jwst/background/tests/test_background.py::test_miri_subarray_full_overlap \
#        --deselect=jwst/background/tests/test_background.py::test_miri_subarray_full_overlap \
#        --deselect=jwst/background/tests/test_background.py::test_miri_subarray_full_overlap \
#        --deselect=jwst/background/tests/test_background.py::test_miri_subarray_full_overlap \
#        --deselect=jwst/background/tests/test_background.py::test_miri_subarray_full_overlap \
#        --deselect=jwst/background/tests/test_background.py::test_miri_subarray_partial_overlap \
#        --deselect=jwst/background/tests/test_background_soss.py::test_subtract_soss_bkg \
#        --deselect=jwst/background/tests/test_background_wfss.py::test_nrc_wfss_full_run \
#        --deselect=jwst/background/tests/test_background_wfss.py::test_nis_wfss_full_run \
#        --deselect=jwst/background/tests/test_background_wfss.py::test_wfss_asn_input \
#        --deselect=jwst/flatfield/tests/test_flatfield.py::test_nirspec_flatfield_step_interface \
#        --deselect=jwst/clean_flicker_noise/tests/test_clean_flicker_noise.py::test_postprocess_rate_nirspec \
#        --deselect=jwst/clean_flicker_noise/tests/test_clean_flicker_noise.py::test_postprocess_rate_miri \
#        --deselect=jwst/cube_build/tests/test_cube_build_step.py::test_call_cube_build_nirspec \
#        --deselect=jwst/cube_build/tests/test_offset.py::test_read_offset_file \
#        --deselect=jwst/background/tests/test_background.py::test_bg_file_list \
#        --deselect=jwst/background/tests/test_background.py::test_nrc_wfss_background \
#        --deselect=jwst/background/tests/test_background.py::test_nirspec_gwa \
#        --deselect=jwst/background/tests/test_background.py::test_nis_wfss_background \
#        --deselect=jwst/background/tests/test_background_wfss.py::test_nrc_wfss_background \
#        --deselect=jwst/background/tests/test_background_wfss.py::test_nis_wfss_background \
#        --deselect=jwst/badpix_selfcal/tests/test_badpix_selfcal.py::test_input_parsing \
#        --deselect=jwst/badpix_selfcal/tests/test_badpix_selfcal.py::test_background_flagger_mrs \
#        --deselect=jwst/badpix_selfcal/tests/test_badpix_selfcal.py::test_apply_flags \
#        --deselect=jwst/badpix_selfcal/tests/test_badpix_selfcal.py::test_badpix_selfcal_step \
#        --deselect=jwst/barshadow/tests/test_barshadow_step.py::test_barshadow_step \
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
#        --deselect=jwst/master_background/tests/test_master_background_mos.py::test_master_background_mos \
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
#        --deselect=jwst/residual_fringe/tests/test_residual_fringe.py::test_rf_step_long[LONG] \
#        --deselect=jwst/source_catalog/tests/test_source_catalog.py::test_source_catalog \
#        --deselect=jwst/saturation/tests/test_saturation.py::test_full_step \
#        --deselect=jwst/superbias/tests/test_bias_sub.py::test_full_step \
#        --deselect=jwst/skymatch/tests/test_skymatch.py::test_skymatch_2x[global+match-False]
#
#
#}

package_python-jwst() {
    depends=('python-asdf>=4.0'
             'python-astropy>=6.1'
             'python-bayesicfitting>=3.2.2'
             'python-crds>=12.0.3'
             'python-drizzle>=2.0.1'
             'python-gwcs>=0.25.0'
             'python-numpy>=1.25'
             'python-opencv>=4.6.0.66'
             'python-photutils>=1.5.0'
             'python-pyparsing>=2.2.1'
             'python-requests>=2.31'
             'python-scikit-image>=0.20.0'
             'python-scipy>=1.14.1'
             'python-spherical_geometry>=1.3'
             'python-stcal>=1.14.0'
             'python-stdatamodels>=4.0.1'
             'python-stpipe>=0.10.0'
             'python-stsci.imagestats>=1.6.3'
             'python-synphot>=1.3'
             'python-tweakwcs>=0.8.8'
             'python-wiimatch>=0.3.2'
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
