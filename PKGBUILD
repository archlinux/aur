# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python2-reproject
_pyname=${pkgbase#python2-}
pkgname=("python2-${_pyname}" "python2-${_pyname}-doc")
pkgver=0.5.1
pkgrel=1
pkgdesc="Python-based Astronomical image reprojection"
arch=('i686' 'x86_64')
url="http://reproject.readthedocs.io/en/stable/"
license=('BSD')
makedepends=('cython2' 'python2-astropy>=2.0' 'python2-astropy-helpers' 'python2-astropy-healpix>=0.2' 'python2-sphinx')
#checkdepends=('python2-pytest<3.7')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('3de3fddddea39425e175d78fc62039a2')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i -e '/auto_use/s/True/False/' setup.cfg
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python2 setup.py build --use-system-libraries --offline

    msg "Building Docs"
    python2 setup.py build_docs
}

#check() {
#   cd ${srcdir}/${_pyname}-${pkgver}
#
#   python2 setup.py test
#}

package_python2-reproject() {
    depends=('python2>=2.7' 'python2-numpy>=1.13' 'python2-scipy>=0.9' 'python2-astropy>=2.0' 'python2-astropy-healpix>=0.2')
    optdepends=('python2-shapely: For some of the mosaicking functionality'
                'python-reproject-doc: Documentation for Reproject'
                'python2-pytest<3.7: For testing')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python2-reproject-doc() {
    pkgdesc="Documentation for Python Reproject module"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.md
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
