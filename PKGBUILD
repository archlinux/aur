# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-specutils
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=1.0
pkgrel=1
pkgdesc="Astropy Affiliated package for 1D spectral operations"
arch=('i686' 'x86_64')
url="http://specutils.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools' 'python-astropy-helpers>=3.2.1' 'python-sphinx-astropy' 'python-gwcs>=0.12' 'graphviz')
checkdepends=('python-pytest-astropy')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/astropy/specutils/master/LICENSE.rst")
md5sums=('a323e9486654c83a317f8c002c2bb953'
         '4d0c18788977e008ba0897bd6aed4bf7')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i -e '/auto_use/s/True/False/' setup.cfg
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

package_python-specutils() {
    depends=('python>=3.5' 'python-gwcs>=0.12' 'python-asdf>=2.5')
    optdepends=('python-specutils-doc: Documentation for Specutils'
                'python-pytest-astropy: For testing')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE.rst"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python-specutils-doc() {
    pkgdesc="Documentation for Python Specutils module"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  "${srcdir}/LICENSE.rst"
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
