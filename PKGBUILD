# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-spectral-cube
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.6.0
pkgrel=1
pkgdesc="Library for reading and analyzing astrophysical spectral data cubes"
arch=('any')
url="http://spectral-cube.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools' 'python-sphinx-astropy' 'python-astropy' 'python-dask' 'python-toolz' 'python-radio_beam' 'python-casa-formats-io')
#checkdepends=('python-pytest-astropy-header' 'python-joblib' 'python-reproject' 'python-bottleneck')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('3bde90bb005a31a4e138ca84f30ec367')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   patch -Np1 -i "${srcdir}/fix_doc_version.patch"
    export _pyver=$(python -c 'import sys; print("%d.%d" % sys.version_info[:2])')
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

    msg "Building Docs"
    export _pyver=$(python -c 'import sys; print("%d.%d" % sys.version_info[:2])')
    ln -rs ${srcdir}/${_pyname}-${pkgver}/${_pyname/-/_}*egg-info \
        build/lib/${_pyname/-/_}-${pkgver}-py${_pyver}.egg-info
    cd ${srcdir}/${_pyname}-${pkgver}/docs
    PYTHONPATH="../build/lib" make html
}

#check() {  # Takes over 15 min
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    pytest #|| warning "Tests failed"
#}

package_python-spectral-cube() {
    depends=('python-numpy>=1.8' 'python-astropy>=4.0' 'python-radio_beam' 'python-joblib' 'python-dask' 'python-toolz' 'python-six' 'python-fsspec' 'python-zarr' 'python-casa-formats-io')
    optdepends=('python-scipy: Used for subcube creation'
                'python-bottleneck: Speeds up median and percentile operations on cubes with missing data'
                'python-regions>=0.3: Serialises/Deserialises DS9/CRTF region files and handles them. Used when extracting a subcube from region'
                'python-spectral-cube-doc: Documentation for spectral-cube')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-spectral-cube-doc() {
    pkgdesc="Documentation for Python Radio Beam module"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.rst
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
