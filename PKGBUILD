# Maintainer: Konstantin Gizdov <arch at kge dot pw>

pkgbase=python-uproot
pkgname=(python-uproot python-uproot-docs)
_pkgname=uproot
pkgver=3.11.4
pkgrel=1
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
sha256sums=('5fa2992e70bacf43011a2edadefb609c6ffe481595cc6dee3a3fbf952308494e')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

check() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py pytest
}

package_python-uproot() {
    optdepends+=('python-uproot-docs: docs')
    cd "${srcdir}/${_pkgname}-${pkgver}"

    python setup.py install --root="${pkgdir}/" --optimize=1

    install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python-uproot-docs() {
    depends=('python-sphinx')
    cd "${srcdir}/${_pkgname}-${pkgver}"

    install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D README.rst "${pkgdir}/usr/share/${pkgname}/README.rst"

    install -d "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -r docs/* "${pkgdir}/usr/share/doc/${pkgbase}/"
}
