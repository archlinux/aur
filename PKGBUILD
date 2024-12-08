# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_pkgname=uproot
pkgbase="python-${_pkgname}"
pkgname=("${pkgbase}" "${pkgbase}-docs")
pkgver=5.5.1
pkgrel=1
pkgdesc="Minimalist CERN ROOT I/O in pure Python and Numpy"
arch=(any)
url="https://github.com/scikit-hep/${_pkgname}5"
license=(BSD-3-Clause)
makedepends=(
    git
    python-build
    python-hatch-vcs
    python-hatchling
    python-installer
    python-sphinx
    python-sphinx_rtd_theme
    python-wheel
)
checkdepends=(
    python-aiohttp
    python-cramjam
    python-dask
    python-distributed
    python-hist
    python-matplotlib
    python-pandas
    python-pkgconfig
    python-pytest
    python-pytest-timeout
    python-rangehttpserver
    python-requests
    python-scikit-hep-testdata
    python-xxhash
    root
    xrootd
)
depends=(
    python
    python-awkward
    python-cachetools
    python-lz4
    python-numpy
    python-zstandard
)
optdepends=(
    'xrootd: access remote files over XRootD'
    'python-pandas: fill Pandas DataFrames instead of Numpy arrays'
    'python-requests: access remote files through HTTP'
    'python-xxhash: handle lz4-compressed ROOT files'
)

source=("${_pkgname}-${pkgver}::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c6a6e034ed642ee95b391ab8f1b60a0318fbfb7aabcb48c3a3440ee10cca7b51')

build() {
    cd "${_pkgname}5-${pkgver}"
    SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver \
    python -m build --wheel --no-isolation
}

check() {
    local pytest_options=(
        -vv
        # disable tests that rely on downloading the internet
        --deselect tests/test_0006_notify_when_downloaded.py::test_xrootd_workers
        --deselect tests/test_0006_notify_when_downloaded.py::test_xrootd_vectorread
        --deselect tests/test_0007_single_chunk_interface.py::test_xrootd
        --deselect tests/test_0007_single_chunk_interface.py::test_xrootd_worker
        --deselect tests/test_1146_split_ranges_for_large_files_over_http.py::test_split_ranges_if_large_file_in_http
        # disable tests depending on unpackaged deps: fsspec-xrootd, dask-awkward, awkward-pandas
        --deselect tests/test_0302_pickle.py::test_pickle_roundtrip_xrootd
        --deselect tests/test_0692_fsspec_reading.py::test_open_fsspec_xrootd_iterate_files
        --deselect tests/test_0692_fsspec_reading.py::test_open_fsspec_xrootd_iterate_tree
        --deselect tests/test_0912_fix_pandas_and_double_nested_vectors_issue_885.py::test_pandas_and_double_nested_vectors_issue_885
        --deselect tests/test_1120_check_decompression_executor_pass_for_dask.py::test_decompression_executor_for_dask
        --deselect tests/test_1189_dask_failing_on_duplicate_keys.py::test_dask_duplicated_keys
        --deselect tests/test_1254_test_threadpool_executor_for_dask.py::test_decompression_threadpool_executor_for_dask
        --deselect tests/test_1321_pandas_changed_api_again.py::test
        # disable tests that fail due to missing data files
        --deselect tests/test_0013_rntuple_anchor.py::test
        --deselect tests/test_0630_rntuple_basics.py::test_flat
        --deselect tests/test_0630_rntuple_basics.py::test_jagged
        --deselect tests/test_0662_rntuple_stl_containers.py::test_rntuple_stl_containers
        --deselect tests/test_0962_rntuple_update.py::test_new_support_RNTuple_split_int32_reading
        --deselect tests/test_0962_rntuple_update.py::test_new_support_RNTuple_bit_bool_reading
        --deselect tests/test_0962_rntuple_update.py::test_new_support_RNTuple_split_int16_reading
        --deselect tests/test_1191_rntuple_fixes.py::test_schema_extension
        --deselect tests/test_1191_rntuple_fixes.py::test_rntuple_cardinality 
        --deselect tests/test_1191_rntuple_fixes.py::test_multiple_page_delta_encoding
        --deselect tests/test_1191_rntuple_fixes.py::test_split_encoding
        --deselect tests/test_1221_AwkwardForth_bug.py::test
        --deselect tests/test_1223_more_rntuple_types.py::test_atomic
        --deselect tests/test_1223_more_rntuple_types.py::test_bitset
        --deselect tests/test_1223_more_rntuple_types.py::test_empty_struct
        --deselect tests/test_1223_more_rntuple_types.py::test_invalid_variant
        --deselect tests/test_1250_rntuple_improvements.py::test_field_class
        --deselect tests/test_1250_rntuple_improvements.py::test_array_methods
        --deselect tests/test_1250_rntuple_improvements.py::test_iterate
        --deselect tests/test_1275_fix_TStreamerLoop_code_generation.py::test_ttime_custom
        --deselect tests/test_1285_rntuple_multicluster_concatenation.py::test_schema_extension
        # disable failing test - SystemError: <built-in function BranchPyz> returned a result with an exception set
        --deselect tests/test_0840_support_tleafG.py::test_support_leafG
    )

    cd "${_pkgname}5-${pkgver}"
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    test-env/bin/python -m pytest "${pytest_options[@]}"
}

package_python-uproot() {
    optdepends+=('python-uproot-docs: docs')
    cd "${_pkgname}5-${pkgver}"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python-uproot-docs() {
    cd "${_pkgname}5-${pkgver}"

    install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D README.md "${pkgdir}/usr/share/${pkgbase}/README.md"

    install -d "${pkgdir}/usr/share/doc/${pkgbase}"
    python -m installer --destdir=tmp_install dist/*.whl
    PYTHONPATH="${PWD}"/tmp_install/`python -c "import site; print(site.getsitepackages()[0])"` sphinx-build "${PWD}/docs-sphinx" "${pkgdir}/usr/share/doc/${pkgbase}"
}
