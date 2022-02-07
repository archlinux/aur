# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_pkgname=uproot
pkgbase="python-${_pkgname}"
pkgname=("${pkgbase}" "${pkgbase}-docs")
pkgver=4.1.9
pkgrel=1
pkgdesc="Minimalist CERN ROOT I/O in pure Python and Numpy"
arch=('any')
makedepends=('python-setuptools')
checkdepends=('python-mock' 'python-pkgconfig' 'python-pandas' 'python-pytest-runner' 'python-requests' 'python-xxhash' 'root')
depends=('python-awkward>=1.7.0' 'python-cachetools' 'python-lz4' 'python-numpy' 'python-zstandard')
optdepends=('xrootd: access remote files over XRootD'
            'python-pandas: fill Pandas DataFrames instead of Numpy arrays'
            'python-requests: access remote files through HTTP'
            'python-xxhash: handle lz4-compressed ROOT files')
url="https://github.com/scikit-hep/${_pkgname}4"
license=('BSD')

source=("${_pkgname}-${pkgver}::${url}/archive/${pkgver}.tar.gz")
sha256sums=('a6401ec6d555bb010b77490c07417e56b84f76cf506f5a8e9fe9f319bba7ab90')

build() {
    cd "${srcdir}/${_pkgname}4-${pkgver}"
    python setup.py build
}

check() {
    cd "${srcdir}/${_pkgname}4-${pkgver}"
    find tests -type f -exec sed \
      -e 's@scikit-hep.org/uproot/examples@scikit-hep.org/uproot3/examples@g' \
      -e 's@scikit-hep.org:443/uproot/examples@scikit-hep.org:443/uproot3/examples@g' \
      -i {} \;
    # tests depend on some unpackaged deps
    # python setup.py pytest
}

package_python-uproot() {
    optdepends+=('python-uproot-docs: docs')
    cd "${srcdir}/${_pkgname}4-${pkgver}"

    python setup.py install --root="${pkgdir}/" --optimize=1

    install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python-uproot-docs() {
    depends=('python-sphinx')
    cd "${srcdir}/${_pkgname}4-${pkgver}"

    install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D README.md "${pkgdir}/usr/share/${pkgname}/README.md"

    install -d "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -r docs-img docs-sphinx "${pkgdir}/usr/share/doc/${pkgbase}/"
}
