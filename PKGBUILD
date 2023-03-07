# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-mpl-animators
_pname=${pkgbase#python-}
_pyname=${_pname/-/_}
pkgname=("python-${_pname}" "python-${_pname}-doc")
pkgver=1.1.0
pkgrel=1
pkgdesc="An interative animation framework for matplotlib"
arch=('any')
url="https://sunpy.org"
license=('BSD')
makedepends=('python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-sunpy-sphinx-theme'
             'python-sphinx-automodapi'
             'python-matplotlib'
             'python-astropy'
             'graphviz')
checkdepends=('python-pytest-mpl')  # matplotlib, astropy already in makedepends
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('4fd4f023a2c2df86dec409de3519d17a')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed" # -vv --color=yes
}

package_python-mpl-animators() {
    depends=('python-matplotlib>=3.2.0')
    optdepends=('python-astropy>=4.2.0: all, wcs'
                'python-mpl-animators-doc: Documentation for mpl-animators')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-mpl-animators-doc() {
    pkgdesc="Documentation for Python mpl-animators"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 ../../LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
