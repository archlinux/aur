# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-specutils
pkgname=('python-specutils' 'python-specutils-doc')
pkgver=0.4
pkgrel=1
pkgdesc="Astropy Affiliated package for 1D spectral operations"
arch=('i686' 'x86_64')
url="http://specutils.readthedocs.io/en/latest/"
license=('BSD')
makedepends=('cython' 'python-numpy' 'python-scipy' 'python-six' 'python-astropy' 'python-astropy-helpers' 'python-sphinx' 'python-matplotlib' 'python-gwcs')
checkdepends=('python-pytest-astropy')
source=("https://files.pythonhosted.org/packages/source/s/specutils/specutils-${pkgver}.tar.gz")
md5sums=('26d71907fd86b2d1257fc0d6ffc5d982')

prepare() {
    cd ${srcdir}/specutils-${pkgver}

    sed -i -e '/auto_use/s/True/False/' setup.cfg
}

build() {
    cd ${srcdir}/specutils-${pkgver}
    python setup.py build --use-system-libraries --offline

    msg "Building Docs"
    python setup.py build_docs
}

check() {
    cd ${srcdir}/specutils-${pkgver}
    python setup.py test
}

package_python-specutils() {
    depends=('python' 'python-astropy')
    optdepends=('python-specutils-doc: Documentation for Specutils')
    cd ${srcdir}/specutils-${pkgver}

#   install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}/"
#   install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" licenses/*
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python-specutils-doc() {
    pkgdesc="Documentation for Python Specutils module"
    cd ${srcdir}/specutils-${pkgver}/docs/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
