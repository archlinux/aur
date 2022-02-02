# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-mpl-animators
_pname=${pkgbase#python-}
_pyname=${_pname/-/_}
pkgname=("python-${_pname}" "python-${_pname}-doc")
pkgver=1.0.1
pkgrel=1
pkgdesc="An interative animation framework for matplotlib"
arch=('any')
url="https://sunpy.org"
license=('BSD')
makedepends=('python-setuptools-scm' 'python-sunpy-sphinx-theme' 'python-sphinx-automodapi' 'python-matplotlib' 'python-astropy' 'graphviz')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('3b2641fd0e00fa55c35687929dbd40bd')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

    msg "Building Docs"
    python setup.py build_sphinx
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed"
}

package_python-mpl-animators() {
    depends=('python-matplotlib>=3.2.0')
    optdepends=('python-astropy>=4.2.0: all, wcs'
                'python-mpl-animators-doc: Documentation for mpl-animators')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-mpl-animators-doc() {
    pkgdesc="Documentation for Python mpl-animators"
    cd ${srcdir}/${_pyname}-${pkgver}/build/sphinx

    install -D -m644 ../../LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
