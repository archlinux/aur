# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-astropy-healpix
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python2-${_pyname}" "python-${_pyname}-doc")
pkgver=0.4
pkgrel=2
pkgdesc="BSD-licensed HEALPix for Astropy"
arch=('i686' 'x86_64')
url="http://astropy-healpix.readthedocs.io/"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools' 'python2-numpy' 'python-astropy' 'python-astropy-helpers>=3.1' 'python2-astropy-helpers' 'python-sphinx-astropy')
checkdepends=('python-pytest-astropy'
              'python2-pytest32'
              'python2-healpy'
              'python-healpy'
              'python2-hypothesis'
              'python-hypothesis')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'fix_deprecation_warning.patch')
md5sums=('59174f71ae6ef8b8969b2cfce702231e'
         '71e532a1fed7a57d4ccf0d3e41035dd8')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i -e '/auto_use/s/True/False/' setup.cfg
    patch -Np1 -i "${srcdir}/fix_deprecation_warning.patch"
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
    msg "Checking Python3"
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py test

    msg "Checking Python2"
    cd ${srcdir}/${_pyname}-${pkgver}-py2
    python2 setup.py test
}

package_python2-astropy-healpix() {
    depends=('python2>=2.7' 'python2-numpy>=1.10' 'python2-astropy>=1.2')
    optdepends=('python-astropy-healpix-doc: Documentation for Astropy-HEALPix')
    cd ${srcdir}/${_pyname}-${pkgver}-py2

    install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python-astropy-healpix() {
    depends=('python>=3.5' 'python-numpy>=1.10' 'python-astropy>=1.2')
    optdepends=('python-astropy-healpix-doc: Documentation for Astropy-HEALPix')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python-astropy-healpix-doc() {
    pkgdesc="Documentation for AstroPy-HEALPix"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
