# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-astropy-healpix
_pyname=astropy_healpix
_pname=${pkgbase#python-}
pkgname=("python-${_pname}" "python-${_pname}-doc")
pkgver=0.6
pkgrel=1
pkgdesc="BSD-licensed HEALPix for Astropy"
arch=('i686' 'x86_64')
url="http://astropy-healpix.readthedocs.io/"
license=('BSD')
makedepends=('python-setuptools-scm' 'python-extension-helpers' 'python-numpy' 'python-sphinx-astropy' 'python-astropy')
checkdepends=('python-pytest-doctestplus' 'python-hypothesis')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "https://lambda.gsfc.nasa.gov/data/map/dr3/skymaps/5yr//wmap_band_imap_r9_5yr_K_v3.fits"
        'fix_deprecation_warning.patch'
        'use_local_doc_fits.patch')
md5sums=('95e4b5e7d57bd3756d2086516f68e9d5'
         'f183da2392e37b9b424e9866d7bca559'
         '71e532a1fed7a57d4ccf0d3e41035dd8'
         '65c75d9f8ada192e20aabf0064ac32bf')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    export _pyver=$(python -c 'import sys; print("%d.%d" % sys.version_info[:2])')
    cp ${srcdir}/wmap_band_imap_r9_5yr_K_v3.fits docs
    patch -Np1 -i "${srcdir}/use_local_doc_fits.patch"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

    msg "Building Docs"
    cd ${srcdir}/${_pyname}-${pkgver}/docs
    PYTHONPATH="../build/lib.linux-${CARCH}-${_pyver}" make html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest "build/lib.linux-${CARCH}-${_pyver}"
}

package_python-astropy-healpix() {
    depends=('python>=3.6' 'python-numpy>=1.11' 'python-astropy>=2.0')
    optdepends=('python-astropy-healpix-doc: Documentation for Astropy-HEALPix')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-astropy-healpix-doc() {
    pkgdesc="Documentation for AstroPy-HEALPix"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.md
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
