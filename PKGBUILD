# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-ccdproc
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=2.4.0
pkgrel=1
pkgdesc="Affiliated package for the AstroPy package for basic data reductions of CCD images"
arch=('any')
url="http://ccdproc.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-sphinx-astropy'
             'python-astropy'
             'python-scipy'
#            'python-scikit-image'
#            'python-astroscrappy'
#            'python-reproject'
             'graphviz')
checkdepends=('python-pytest-astropy-header'
              'python-pytest-doctestplus'
              'python-astroscrappy'
              'python-scikit-image'
              'python-reproject'
              'python-memory-profiler') # psutil required by memory-profiler
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'fix-underline-length.patch')
md5sums=('aecb5216aa0f1c923effc1cadbef76ce'
         '714badd0bef757818fda5babe233d235')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    patch -Np1 -i "${srcdir}/fix-underline-length.patch"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    cd ${srcdir}/${_pyname}-${pkgver}/docs
    PYTHONPATH="../build/lib" make html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed" # -vv --color=yes
}

package_python-ccdproc() {
    depends=('python>=3.7' 'python-scipy' 'python-astropy>=4.3' 'python-scikit-image' 'python-astroscrappy>=1.0.8' 'python-reproject>=0.7')
    optdepends=('python-ccdproc-doc: Documentation for CCDPROC')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" licenses/*
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-ccdproc-doc() {
    pkgdesc="Documentation for Python CCDPROC module"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../licenses/*
    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.rst
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
