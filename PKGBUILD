# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-spectral-cube
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python2-${_pyname}" "python-${_pyname}-doc")
pkgver=0.4.4
pkgrel=1
pkgdesc="Library for reading and analyzing astrophysical spectral data cubes"
arch=('i686' 'x86_64')
url="http://spectral-cube.readthedocs.io/"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools' 'python-astropy-helpers>=3.1' 'python2-astropy-helpers' 'python-radio_beam' 'python-sphinx-astropy')
checkdepends=('python-pytest-astropy' 'python-bottleneck')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('ba7a7a29b0ecb45d949ab3bbab60f3fe')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}
    sed -i -e '/auto_use/s/True/False/' setup.cfg

    cp -a ${srcdir}/${_pyname}-${pkgver}{,-py2}
}

build() {
    msg "Building Python2"
    cd ${srcdir}/${_pyname}-${pkgver}-py2
    python2 setup.py build --use-system-libraries --offline

    msg "Building Python3"
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build --use-system-libraries --offline

    msg "Building Docs"
    python setup.py build_docs
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py test

#   cd ${srcdir}/${_pyname}-${pkgver}-py2
#   python2 setup.py test
}

package_python2-spectral-cube() {
    depends=('python2>=2.7' 'python2-numpy>=1.8' 'python2-astropy>=1.0' 'python2-radio_beam')
    optdepends=('python2-bottleneck: Speeds up median and percentile operations on cubes with missing data'
                'python-spectral-cube-doc: Documentation for Radio Beam'
                'python-pytest-astropy: For testing')
    cd ${srcdir}/${_pyname}-${pkgver}-py2

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python-spectral-cube() {
    depends=('python' 'python-numpy>=1.8' 'python-astropy>=1.0' 'python-radio_beam')
    optdepends=('python-bottleneck: Speeds up median and percentile operations on cubes with missing data'
                'python-spectral-cube-doc: Documentation for Radio Beam')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python-spectral-cube-doc() {
    pkgdesc="Documentation for Python Radio Beam module"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
