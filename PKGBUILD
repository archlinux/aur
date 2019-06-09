# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python2-corner
pkgname=('python2-corner' 'python-corner-doc')
pkgver=2.0.0
pkgrel=1
pkgdesc="Make some beautiful corner plots of samples"
arch=('any')
url="http://corner.readthedocs.io/en/latest/"
license=('BSD')
makedepends=('python2-setuptools' 'python2-matplotlib' 'python2-sphinx' 'python2-sphinx_rtd_theme')
checkdepends=('python2-pytest' 'python2-pandas' 'python2-nose')
source=("https://github.com/dfm/corner.py/archive/v${pkgver}.tar.gz"
        'corner-doc.patch')
md5sums=('249abecbc22e73549b46946b0219791f'
         '46fb1c445af9d46fa1481054f5178c03')

prepare() {
    cd ${srcdir}/corner.py-${pkgver}

    patch -Np1 -i "${srcdir}/corner-doc.patch"
}

build () {
    cd ${srcdir}/corner.py-${pkgver}
    python2 setup.py build

    msg "Building Docs"
    cd ${srcdir}/corner.py-${pkgver}/docs
    make SPHINXBUILD=sphinx-build2 html
}

check(){
    cd ${srcdir}/corner.py-${pkgver}

    python2 setup.py test
}

package_python2-corner() {
    depends=('python2' 'python2-matplotlib')
    optdepends=('python-corner-doc: Documentation for corner.py')
    cd ${srcdir}/corner.py-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-corner-doc() {
    pkgdesc="Documentation for corner.py"
    cd ${srcdir}/corner.py-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/python-corner"
    cp -a html "${pkgdir}/usr/share/doc/python-corner"
}
