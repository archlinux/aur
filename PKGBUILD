# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-sherpa
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=4.10.2
pkgrel=1
pkgdesc="Modeling and fitting package for scientific data analysis"
arch=('i686' 'x86_64')
url="http://cxc.cfa.harvard.edu/contrib/sherpa/"
license=('GPL')
makedepends=('python>=3.5' 'python-numpy' 'fftw' 'python-setuptools' 'python-sphinx>=1.3' 'python-sphinx-astropy' 'graphviz')
#'gcc-fortran')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'sherpa_local_fftw.patch')
md5sums=('2698c62776f0ce793ebc87df7f679065'
         'd1823cc7683442d92450fadff7aed362')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    patch -Np1 -i "${srcdir}/sherpa_local_fftw.patch"
}

build() {
#   unset LDFLAGS
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

    msg "Building Docs"
    python setup.py build_sphinx
}

package_python-sherpa() {
    depends=('python>=3.5' 'python-numpy' 'fftw')
    optdepends=('python-matplotlib: Graphical output'
                'python-astropy: Data I/O support'
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
    rm ${pkgdir}/usr/lib/python3.7/site-packages/sherpa-${pkgver}-py3.7.egg-info/SOURCES.txt
}

package_python-sherpa-doc() {
    pkgdesc="Documentation for Sherpa"
    cd ${srcdir}/${_pyname}-${pkgver}/build/sphinx

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
