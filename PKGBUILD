# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python2-astropy-healpix
_pyname=${pkgbase#python2-}
pkgname=("python2-${_pyname}" "python2-${_pyname}-doc")
pkgver=0.4
pkgrel=2
pkgdesc="BSD-licensed HEALPix for Astropy"
arch=('i686' 'x86_64')
url="http://astropy-healpix.readthedocs.io/"
license=('BSD')
makedepends=('python2-setuptools' 'python2-astropy' 'python2-astropy-helpers' 'python2-sphinx' 'python2-matplotlib')
#checkdepends=('python2-pytest32'
#              'python2-healpy'
#              'python2-hypothesis')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "python2-${_pyname}.install"
        'fix_deprecation_warning.patch')
md5sums=('59174f71ae6ef8b8969b2cfce702231e'
         '68d099a7f241f405c488da6f09618890'
         '71e532a1fed7a57d4ccf0d3e41035dd8')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i -e '/auto_use/s/True/False/' setup.cfg
    patch -Np1 -i "${srcdir}/fix_deprecation_warning.patch"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python2 setup.py build --use-system-libraries --offline

    msg "Building Docs"
    python2 setup.py build_docs
}

#check() {
#    if [ -z $(pacman -Qsq python2-pytest-cov) ]; then
#        cd ${srcdir}/${_pyname}-${pkgver}
#        python2 setup.py test
#    fi
#}

package_python2-astropy-healpix() {
    depends=('python2>=2.7' 'python2-numpy>=1.10' 'python2-astropy>=1.2')
    optdepends=('python2-astropy-healpix-doc: Documentation for Astropy-HEALPix')
    install=python2-${_pyname}.install
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python2-astropy-healpix-doc() {
    pkgdesc="Documentation for AstroPy-HEALPix"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.md
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
