# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-regions
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python2-${_pyname}" "python-${_pyname}-doc")
pkgver=0.3
pkgrel=1
pkgdesc="Astropy affilated package for region handling"
arch=('i686' 'x86_64')
url="http://astropy-regions.readthedocs.io/en/latest/"
license=('BSD')
makedepends=('cython' 'cython2' 'python-astropy>=1.3' 'python2-astropy>=1.3' 'python-astropy-helpers31' 'python2-astropy-helpers' 'python-sphinx-astropy' 'python-shapely')
#checkdepends=('python-pytest-astropy' 'python-astropy-healpix')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('b2f0b08cdaa2b40519de665f9af2a25a')

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

#check() {
##   msg "Checking Python3"
#    cd ${srcdir}/${_pyname}-${pkgver}
#    python setup.py test
#
##   msg "Checking Python2"
##   cd ${srcdir}/${_pyname}-${pkgver}-py2
##   python2 setup.py test
#}

package_python2-regions() {
    depends=('python2>=2.7' 'python2-numpy>=1.9' 'python2-astropy>=1.3')
    optdepends=('python2-matplotlib>=1.5: Plotting support'
                'python2-shapely: Managing geometric objects'
                'python-regions-doc: Documentation for AstroPy Regions'
                'python2-pytest<3.7: For testing')
    cd ${srcdir}/${_pyname}-${pkgver}

    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python-regions() {
    depends=('python>=3.4' 'python-numpy>=1.9' 'python-astropy>=1.3')
    optdepends=('python-matplotlib>=1.5: Plotting support'
                'python-shapely: Managing geometric objects'
                'python-regions-doc: Documentation for AstroPy Regions'
                'python-pytest-astropy: For testing'
                'python-astropy<3.2: For testing')
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python-regions-doc() {
    pkgdesc="Documentation for AstroPy Regions"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
