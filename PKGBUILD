# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-photutils
pkgname=('python-photutils' 'python-photutils-doc')
pkgver=0.6
pkgrel=1
pkgdesc="Astropy Affiliated package for image photometry utilities"
arch=('i686' 'x86_64')
url="http://photutils.readthedocs.io/en/latest/"
license=('BSD')
makedepends=('cython'
             'python-astropy'
             'python-astropy-helpers'
             'python-scikit-learn'
             'python-scikit-image'
             'python-sphinx-astropy')
checkdepends=('python-pytest-astropy')
source=("https://files.pythonhosted.org/packages/source/p/photutils/photutils-${pkgver}.tar.gz")
md5sums=('2898c758e5075d47b60e886303dd28fd')

prepare() {
    cd ${srcdir}/photutils-${pkgver}

    sed -i -e '/auto_use/s/True/False/' setup.cfg
}

build() {
    cd ${srcdir}/photutils-${pkgver}
    python setup.py build --use-system-libraries --offline

    msg "Building Docs"
    python setup.py build_docs
}

check() {
    cd ${srcdir}/photutils-${pkgver}
    python setup.py test
}

package_python-photutils() {
    depends=('python>=3.5' 'python-numpy>=1.11' 'python-astropy>=2.0' 'python-six')
    optdepends=('python-scipy>=0.16: For full functionality'
                'python-scikit-image>=0.11: For full functionality'
                'python-scikit-learn>=0.18: For full functionality'
                'python-matplotlib>=1.3: For full functionality'
                'python-photutils-doc: Documentation for python-photutils'
                'python-pytest-astropy: For testing')
    cd ${srcdir}/photutils-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python-photutils-doc() {
    pkgdesc="Documentation for Python Photutils module"
    cd ${srcdir}/photutils-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
