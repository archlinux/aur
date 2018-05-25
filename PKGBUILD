# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python2-sherpa
pkgver=4.10.0
pkgrel=1
pkgdesc="Modeling and fitting package for scientific data analysis"
arch=('i686' 'x86_64')
url="http://cxc.cfa.harvard.edu/contrib/sherpa/"
license=('GPL')
depends=('python2>=2.7' 'python2-numpy' 'fftw')
makedepends=('python2-setuptools' 'gcc-fortran')
optdepends=('python2-matplotlib: Graphical output'
            'python2-astropy: Data I/O support'
            'ds9-bin: Imaging requires'
            'xpa: Imaging requires'
            'python2-pytest>=3.3: For testing suite'
            'python2-mock: For testing suite'
            'python2-pytest-xvfb: For testing suite')
install=python2-sherpa.install
source=("https://files.pythonhosted.org/packages/source/s/sherpa/sherpa-${pkgver}.tar.gz"
        'sherpa_local_fftw.patch')
md5sums=('ac7f1d7e7ea835719a184a4dd3218743'
         'd1823cc7683442d92450fadff7aed362')

prepare() {
    cd ${srcdir}/sherpa-${pkgver}

    patch -Np1 -i "${srcdir}/sherpa_local_fftw.patch"
}

package() {
    unset LDFLAGS
    cd ${srcdir}/sherpa-${pkgver}

    install -D -m644 {docs/SherpaQuickStart.ipynb,README.md,CITATION} -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -D -m644 COPYRIGHT -t "${pkgdir}/usr/share/licenses/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    rm ${pkgdir}/usr/lib/python2.7/site-packages/sherpa-${pkgver}-py2.7.egg-info/SOURCES.txt

    mv ${pkgdir}/usr/bin/sherpa_smoke ${pkgdir}/usr/bin/sherpa_smoke2
    mv ${pkgdir}/usr/bin/sherpa_test ${pkgdir}/usr/bin/sherpa_test2
}
