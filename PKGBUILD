# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-astropy-healpix
pkgname=('python-astropy-healpix' 'python-astropy-healpix-doc')
pkgver=0.2.1
pkgrel=1
pkgdesc="BSD-licensed HEALPix for Astropy"
arch=('i686' 'x86_64')
url="http://astropy-healpix.readthedocs.io/en/latest/"
license=('BSD')
makedepends=('cython' 'python-astropy>=1.2' 'python-astropy-helpers' 'python-sphinx' 'python-matplotlib')
checkdepends=('python-pytest' 'python-healpy' 'python-hypothesis')
source=("https://files.pythonhosted.org/packages/source/a/astropy-healpix/astropy-healpix-${pkgver}.tar.gz")
md5sums=('6a3bb64cc5832c5d5e14edc22fccecd8')

prepare() {
    cd ${srcdir}/astropy-healpix-${pkgver}

    sed -i -e '/auto_use/s/True/False/' setup.cfg
}

build() {
    cd ${srcdir}/astropy-healpix-${pkgver}
    python setup.py build --use-system-libraries --offline

    msg "Building Docs"
    python setup.py build_docs
}

check(){
    cd ${srcdir}/astropy-healpix-${pkgver}

    python setup.py test
}

package_python-astropy-healpix() {
    depends=('python>=3.5' 'python-numpy>=1.10' 'python-astropy>=1.2')
    optdepends=('python-astropy-healpix-doc: Documentation for Astropy-HEALPix')
    cd ${srcdir}/astropy-healpix-${pkgver}

    install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python-astropy-healpix-doc() {
    pkgdesc="Documentation for AstroPy-HEALPix"
    cd ${srcdir}/astropy-healpix-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
