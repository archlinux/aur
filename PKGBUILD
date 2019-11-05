# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-reproject
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.6
pkgrel=1
pkgdesc="Python-based Astronomical image reprojection"
arch=('i686' 'x86_64')
url="http://reproject.readthedocs.io/en/stable/"
license=('BSD')
makedepends=('cython' 'python-astropy>=3.2' 'python-astropy-helpers' 'python-astropy-healpix>=0.2' 'python-sphinx-astropy' 'python-pyvo' 'python-mimeparse')
checkdepends=('python-shapely' 'python-pytest-astropy')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('e0280e7627eb26dc0dcd62c145a15f18')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i -e '/auto_use/s/True/False/' setup.cfg
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build --use-system-libraries --offline

    msg "Building Docs"
    python setup.py build_docs
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py test
}

package_python-reproject() {
    depends=('python>=3.5' 'python-numpy>=1.13' 'python-scipy>=0.9' 'python-astropy>=3.2' 'python-astropy-healpix>=0.2')
    optdepends=('python-shapely>=1.6: For some of the mosaicking functionality'
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

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.md
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
