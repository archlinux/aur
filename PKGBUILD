# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-reproject
pkgname=('python-reproject' 'python-reproject-doc')
pkgver=0.4
pkgrel=3
pkgdesc="Python-based Astronomical image reprojection"
arch=('i686' 'x86_64')
url="http://reproject.readthedocs.io/en/stable/"
license=('BSD')
makedepends=('cython' 'python-astropy>=2.0' 'python-astropy-helpers' 'python-astropy-healpix>=0.2' 'python-sphinx')
checkdepends=('python-matplotlib' 'python-shapely' 'python-pytest-astropy')
source=("https://files.pythonhosted.org/packages/source/r/reproject/reproject-${pkgver}.tar.gz")
md5sums=('56777bf5c2f8e2a7c0a05b3d058943c2')

prepare() {
    cd ${srcdir}/reproject-${pkgver}
    sed -i -e '/auto_use/s/True/False/' setup.cfg
}

build () {
    cd ${srcdir}/reproject-${pkgver}
    python setup.py build --use-system-libraries --offline

    msg "Building Docs"
    python setup.py build_docs
}

check(){
    cd $srcdir/reproject-${pkgver}

    python setup.py test
}

package_python-reproject() {
    depends=('python>=3.5' 'python-numpy>=1.10' 'python-scipy>=0.9' 'python-astropy>=2.0' 'python-astropy-healpix>=0.2')
    optdepends=('python-reproject-doc: Documentation for Reproject')
    cd ${srcdir}/reproject-${pkgver}

    install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python-reproject-doc() {
    pkgdesc="Documentation for Python Reproject module"
    cd ${srcdir}/reproject-${pkgver}/build/sphinx

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
