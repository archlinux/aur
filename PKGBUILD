# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=sncosmo
pkgname=python-${_pyname}-doc
pkgver=2.10.0
pkgrel=1
pkgdesc="Documentation for SNCosmo"
arch=('any')
url="https://sncosmo.readthedocs.io"
license=('BSD')
makedepends=("python-${_pyname}=${pkgver}"
             'python-numpydoc'
             'python-sphinx_rtd_theme'
             'python-sphinx-gallery'
             'python-iminuit'
             'graphviz')
source=("https://github.com/sncosmo/sncosmo/archive/v${pkgver}.tar.gz"
        "https://c3.lbl.gov/nugent/templates/sn1a_flux.v1.2.dat.gz"
        "https://c3.lbl.gov/nugent/templates/sn2p_flux.v1.2.dat.gz"
        'doc-use-local-data.patch')
md5sums=('088188d5e3c19f220eaa8b48a3ae5d2a'
         '86a80d4b02030abbeb9941131053082a'
         '121927c70484bf2f11298465210fc1a1'
         'f277218e6347977f675dada2ad5859ee')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    cp ${srcdir}/*flux.v1.2.dat docs/_examples
    patch -Np1 -i "${srcdir}/doc-use-local-data.patch"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs

    make html
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.rst
}
