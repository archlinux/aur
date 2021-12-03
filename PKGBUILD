# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_pkgname=uproot
pkgbase="python-${_pkgname}"
pkgname=("${pkgbase}" "${pkgbase}-docs")
pkgver=3.14.4
pkgrel=2
pkgdesc="Minimalist CERN ROOT I/O in pure Python and Numpy"
arch=('any')
makedepends=('python-setuptools')
checkdepends=('python-mock' 'python-pkgconfig' 'python-pandas' 'python-pytest-runner' 'python-requests' 'python-xxhash')
depends=('python-awkward' 'python-cachetools' 'python-lz4' 'python-numpy' 'python-uproot-methods' 'python-zstandard')
optdepends=('xrootd: access remote files over XRootD'
            'python-pandas: fill Pandas DataFrames instead of Numpy arrays'
            'python-requests: access remote files through HTTP'
            'python-xxhash: handle lz4-compressed ROOT files')
url="https://github.com/scikit-hep/${_pkgname}"
license=('BSD')

source=("${_pkgname}-${pkgver}::${url}/archive/${pkgver}.tar.gz")
sha256sums=('3f1666115704bf1caaf19f55a39f6e7b6dd51077f4d3bdbf9c473cab6928094d')

get_pyver () {
    python -c 'import sys; print(str(sys.version_info[0]) + "." + str(sys.version_info[1]))'
}

build() {
    cd "${srcdir}/${_pkgname}3-${pkgver}"
    python setup.py build
}

check() {
    cd "${srcdir}/${_pkgname}3-${pkgver}"
    python setup.py pytest
}

package_python-uproot() {
    optdepends+=("${pkgbase}-docs: docs")
    cd "${srcdir}/${_pkgname}3-${pkgver}"

    python setup.py install --root="${pkgdir}/" --optimize=1

    install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    ln -s "/usr/lib/python$(get_pyver)/site-packages/uproot3" "${pkgdir}/usr/lib/python$(get_pyver)/site-packages/uproot"
}

package_python-uproot-docs() {
    depends=('python-sphinx')
    cd "${srcdir}/${_pkgname}3-${pkgver}"

    install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D README.rst "${pkgdir}/usr/share/${pkgname}/README.rst"

    install -d "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -r docs/* "${pkgdir}/usr/share/doc/${pkgbase}/"
}
