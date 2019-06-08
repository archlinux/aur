# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-ccdproc
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=1.3.0.post1
pkgrel=2
pkgdesc="Affiliated package for the AstroPy package for basic data reductions of CCD images"
arch=('i686' 'x86_64')
url="http://ccdproc.readthedocs.io/en/latest/"
license=('BSD')
makedepends=('cython' 'python-astropy-helpers' 'python-scikit-image' 'python-astroscrappy' 'python-reproject' 'python-sphinx-astropy')
#checkdepends=('python-pytest-astropy')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('89a5795245a517fbb5ca740aa85625b6')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   sed -i -e '/[pytest]/s/pytest/tool:pytest/' setup.cfg
    sed -i -e '/auto_use/s/True/False/' setup.cfg
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build --use-system-libraries --offline

    msg "Building Docs"
    python setup.py build_docs
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    python setup.py test
#}

package_python-ccdproc() {
    depends=('python' 'python-numpy' 'python-scipy' 'python-astropy>=1.0' 'python-scikit-image' 'python-astroscrappy' 'python-reproject')
    optdepends=('python-ccdproc-doc: Documentation for CCDPROC')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" licenses/*
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python-ccdproc-doc() {
    pkgdesc="Documentation for Python CCDPROC module"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
