
# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_pkgname=uproot
pkgbase="python-${_pkgname}"
pkgname=("${pkgbase}" "${pkgbase}-docs")
pkgver=5.3.3
pkgrel=2
pkgdesc="Minimalist CERN ROOT I/O in pure Python and Numpy"
arch=('any')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-sphinx' 'python-sphinx_rtd_theme' 'python-hatchling' 'python-hatch-vcs')
checkdepends=('python-pkgconfig' 'python-pandas' 'python-pytest' 'python-requests' 'python-dask' 'python-pytest-timeout'
              'python-matplotlib' 'python-hist' 'python-scikit-hep-testdata' 'python-xxhash' 'root' 'xrootd' 'python-rangehttpserver'
              'python-requests' 'python-aiohttp' 'python-cramjam')
depends=('python' 'python-awkward>=1.7.0' 'python-cachetools' 'python-lz4' 'python-numpy' 'python-zstandard')
optdepends=('xrootd: access remote files over XRootD'
            'python-pandas: fill Pandas DataFrames instead of Numpy arrays'
            'python-requests: access remote files through HTTP'
            'python-xxhash: handle lz4-compressed ROOT files')
url="https://github.com/scikit-hep/${_pkgname}5"
license=('BSD-3-Clause')

source=("${_pkgname}-${pkgver}::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('8729a5102f97a6800bd2105d9a78a1af4e31ed4c3fb22f20a90c10754cc29ee7')

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
