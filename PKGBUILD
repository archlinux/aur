# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_pkgname=uproot
pkgbase="python-${_pkgname}"
pkgname=("${pkgbase}" "${pkgbase}-docs")
pkgver=4.3.5
pkgrel=4
pkgdesc="Minimalist CERN ROOT I/O in pure Python and Numpy"
arch=('any')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-sphinx' 'python-sphinx_rtd_theme')
checkdepends=('python-pkgconfig' 'python-pandas' 'python-pytest-runner' 'python-requests' 'python-dask'
              'python-matplotlib' 'python-hist' 'python-scikit-hep-testdata' 'python-xxhash' 'root' 'xrootd')
depends=('python-awkward>=1.7.0' 'python-cachetools' 'python-lz4' 'python-numpy' 'python-zstandard')
optdepends=('xrootd: access remote files over XRootD'
            'python-pandas: fill Pandas DataFrames instead of Numpy arrays'
            'python-requests: access remote files through HTTP'
            'python-xxhash: handle lz4-compressed ROOT files')
url="https://github.com/scikit-hep/${_pkgname}5"
license=('BSD')

source=("${_pkgname}-${pkgver}::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('06c744ef4fbd8c8cfd93ffb1d94d484513ece668fa4570bd80b521a7f6ba9bce')

prepare() {
    cd "${srcdir}/${_pkgname}5-${pkgver}"
    sed \
        -e 's/setuptools.extern.packaging.version.parse/packaging.version.parse/' \
        -e 's/import setuptools/import packaging/' \
        -i src/uproot/_util.py
}

build() {
    cd "${srcdir}/${_pkgname}5-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/${_pkgname}5-${pkgver}"
    find tests -type f -exec sed \
      -e 's@scikit-hep.org/uproot/examples@scikit-hep.org/uproot3/examples@g' \
      -e 's@scikit-hep.org:443/uproot/examples@scikit-hep.org:443/uproot3/examples@g' \
      -i {} \;
    # tests depend on some unpackaged deps
    PYTHONPATH="${PWD}/build/lib" pytest
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
    PYTHONPATH="${PWD}/build/lib" sphinx-build "${PWD}/docs-sphinx" "${pkgdir}/usr/share/doc/${pkgbase}"
}
