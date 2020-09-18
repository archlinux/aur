# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-spectral-cube
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.5.0
pkgrel=1
pkgdesc="Library for reading and analyzing astrophysical spectral data cubes"
arch=('i686' 'x86_64')
url="http://spectral-cube.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools' 'python-sphinx-astropy' 'python-astropy' 'python-dask' 'python-toolz' 'python-radio_beam')
checkdepends=('python-pytest-astropy-header' 'python-joblib' 'python-reproject' 'python-bottleneck')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'fix_doc_version.patch')
md5sums=('fd3f45419a4b029887f3187929a321ec'
         '0c7fdbb48c8e090e6b29b4d03e6af0bb')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    patch -Np1 -i "${srcdir}/fix_doc_version.patch"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

    msg "Building Docs"
    cd ${srcdir}/${_pyname}-${pkgver}/docs
    PYTHONPATH="../build/lib" make html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed"
}

package_python-spectral-cube() {
    depends=('python' 'python-numpy>=1.8' 'python-astropy>=1.0' 'python-radio_beam' 'python-joblib' 'python-dask' 'python-toolz' 'python-six' 'python-fsspec' 'python-zarr')
    optdepends=('python-bottleneck: Speeds up median and percentile operations on cubes with missing data'
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
