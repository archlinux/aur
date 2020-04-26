# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-baseband
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=3.1.1
pkgrel=1
pkgdesc="Package to read and write radio baseband data"
arch=('i686' 'x86_64')
url="https://baseband.readthedocs.io"
license=('GPL')
makedepends=('python-setuptools' 'python-astropy' 'python-astropy-helpers' 'python-sphinx-astropy' 'graphviz')
checkdepends=('python-pytest-astropy')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'https://raw.githubusercontent.com/mhvk/baseband/master/AUTHORS.rst')
md5sums=('f32fa4256e61a7f4ec503c994c8b5eec'
         'SKIP')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i -e '/auto_use/s/True/False/' setup.cfg
    ln -rsf ../AUTHORS.rst .
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

package_python-baseband() {
    depends=('python-numpy>=1.9' 'python-astropy>=2.0')
    optdepends=('python-baseband-doc: Documentation for Baseband')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python-baseband-doc() {
    pkgdesc="Documentation for Python Baseband"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
