# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-astropy-healpix
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.5
pkgrel=1
pkgdesc="BSD-licensed HEALPix for Astropy"
arch=('i686' 'x86_64')
url="http://astropy-healpix.readthedocs.io/"
license=('BSD')
makedepends=('python-setuptools' 'python-astropy' 'python-astropy-helpers' 'python-sphinx-astropy')
checkdepends=('python-pytest-astropy'
#             'python-healpy'
              'python-hypothesis')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'fix_deprecation_warning.patch')
md5sums=('8e474c70da122ff44cb4743176936391'
         '71e532a1fed7a57d4ccf0d3e41035dd8')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i -e '/auto_use/s/True/False/' setup.cfg
#   patch -Np1 -i "${srcdir}/fix_deprecation_warning.patch"
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

package_python-astropy-healpix() {
    depends=('python>=3.6' 'python-numpy>=1.11' 'python-astropy>=2.0')
    optdepends=('python-astropy-healpix-doc: Documentation for Astropy-HEALPix')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python-astropy-healpix-doc() {
    pkgdesc="Documentation for AstroPy-HEALPix"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.md
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
