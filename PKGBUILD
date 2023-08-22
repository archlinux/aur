# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-astropy-healpix
_pyname=astropy_healpix
_pname=${pkgbase#python-}
pkgname=("python-${_pname}" "python-${_pname}-doc")
pkgver=1.0.0
pkgrel=1
pkgdesc="BSD-licensed HEALPix for Astropy"
arch=('i686' 'x86_64')
url="http://astropy-healpix.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools-scm'
             'python-extension-helpers'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-numpy'
             'python-sphinx-astropy'
             'python-astropy')
checkdepends=('python-pytest-doctestplus'
              'python-pytest-astropy-header'
              'python-hypothesis'
              'python-healpy')  # astropy already in makedepends
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "https://lambda.gsfc.nasa.gov/data/map/dr3/skymaps/5yr//wmap_band_imap_r9_5yr_K_v3.fits"
        'fix_deprecation_warning.patch'
        'use_local_doc_fits.patch')
md5sums=('85081b219729aa87fe45c7ddf06ea2f0'
         'f183da2392e37b9b424e9866d7bca559'
         '71e532a1fed7a57d4ccf0d3e41035dd8'
         '6fc85696c0103b265309db0fa3339b33')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   sed -i -e "/oldest-supported-numpy/d" -e "/\"extension-helper/s/,/\]/" pyproject.toml
    sed -i "/\"numpy/s/==/>=/" pyproject.toml
    cp ${srcdir}/wmap_band_imap_r9_5yr_K_v3.fits docs
    patch -Np1 -i "${srcdir}/use_local_doc_fits.patch"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    PYTHONPATH="../build/lib.linux-${CARCH}-cpython-$(get_pyver)" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest "build/lib.linux-${CARCH}-cpython-$(get_pyver)" || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
}

package_python-astropy-healpix() {
    depends=('python>=3.9' 'python-numpy>=1.19' 'python-astropy>=3')
    optdepends=('python-astropy-healpix-doc: Documentation for Astropy-HEALPix')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-astropy-healpix-doc() {
    pkgdesc="Documentation for AstroPy-HEALPix"
    arch=('any')
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.md
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
