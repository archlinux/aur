# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_pkgname=uproot
pkgbase="python-${_pkgname}"
pkgname=("${pkgbase}" "${pkgbase}-docs")
pkgver=5.6.4
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
    # dependencies of python-uproot
    python-awkward
    python-cramjam
    python-fsspec
    python-numpy
    python-xxhash
)
checkdepends=(
    python-aiohttp
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
    root
    xrootd
)
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('59eb1be67b79ae9a9b198332dc550615a25778b0e3c6cec8c2a3b01b582da873')

build() {
    cd ${_pkgname}5-$pkgver
    SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver \
    python -m build --wheel --no-isolation

    # build the docs
    install -dm 755 "$srcdir"/$pkgbase-docs/usr/share/doc/$pkgbase
    python -m installer --destdir=tmp_install dist/*.whl
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    PYTHONPATH="$PWD/tmp_install/$site_packages" sphinx-build "$PWD/docs-sphinx" "$srcdir"/$pkgbase-docs/usr/share/doc/$pkgbase
}

check() {
    local pytest_options=(
        -vv
        -m 'not network and not slow and not distributed'
        # disable tests depending on unpackaged deps: dask-awkward, awkward-pandas
        --deselect tests/test_0912_fix_pandas_and_double_nested_vectors_issue_885.py::test_pandas_and_double_nested_vectors_issue_885
        --deselect tests/test_1120_check_decompression_executor_pass_for_dask.py::test_decompression_executor_for_dask
        --deselect tests/test_1189_dask_failing_on_duplicate_keys.py::test_dask_duplicated_keys
        --deselect tests/test_1254_test_threadpool_executor_for_dask.py::test_decompression_threadpool_executor_for_dask
        --deselect tests/test_1321_pandas_changed_api_again.py::test
        --deselect tests/test_1412_rntuple_dask.py::test_dask
        # disable tests that fail due to fsspec issues
        --deselect tests/test_0692_fsspec_writing.py
    )

    cd ${_pkgname}5-$pkgver
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    test-env/bin/python -m pytest "${pytest_options[@]}"
}

package_python-uproot() {
    depends=(
        python
        python-awkward
        python-cramjam
        python-fsspec
        python-numpy
        python-xxhash
    )
    optdepends=(
        'root: PyROOT interoperability'
        'xrootd: access remote files over XRootD'
        'python-pandas: fill Pandas DataFrames instead of Numpy arrays'
        'python-requests: access remote files through HTTP'
        'python-uproot-docs: docs'
    )
    cd ${_pkgname}5-$pkgver

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_python-uproot-docs() {
    pkgdesc+=" - documentation"

    mv -v $pkgname/* "$pkgdir"
    install -vDm 644 ${_pkgname}5-$pkgver/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -vDm 644 ${_pkgname}5-$pkgver/README.md -t "$pkgdir/usr/share/$pkgbase/"
}
