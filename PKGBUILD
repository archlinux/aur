# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-sherpa
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=4.14.0
pkgrel=1
pkgdesc="Modeling and fitting package for scientific data analysis"
arch=('i686' 'x86_64')
url="http://cxc.cfa.harvard.edu/contrib/sherpa/"
license=('GPL')
makedepends=('python-numpy' 'fftw' 'python-setuptools' 'python-sphinx_rtd_theme' 'python-sphinx-astropy' 'graphviz' 'python-nbsphinx>=0.8.6' 'pandoc')
#'gcc-fortran')
checkdepends=('python-pytest-xvfb')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'sherpa_local_fftw.patch')
md5sums=('05674dfa5a616a34acac02c4d336f0c1'
         'd1823cc7683442d92450fadff7aed362')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    patch -Np1 -i "${srcdir}/sherpa_local_fftw.patch"
    sed -e '/'\'nbsphinx\''/a \    '\'IPython\.sphinxext\.ipython_console_highlighting\','' \
        -e '/'\'nbsphinx\''/s/$/,/' -i docs/conf.py
    export _pyver=$(python -c 'import sys; print("%d.%d" % sys.version_info[:2])')
}

build() {
#   unset LDFLAGS
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

    msg "Building Docs"
    python setup.py build_sphinx
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest "build/lib.linux-${CARCH}-${_pyver}" || warning "Tests failed"
}

package_python-sherpa() {
    depends=('python>=3.7' 'python-numpy>=1.17.0' 'fftw')
    optdepends=('python-matplotlib: Graphical output'
                'python-astropy>=3.2.1: Data I/O support'
                'ds9: Imaging requires'
                'xpa: Imaging requires'
                'python-pytest>=3.3: For testing suite'
                'python-mock: For testing suite'
                'python-pytest-xvfb: For testing suite'
                'python-sherpa-doc: Documentation for Sherpa')
    install=python-sherpa.install
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 {README.md,CITATION} -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -D -m644 notebooks/SherpaQuickStart.ipynb -t "${pkgdir}/usr/share/doc/${pkgname}/notebooks"
    install -D -m644 COPYRIGHT -t "${pkgdir}/usr/share/licenses/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    rm ${pkgdir}/usr/lib/python${_pyver}/site-packages/sherpa-${pkgver}-py${_pyver}.egg-info/SOURCES.txt
}

package_python-sherpa-doc() {
    pkgdesc="Documentation for Sherpa"
    cd ${srcdir}/${_pyname}-${pkgver}/build/sphinx

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
