# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-reproject
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python2-${_pyname}" "python-${_pyname}-doc")
pkgver=0.4
pkgrel=3
pkgdesc="Python-based Astronomical image reprojection"
arch=('i686' 'x86_64')
url="http://reproject.readthedocs.io/en/stable/"
license=('BSD')
makedepends=('cython' 'cython2' 'python-astropy>=2.0' 'python2-astropy>=2.0' 'python-astropy-helpers>=3.1' 'python-astropy-helpers<3.2' 'python2-astropy-helpers' 'python-astropy-healpix>=0.2' 'python2-astropy-healpix>=0.2' 'python-sphinx-astropy')
checkdepends=('python-shapely' 'python-pytest-astropy')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('56777bf5c2f8e2a7c0a05b3d058943c2')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}
    sed -i -e '/[pytest]/s/pytest/tool:pytest/' setup.cfg
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
#   msg "Checking Python3"
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py test

#   msg "Checking Python2"
#   cd ${srcdir}/${_pyname}-${pkgver}-py2
#   python2 setup.py test
}

package_python2-reproject() {
    depends=('python2>=2.7' 'python2-numpy>=1.10' 'python2-scipy>=0.9' 'python2-astropy>=2.0' 'python2-astropy-healpix>=0.2')
    optdepends=('python2-shapely: For some of the mosaicking functionality'
                'python-reproject-doc: Documentation for Reproject'
                'python2-pytest<3.7: For testing')
    cd ${srcdir}/${_pyname}-${pkgver}-py2

    install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python-reproject() {
    depends=('python>=3.5' 'python-numpy>=1.10' 'python-scipy>=0.9' 'python-astropy>=2.0' 'python-astropy-healpix>=0.2')
    optdepends=('python-shapely: For some of the mosaicking functionality'
                'python-reproject-doc: Documentation for Reproject'
                'python-pytest-astropy: For testing')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python-reproject-doc() {
    pkgdesc="Documentation for Python Reproject module"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
