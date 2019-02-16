# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-specviz
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.6.2
pkgrel=1
pkgdesc="An interactive astronomical 1D spectra analysis tool"
arch=('i686' 'x86_64')
url="https://specviz.readthedocs.io/"
license=('BSD')
makedepends=('python-setuptools' 'python-pytest' 'python-pyqtgraph' 'python-astropy>=3.1' 'python-astropy-helpers>=3.1' 'python-sphinx-astropy')
checkdepends=('python-qtawesome' 'python-click' 'python-asteval' 'python-specutils' 'python-pytest-qt' 'python-pytest-astropy')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('d34efce49dcc48b7401b1cd15a4afc77')

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

package_python-specviz() {
    depends=('python>=3.6'
             'python-astropy>=3.1'
             'python-pyqtgraph'
             'python-qtawesome'
             'python-specutils>=0.5.2'
             'python-pytest'
             'python-click'
             'python-asteval')
    optdepends=('python-specviz-doc: Documentation for SpecViz')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" licenses/*
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python-specviz-doc() {
    pkgdesc="Documentation for Python SpecViz module"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
