# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-jwst
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=1.20.1
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
             'python-numpydoc'
             'python-pytest-doctestplus'
             'python-bayesicfitting'
             'python-jsonschema'
             'python-photutils'
             'python-stcal'
             'python-stdatamodels'
             'python-stpipe'
             'python-synphot'
             'graphviz')
##            'python-wiimatch'
#         )
#            'texlive-latexextra'
#)  # latex.fmt: -latex; anyfontsize.sty: latexextra
# scipy <- gwcs <- tweakwcs <- stcal; skimage <- stcal; spherical_geometry <- tweakwcs ..; drizzle <- stcal
# wheel required by new setuptools
# inputs_root: ci_watson
#checkdepends=('python-pytest'
#              'python-pytest-doctestplus'
##              'python-pytest-xdist'
#              'python-pytest-timeout'
#              'python-ci_watson'
#              'python-pysiaf'
###             'python-requests-mock'
#              'rsync'
#              ) # stpipe, gwcs <- tweakwcs <- stcal, jsonschema, stdatamodel, photutils, synphot, wiimatch, bayesicfitting already in makedepends
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('fa9023c1601e92ccce253315474589cc')

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
#    #jwst/extract_1d/soss_extract/tests/test_pastasoss.py jwst/emicorr/tests/test_emicorr.py::test_run_in_pipeline jwst/pipeline/tests/test_calwebb_tso3.py
#    mkdir -p .crds/config/jwst
#    touch .crds/config/jwst/server_config
#    python -m installer --destdir=tmp_install dist/*.whl
#    rm -r tmp_install/usr/lib #pytest_crds
#    for sos in $(find build -name '*.so' | sed "s:build/lib.linux-${CARCH}-cpython-$(get_pyinfo)/::g"); do
#        cp -v {build/lib.linux-${CARCH}-cpython-$(get_pyinfo)/,}$sos
#    done
#    CRDS_PATH=".crds" CRDS_SERVER_URL=https://jwst-crds.stsci.edu CRDS_CONTEXT=jwst_1281.pmap PATH="${PWD}/tmp_install/usr/bin:${PATH}" \
#        PYTHONPATH="build/lib.linux-${CARCH}-cpython-$(get_pyinfo)" pytest -vv -l -ra --color=yes -o console_output_style=count --timeout 300 \
#        --ignore=jwst/refpix/tests/test_refpix.py \
#        --ignore=jwst/resample/tests/test_resample_step.py \
#        --ignore=jwst/assign_wcs/tests/test_miri.py \
#        --ignore=jwst/assign_wcs/tests/test_nircam.py \
#        --ignore=jwst/assign_wcs/tests/test_niriss.py \
#        --ignore=jwst/assign_wcs/tests/test_nirspec.py \
#        --ignore=jwst/extract_1d/tests/test_expected_skips.py \
#        --ignore=jwst/regtest \
#        --ignore=jwst/combine_1d/tests/test_combine1d.py \
#        --deselect=jwst/ami/tests/test_ami_analyze.py::test_ami_analyze_even_oversample_fail \
#        --deselect=jwst/ami/tests/test_ami_analyze.py::test_ami_analyze_step \
#        --deselect=jwst/ami/tests/test_ami_analyze.py::test_output_is_not_input \
#        --deselect=jwst/ami/tests/test_ami_average.py::test_ami_average_deprecated \
#        --deselect=jwst/ami/tests/test_ami_interface.py::test_ami_analyze_even_oversample_fail \
#        --deselect=jwst/ami/tests/test_ami_interface.py::test_ami_analyze_step \
#        --deselect=jwst/ami/tests/test_ami_normalize.py::test_ami_normalize \
#        --deselect=jwst/ami/tests/test_ami_normalize.py::test_output_is_not_input \
#        --deselect=jwst/ami/tests/test_bp_fix.py::test_fix_bad_pixels \
#        --deselect=jwst/ami/tests/test_find_affine2d_parameters.py::test_find_rotation \
#        --deselect=jwst/ami/tests/test_instrument_data.py::test_niriss \
#        --deselect=jwst/ami/tests/test_lg_model.py::test_simulate \
#        --deselect=jwst/ami/tests/test_lg_model.py::test_make_model \
#        --deselect=jwst/ami/tests/test_lg_model.py::test_fit_image \
#        --deselect=jwst/ami/tests/test_mask_definition_ami.py::test_NRMDefinition \
#        --deselect=jwst/ami/tests/test_nrm_core.py::test_fringe_fitter \
#        --deselect=jwst/assign_wcs/tests/test_wcs.py::test_sip_approx \
#        --deselect=jwst/assign_mtwcs/tests/test_mtwcs.py::test_output_is_not_input \
#        --deselect=jwst/assign_mtwcs/tests/test_mtwcs.py::test_input_not_supported \
#        --deselect=jwst/assign_wcs/tests/test_assign_wcs_step.py::test_assign_wcs_step_miri_ifu \
#        --deselect=jwst/assign_wcs/tests/test_assign_wcs_step.py::test_assign_wcs_step_nis_wfss \
#        --deselect=jwst/assign_wcs/tests/test_assign_wcs_step.py::test_assign_wcs_step_nrc_wfss \
#        --deselect=jwst/assign_wcs/tests/test_assign_wcs_step.py::test_unsupported_input \
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
#        --deselect=jwst/background/tests/test_background.py::test_output_is_not_input \
#        --deselect=jwst/background/tests/test_background.py::test_save_combined_bg_file \
#        --deselect=jwst/background/tests/test_background_soss.py::test_subtract_soss_bkg \
#        --deselect=jwst/background/tests/test_background_soss.py::test_bkg_fail \
#        --deselect=jwst/background/tests/test_background_soss.py::test_bkg_percentile \
#        --deselect=jwst/background/tests/test_background_wfss.py::test_bkg_fail \
#        --deselect=jwst/background/tests/test_background_wfss.py::test_infinite_factor \
#        --deselect=jwst/background/tests/test_background_wfss.py::test_missing_bkg \
#        --deselect=jwst/background/tests/test_background_wfss.py::test_nrc_wfss_full_run \
#        --deselect=jwst/background/tests/test_background_wfss.py::test_nis_wfss_full_run \
#        --deselect=jwst/background/tests/test_background_wfss.py::test_wfss_asn_input \
#        --deselect=jwst/flatfield/tests/test_flatfield.py::test_nirspec_flatfield_step_interface \
#        --deselect=jwst/clean_flicker_noise/tests/test_clean_flicker_noise.py::test_postprocess_rate_nirspec \
#        --deselect=jwst/clean_flicker_noise/tests/test_clean_flicker_noise.py::test_postprocess_rate_miri \
#        --deselect=jwst/clean_flicker_noise/tests/test_clean_flicker_noise.py::test_make_rate \
#        --deselect=jwst/clean_flicker_noise/tests/test_clean_flicker_noise.py::test_mask_ifu_slices \
#        --deselect=jwst/clean_flicker_noise/tests/test_clean_flicker_noise.py::test_mask_slits \
#        --deselect=jwst/clean_flicker_noise/tests/test_clean_flicker_noise.py::test_create_mask_nirspec[mos_fs] \
#        --deselect=jwst/clean_flicker_noise/tests/test_clean_flicker_noise.py::test_do_correction_miri_imaging_ramp \
#        --deselect=jwst/clean_flicker_noise/tests/test_clean_flicker_noise.py::test_do_correction_nirspec_rate \
#        --deselect=jwst/clean_flicker_noise/tests/test_clean_flicker_noise.py::test_do_correction_no_fit_by_channel \
#        --deselect=jwst/clean_flicker_noise/tests/test_clean_flicker_noise.py::test_do_correction_no_background \
#        --deselect=jwst/clean_flicker_noise/tests/test_clean_flicker_noise.py::test_do_correction_fft_subarray \
#        --deselect=jwst/clean_flicker_noise/tests/test_clean_flicker_noise.py::test_do_correction_clean_fails \
#        --deselect=jwst/clean_flicker_noise/tests/test_clean_flicker_noise.py::test_do_correction_save_intermediate[ramp-noise] \
#        --deselect=jwst/clean_flicker_noise/tests/test_clean_flicker_noise.py::test_do_correction_save_intermediate[ramp-background] \
#        --deselect=jwst/clean_flicker_noise/tests/test_clean_flicker_noise.py::test_do_correction_with_flat_unity[ramp] \
#        --deselect=jwst/clean_flicker_noise/tests/test_clean_flicker_noise.py::test_do_correction_with_flat_structure[ramp-True] \
#        --deselect=jwst/clean_flicker_noise/tests/test_clean_flicker_noise.py::test_do_correction_with_flat_structure[ramp-False] \
#        --deselect=jwst/clean_flicker_noise/tests/test_clean_flicker_noise_step.py \
#        --deselect=jwst/clean_flicker_noise/tests/test_autoparam.py::test_image_non_rate_models[ramp] \
#        --deselect=jwst/cube_build/tests/test_cube_build_step.py::test_call_cube_build_nirspec \
#        --deselect=jwst/cube_build/tests/test_offset.py::test_read_offset_file \
#        --deselect=jwst/cube_build/tests/test_offset.py::test_offset_file_config \
#        --deselect=jwst/background/tests/test_background.py::test_bg_file_list \
#        --deselect=jwst/background/tests/test_background.py::test_nrc_wfss_background \
#        --deselect=jwst/background/tests/test_background.py::test_nirspec_gwa \
#        --deselect=jwst/background/tests/test_background.py::test_nis_wfss_background \
#        --deselect=jwst/background/tests/test_background_wfss.py::test_nrc_wfss_background \
#        --deselect=jwst/background/tests/test_background_wfss.py::test_nis_wfss_background \
#        --deselect=jwst/badpix_selfcal/tests/test_badpix_selfcal.py::test_expected_fail_sci \
#        --deselect=jwst/badpix_selfcal/tests/test_badpix_selfcal.py::test_input_parsing \
#        --deselect=jwst/badpix_selfcal/tests/test_badpix_selfcal.py::test_background_flagger_mrs \
#        --deselect=jwst/badpix_selfcal/tests/test_badpix_selfcal.py::test_apply_flags \
#        --deselect=jwst/badpix_selfcal/tests/test_badpix_selfcal.py::test_badpix_selfcal_step \
#        --deselect=jwst/badpix_selfcal/tests/test_badpix_selfcal.py::test_save_bkg \
#        --deselect=jwst/barshadow/tests/test_barshadow_step.py::test_barshadow_step \
#        --deselect=jwst/barshadow/tests/test_barshadow_step.py::test_barshadow_no_reffile \
#        --deselect=jwst/barshadow/tests/test_barshadow_step.py::test_barshadow_wrong_exptype \
#        --deselect=jwst/barshadow/tests/test_barshadow_step.py::test_barshadow_correction_pars \
#        --deselect=jwst/charge_migration/tests/test_charge_migration.py::test_output_is_not_input \
#        --deselect=jwst/charge_migration/tests/test_charge_migration.py::test_too_few_groups \
#        --deselect=jwst/combine_1d/tests/test_dq.py::test_dq \
#        --deselect=jwst/coron/tests/test_align_refs_step.py::test_align_refs_no_shift \
#        --deselect=jwst/coron/tests/test_align_refs_step.py::test_align_refs_with_shift \
#        --deselect=jwst/coron/tests/test_align_refs_step.py::test_no_bad_bit \
#        --deselect=jwst/coron/tests/test_hlsp_step.py::test_hlsp_step \
#        --deselect=jwst/coron/tests/test_klip_step.py::test_klip_step \
#        --deselect=jwst/coron/tests/test_stack_refs_step.py::test_stack_refs_step \
#        --deselect=jwst/coron/tests/test_stack_refs_step.py::test_stack_refs_shape_mismatch \
#        --deselect=jwst/cube_build/tests/test_offset.py::test2_offset_file_config \
#        --deselect=jwst/cube_build/tests/test_offset.py::test_offset_file_units \
#        --deselect=jwst/dark_current/tests/test_dark_sub.py::test_basic_step \
#        --deselect=jwst/dark_current/tests/test_dark_sub.py::test_average_dark_current \
#        --deselect=jwst/dark_current/tests/test_dark_sub.py::test_no_dark \
#        --deselect=jwst/datamodels/tests/test_api.py::test_stdatamodels_api \
#        --deselect=jwst/dq_init/tests/test_dq_init.py \
#        --deselect=jwst/emicorr/tests/test_emicorr.py::test_run_in_pipeline \
#        --deselect=jwst/emicorr/tests/test_emicorr.py::test_EmiCorrStep \
#        --deselect=jwst/engdblog/tests/test_engdblog.py::test_all \
#        --deselect=jwst/engdblog/tests/test_engdblog.py::test_multi_mnemonics \
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
#        --deselect=jwst/skymatch/tests/test_skymatch.py::test_skymatch_2x[global+match-False] \
#        --deselect=jwst/wfss_contam/tests/test_wfss_contam_step.py::test_wfss_contam_step_defaults \
#        --deselect=jwst/wfss_contam/tests/test_wfss_contam_step.py::test_output_is_not_input \
#        --deselect=jwst/master_background/tests/test_master_background.py::test_master_background_medfilt \
#        --deselect=jwst/outlier_detection/tests/test_coron.py::test_outlier_step_weak_cr_coron \
#        --deselect=jwst/outlier_detection/tests/test_ifu.py::test_ifu_one_exposure \
#        --deselect=jwst/outlier_detection/tests/test_ifu.py::test_ifu_second_check \
#        --deselect=jwst/outlier_detection/tests/test_ifu.py::test_ifu_even_kernel \
#        --deselect=jwst/outlier_detection/tests/test_ifu.py::test_ifu_save_intermediate \
#        --deselect=jwst/skymatch/tests/test_skymatch.py::test_skymatch_2x[local-True] \
#        --deselect=jwst/skymatch/tests/test_skymatch.py::test_skymatch_2x[global+match-True] \
#        --deselect=jwst/skymatch/tests/test_skymatch.py::test_user_skyfile[False] \
#        --deselect=jwst/skymatch/tests/test_skymatch.py::test_user_skyfile[True] \
#        --deselect=jwst/wfss_contam/tests/test_wfss_contam_step.py::test_wfss_contam_step \
#        --deselect=jwst/wfss_contam/tests/test_wfss_contam_step.py::test_wfss_contam_skip_maglimit \
#        --deselect=jwst/wfss_contam/tests/test_wfss_contam_step.py::test_wfss_contam_skip_bad_order \
#        --deselect=jwst/emicorr/tests/test_emicorr.py::test_emicorrstep_skip_instrument \
#        --deselect=jwst/emicorr/tests/test_emicorr.py::test_emicorrstep_skip_readpatt \
#        --deselect=jwst/emicorr/tests/test_emicorr.py::test_emicorrstep_skip_no_reffile \
#        --deselect=jwst/emicorr/tests/test_emicorr.py::test_emicorrstep_skip_for_failure \
#        --deselect=jwst/emicorr/tests/test_emicorr.py::test_emicorrstep_skip_for_small_groups \
#        --deselect=jwst/extract_2d/tests/test_grisms.py::test_extract_tso_subarray \
#        --deselect=jwst/extract_2d/tests/test_grisms.py::test_extract_tso_height \
#        --deselect=jwst/linearity/tests/test_linearity.py::test_output_is_not_input \
#        --deselect=jwst/master_background/tests/test_master_background_mos.py::test_skip_no_master_bg \
#        --deselect=jwst/outlier_detection/tests/test_ifu.py::test_ifu_with_outliers[miri_ifu_rate-20] \
#        --deselect=jwst/outlier_detection/tests/test_spec.py::test_outlier_step_spec[False-False] \
#        --deselect=jwst/pipeline/tests/test_calwebb_tso3.py::test_niriss_soss \
#        --deselect=jwst/pipeline/tests/test_calwebb_tso3.py::test_niriss_soss_full \
#        --deselect=jwst/residual_fringe/tests/test_residual_fringe.py::test_rf_step_short[SHORT] \
#        --deselect=jwst/residual_fringe/tests/test_residual_fringe.py::test_rf_step_short[MEDIUM] \
#        --deselect=jwst/residual_fringe/tests/test_residual_fringe.py::test_rf_step_short[LONG] \
#        --deselect=jwst/residual_fringe/tests/test_residual_fringe.py::test_rf_step_long[SHORT] \
#        --deselect=jwst/residual_fringe/tests/test_residual_fringe.py::test_rf_step_long[MEDIUM] \
#        --deselect=jwst/residual_fringe/tests/test_residual_fringe.py::test_rf_step_nans_in_wavelength \
#        --deselect=jwst/residual_fringe/tests/test_residual_fringe.py::test_rf_step_save_intermediate \
#        --deselect=jwst/residual_fringe/tests/test_residual_fringe.py::test_rf_step_ignore_regions \
#        --deselect=jwst/residual_fringe/tests/test_residual_fringe.py::test_rf_step_low_snr \
#        --deselect=jwst/residual_fringe/tests/test_residual_fringe.py::test_rf_step_weights_gap \
#        --deselect=jwst/rscd/tests/test_rscd_step.py::test_step_complete \
#        --deselect=jwst/saturation/tests/test_saturation.py::test_skip_missing_reffile \
#        --deselect=jwst/stpipe/tests/test_crds.py::test_crds_step \
#        --deselect=jwst/straylight/tests/test_straylight_step.py::test_step_save_shower_model \
#        --deselect=jwst/superbias/tests/test_superbias_step.py::test_full_step \
#        --deselect=jwst/emicorr/tests/test_emicorr.py::test_emicorrstep_succeeds[MASK1550-sequential] \
#        --deselect=jwst/emicorr/tests/test_emicorr.py::test_emicorrstep_succeeds[MASK1550-joint] \
#        --deselect=jwst/emicorr/tests/test_emicorr.py::test_emicorrstep_succeeds[FULL-sequential] \
#        --deselect=jwst/emicorr/tests/test_emicorr.py::test_emicorrstep_succeeds[FULL-joint] \
#        --deselect=jwst/emicorr/tests/test_emicorr.py::test_emicorrstep_user_freq[FAST] \
#        --deselect=jwst/emicorr/tests/test_emicorr.py::test_emicorrstep_user_freq[SLOW] \
#        --deselect=jwst/emicorr/tests/test_emicorr.py::test_emicorrstep_user_reffile \
#        --deselect=jwst/extract_1d/soss_extract/tests/test_pastasoss.py::test_get_soss_traces_public[None-1-245.54999999999998] \
#        --deselect=jwst/extract_1d/soss_extract/tests/test_pastasoss.py::test_get_soss_traces_public[None-1-245.79] \
#        --deselect=jwst/extract_1d/tests/test_extract_1d_step.py::test_extract_nirspec_mos_multi_slit \
#        --deselect=jwst/flatfield/tests/test_flatfield.py::test_nirspec_ifu_flat \
#        --deselect=jwst/msaflagopen/tests/test_msa_open.py::test_custom_ref_file \
#        --deselect=jwst/outlier_detection/tests/test_ifu.py::test_ifu_with_outliers[nirspec_ifu_rate-23] \
#        --deselect=jwst/outlier_detection/tests/test_spec.py::test_outlier_step_spec[False-True] \
#        --deselect=jwst/persistence/tests/test_persistence_step.py::test_step_no_trapsfilled \
#        --deselect=jwst/tso_photometry/tests/test_tso_photometry.py::test_tso_phot_uncalibrated \
#        --deselect=jwst/tso_photometry/tests/test_tso_photometry.py::test_tso_phot_unexpected_units \
#        --deselect=jwst/tso_photometry/tests/test_tso_photometry_step.py::test_tsophotometry_step_subarray \
#        --deselect=jwst/tso_photometry/tests/test_tso_photometry_step.py::test_tsophotometry_step_full_frame \
#        --deselect=jwst/tso_photometry/tests/test_tso_photometry_step.py::test_tsophotometry_step_save_catalog \
#        --deselect=jwst/tso_photometry/tests/test_tso_photometry_step.py::test_tsophotometry_step_no_centroid \
#        --deselect=jwst/tso_photometry/tests/test_tso_photometry_step.py::test_tsophotometry_step_moving_centroid \
#        --deselect=jwst/tso_photometry/tests/test_tso_photometry_step.py::test_tsophotometry_step_failed_centroid \
#        --deselect=jwst/tso_photometry/tests/test_tso_photometry_step.py::test_tsophotometry_step_odd_boxes[search_box_width] \
#        --deselect=jwst/pathloss/tests/test_pathloss_step.py::test_pathloss_step_mos_point \
#        --deselect=jwst/pathloss/tests/test_pathloss_step.py::test_pathloss_correction_pars[mos] \
#        --deselect=jwst/pathloss/tests/test_pathloss_step.py::test_pathloss_correction_pars[fs] \
#        --deselect=jwst/wfss_contam/tests/test_disperse.py::test_disperse_oversample_same_result[True] \
#        --deselect=jwst/wfss_contam/tests/test_disperse.py::test_disperse_oversample_same_result[False] \
#        --deselect=jwst/wfss_contam/tests/test_wfss_contam.py::test_apply_magnitude_limit \
#        --deselect=jwst/wfss_contam/tests/test_wfss_contam.py::test_apply_magnitude_limit_no_sources \
#        --deselect=jwst/extract_1d/soss_extract/tests/test_pastasoss.py::test_get_soss_traces_public[None-1-246.03] \
#        --deselect=jwst/extract_1d/soss_extract/tests/test_pastasoss.py::test_get_soss_traces_public[None-2-245.54999999999998] \
#        --deselect=jwst/extract_1d/soss_extract/tests/test_pastasoss.py::test_get_soss_traces_public[None-2-245.79] \
#        --deselect=jwst/extract_1d/soss_extract/tests/test_pastasoss.py::test_get_soss_traces_public[None-2-246.03] \
#        --deselect=jwst/extract_1d/soss_extract/tests/test_pastasoss.py::test_get_soss_traces_public[SUBSTRIP96-1-245.54999999999998] \
#        --deselect=jwst/extract_1d/soss_extract/tests/test_pastasoss.py::test_get_soss_traces_public[SUBSTRIP96-1-245.79] \
#        --deselect=jwst/extract_1d/soss_extract/tests/test_pastasoss.py::test_get_soss_traces_public[SUBSTRIP96-1-246.03] \
#        --deselect=jwst/extract_1d/soss_extract/tests/test_pastasoss.py::test_get_soss_traces_public[SUBSTRIP96-2-245.54999999999998] \
#        --deselect=jwst/outlier_detection/tests/test_spec.py::test_outlier_step_spec[True-True] \
#        --deselect=jwst/outlier_detection/tests/test_spec.py::test_outlier_step_spec[True-False] \
#        --deselect=jwst/pathloss/tests/test_pathloss_step.py::test_pathloss_step_mos_uniform \
#        --deselect=jwst/persistence/tests/test_persistence_step.py::test_step_with_trapsfilled \
#        --deselect=jwst/persistence/tests/test_persistence_step.py::test_step_missing_one_ref \
#        --deselect=jwst/persistence/tests/test_persistence_step.py::test_step_persistence_fails \
#        --deselect=jwst/photom/tests/test_photom_step.py::test_step_complete \
#        --deselect=jwst/photom/tests/test_photom_step.py::test_skip_no_reffile \
#        --deselect=jwst/tso_photometry/tests/test_tso_photometry_step.py::test_tsophotometry_step_odd_boxes[fit_box_width]
#
#}

package_python-jwst() {
    depends=('python-asdf>=4.2'
             'python-astropy>=6.1'
             'python-bayesicfitting>=3.2.2'
             'python-crds>=12.0.3'
             'python-drizzle>=2.1.1'
             'python-gwcs>=0.26.0'
             'python-numpy>=1.25'
#            'python-opencv>=4.6.0.66'
             'python-photutils>=2.1.0'
             'python-pyparsing>=2.2.1'
             'python-requests>=2.31'
             'python-scikit-image>=0.20.0'
             'python-scipy>=1.14.1'
             'python-spherical_geometry>=1.3'
             'python-stcal>=1.15.2'
             'python-stdatamodels>=4.1.0'
             'python-stpipe>=0.11.1'
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
