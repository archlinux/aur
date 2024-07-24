# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-mpl-animators
_pname=${pkgbase#python-}
_pyname=${_pname/-/_}
pkgname=("python-${_pname}" "python-${_pname}-doc")
pkgver=1.2.0
pkgrel=1
pkgdesc="An interative animation framework for matplotlib"
arch=('any')
url="https://sunpy.org"
license=('BSD-3-Clause')
makedepends=('python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-sphinx-automodapi'
             'python-sphinx-gallery'
             'python-sunpy-sphinx-theme'
             'python-matplotlib'
             'python-astropy'
             'python-sunpy'
             'python-scipy'
             'graphviz')
checkdepends=('python-pytest-doctestplus'
              'python-pytest-mpl')  # matplotlib, astropy already in makedepends
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('6a64eaec408fd228465ec9a4172e645d')

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
    depends=('python-matplotlib>=3.5.0' 'python-astropy>=5.6.0')
    optdepends=('python-mpl-animators-doc: Documentation for mpl-animators')
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
