# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-spectral-cube
pkgname=('python-spectral-cube' 'python2-spectral-cube')
#'python-spectral-cube-doc')
pkgver=0.4.2
pkgrel=1
pkgdesc="Library for reading and analyzing astrophysical spectral data cubes"
arch=('i686' 'x86_64')
url="http://spectral-cube.readthedocs.io/en/latest/"
license=('BSD')
makedepends=('cython' 'cython2' 'python-astropy-helpers' 'python2-astropy-helpers')
#'python-radio_beam' 'python-sphinx' 'python-matplotlib')
checkdepends=('python-pytest-astropy' 'python2-pytest' 'python-radio_beam' 'python2-radio_beam')
source=("https://files.pythonhosted.org/packages/source/s/spectral-cube/spectral-cube-${pkgver}.tar.gz")
md5sums=('994261198e2a66dcc1a2593d28f595c4')

prepare() {
    cd ${srcdir}/spectral-cube-${pkgver}
    sed -i -e '/auto_use/s/True/False/' setup.cfg

    cp -a ${srcdir}/spectral-cube-${pkgver}{,-py2}
}

build () {
    msg "Building Python2"
    cd ${srcdir}/spectral-cube-${pkgver}-py2
    python2 setup.py build --use-system-libraries --offline

    msg "Building Python3"
    cd ${srcdir}/spectral-cube-${pkgver}
    python setup.py build --use-system-libraries --offline

#   msg "Building Docs"
#   python setup.py build_docs
}

check(){
    cd ${srcdir}/spectral-cube-${pkgver}
    python setup.py test

    cd ${srcdir}/spectral-cube-${pkgver}-py2
    python2 setup.py test
}

package_python2-spectral-cube() {
    depends=('python2>=2.7' 'python2-numpy>=1.8' 'python2-astropy>=1.0' 'python2-radio_beam')
    optdepends=('python2-bottleneck: Speeds up median and percentile operations on cubes with missing data')
               #'python-spectral-cube-doc: Documentation for Radio Beam')
    cd ${srcdir}/spectral-cube-${pkgver}-py2

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python-spectral-cube() {
    depends=('python' 'python-numpy>=1.8' 'python-astropy>=1.0' 'python-radio_beam')
    optdepends=('python-bottleneck: Speeds up median and percentile operations on cubes with missing data')
               #'python-spectral-cube-doc: Documentation for Radio Beam')
    cd ${srcdir}/spectral-cube-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

#package_python-spectral-cube-doc() {
#    pkgdesc="Documentation for Python Radio Beam module"
#    cd ${srcdir}/spectral-cube-${pkgver}/build/sphinx
#
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
