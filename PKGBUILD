# Maintainer: Konstantin Gizdov <arch at kge dot pw>

pkgbase=python-uproot
pkgname=(python-uproot python-uproot-docs)
_pkgname=uproot
pkgver=3.12.0
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
sha256sums=('70e0885c1d30fa49525ab4140ece52aa27f74e86fbb2f189052ff17b802b45b9')

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
