# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-mpl-animators
_pname=${pkgbase#python-}
_pyname=${_pname/-/_}
pkgname=("python-${_pname}" "python-${_pname}-doc")
pkgver=1.1.1
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
md5sums=('e8c91ff9547ce2f214c594291019fe57')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
}

package_python-mpl-animators() {
    depends=('python-matplotlib>=3.5.0')
    optdepends=('python-astropy>5.1.0: all, wcs'
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
