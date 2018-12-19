# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-ccdproc
pkgname=('python-ccdproc' 'python-ccdproc-doc')
pkgver=1.3.0.post1
pkgrel=2
pkgdesc="Affiliated package for the AstroPy package for basic data reductions of CCD images"
arch=('i686' 'x86_64')
url="http://ccdproc.readthedocs.io/en/latest/"
license=('BSD')
makedepends=('cython' 'python-astropy-helpers' 'python-scikit-image' 'python-astroscrappy' 'python-reproject' 'python-sphinx-astropy')
#checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/c/ccdproc/ccdproc-${pkgver}.tar.gz")
md5sums=('89a5795245a517fbb5ca740aa85625b6')

prepare() {
    cd ${srcdir}/ccdproc-${pkgver}
    sed -i -e '/auto_use/s/True/False/' setup.cfg
}

build() {
    cd ${srcdir}/ccdproc-${pkgver}
    python setup.py build --use-system-libraries --offline

    msg "Building Docs"
    python setup.py build_docs
}

#check() {
#    cd ${srcdir}/ccdproc-${pkgver}
#
#    python setup.py test
#}

package_python-ccdproc() {
    depends=('python' 'python-numpy' 'python-scipy' 'python-astropy>=1.0' 'python-scikit-image' 'python-astroscrappy' 'python-reproject')
    optdepends=('python-ccdproc-doc: Documentation for CCDPROC')
    cd ${srcdir}/ccdproc-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" licenses/*
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python-ccdproc-doc() {
    pkgdesc="Documentation for Python CCDPROC module"
    cd ${srcdir}/ccdproc-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
