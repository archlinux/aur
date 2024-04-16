
# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_pkgname=uproot
pkgbase="python-${_pkgname}"
pkgname=("${pkgbase}" "${pkgbase}-docs")
pkgver=5.3.3
pkgrel=1
pkgdesc="Minimalist CERN ROOT I/O in pure Python and Numpy"
arch=('any')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-sphinx' 'python-sphinx_rtd_theme' 'python-hatchling' 'python-hatch-vcs')
checkdepends=('python-pkgconfig' 'python-pandas' 'python-pytest-runner' 'python-requests' 'python-dask' 'python-pytest-timeout'
              'python-matplotlib' 'python-hist' 'python-scikit-hep-testdata' 'python-xxhash' 'root' 'xrootd' 'python-rangehttpserver'
              'python-requests' 'python-aiohttp' 'python-cramjam')
depends=('python-awkward>=1.7.0' 'python-cachetools' 'python-lz4' 'python-numpy' 'python-zstandard')
optdepends=('xrootd: access remote files over XRootD'
            'python-pandas: fill Pandas DataFrames instead of Numpy arrays'
            'python-requests: access remote files through HTTP'
            'python-xxhash: handle lz4-compressed ROOT files')
url="https://github.com/scikit-hep/${_pkgname}5"
license=('BSD')

source=("${_pkgname}-${pkgver}::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('8729a5102f97a6800bd2105d9a78a1af4e31ed4c3fb22f20a90c10754cc29ee7')

prepare() {
    cd "${srcdir}/${_pkgname}5-${pkgver}"
    sed \
        -e 's/setuptools.extern.packaging.version.parse/packaging.version.parse/' \
        -e 's/import setuptools/import packaging/' \
        -i src/uproot/_util.py
}

build() {
    cd "${srcdir}/${_pkgname}5-${pkgver}"
    SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver \
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/${_pkgname}5-${pkgver}"
    find tests -type f -exec sed \
      -e 's@scikit-hep.org/uproot/examples@scikit-hep.org/uproot3/examples@g' \
      -e 's@scikit-hep.org:443/uproot/examples@scikit-hep.org:443/uproot3/examples@g' \
      -i {} \;
    # tests depend on some unpackaged deps
    # fsspec-xrootd
    # dask-awkward
    # awkward-pandas
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    test-env/bin/python -m pytest -v \
      --deselect tests/test_0302_pickle.py::test_pickle_roundtrip_xrootd \
      --deselect tests/test_0692_fsspec_reading.py::test_open_fsspec_xrootd_iterate_files \
      --deselect tests/test_0692_fsspec_reading.py::test_open_fsspec_xrootd_iterate_tree \
      --deselect tests/test_0912_fix_pandas_and_double_nested_vectors_issue_885.py::test_pandas_and_double_nested_vectors_issue_885 \
      --deselect tests/test_1120_check_decompression_executor_pass_for_dask.py::test_decompression_executor_for_dask \
      --deselect tests/test_1189_dask_failing_on_duplicate_keys.py::test_dask_duplicated_keys
}

package_python-uproot() {
    optdepends+=('python-uproot-docs: docs')
    cd "${srcdir}/${_pkgname}5-${pkgver}"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python-uproot-docs() {
    cd "${srcdir}/${_pkgname}5-${pkgver}"

    install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D README.md "${pkgdir}/usr/share/${pkgbase}/README.md"

    install -d "${pkgdir}/usr/share/doc/${pkgbase}"
    python -m installer --destdir=tmp_install dist/*.whl
    PYTHONPATH="${PWD}"/tmp_install/`python -c "import site; print(site.getsitepackages()[0])"` sphinx-build "${PWD}/docs-sphinx" "${pkgdir}/usr/share/doc/${pkgbase}"
}
