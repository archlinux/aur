# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-sherpa
pkgname=('python-sherpa' 'python-sherpa-doc')
pkgver=4.10.1
pkgrel=1
pkgdesc="Modeling and fitting package for scientific data analysis"
arch=('i686' 'x86_64')
url="http://cxc.cfa.harvard.edu/contrib/sherpa/"
license=('GPL')
makedepends=('python>=3.5' 'python-numpy' 'fftw' 'python-setuptools' 'gcc-fortran' 'python-sphinx>=1.3')
source=("https://files.pythonhosted.org/packages/source/s/sherpa/sherpa-${pkgver}.tar.gz"
        'sherpa_local_fftw.patch')
md5sums=('28137b797633670373e6d729c8d02501'
         'd1823cc7683442d92450fadff7aed362')

prepare() {
    cd ${srcdir}/sherpa-${pkgver}

    patch -Np1 -i "${srcdir}/sherpa_local_fftw.patch"
}

build() {
    unset LDFLAGS
    cd ${srcdir}/sherpa-${pkgver}
    python setup.py build

    msg "Building Docs"
    python setup.py build_sphinx
}

package_python-sherpa() {
    depends=('python>=3.5' 'python-numpy' 'fftw')
    optdepends=('python-matplotlib: Graphical output'
                'python-astropy: Data I/O support'
                'ds9-bin: Imaging requires'
                'xpa: Imaging requires'
                'python-pytest>=3.3: For testing suite'
                'python-mock: For testing suite'
                'python-pytest-xvfb: For testing suite'
                'python-sherpa-doc: Documentation for Sherpa')
    install=python-sherpa.install
    cd ${srcdir}/sherpa-${pkgver}

    install -D -m644 {README.md,CITATION} -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -D -m644 notebooks/SherpaQuickStart.ipynb -t "${pkgdir}/usr/share/doc/${pkgname}/notebooks"
    install -D -m644 COPYRIGHT -t "${pkgdir}/usr/share/licenses/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    rm ${pkgdir}/usr/lib/python3.7/site-packages/sherpa-${pkgver}-py3.7.egg-info/SOURCES.txt
}

package_python-sherpa-doc() {
    pkgdesc="Documentation for Sherpa"
    cd ${srcdir}/sherpa-${pkgver}/build/sphinx

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
