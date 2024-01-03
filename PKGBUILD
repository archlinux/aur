# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-pydl
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=1.0.0
pkgrel=1
pkgdesc="Library of IDL astronomy routines converted to Python"
arch=('any')
url="http://pydl.readthedocs.io/"
license=('BSD')
makedepends=('python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-sphinx-astropy'
             'python-astropy'
             'python-scipy'
             'graphviz')
checkdepends=('python-pytest-doctestplus'
              'python-pytest-mock') # astropy scipy already in makedepends
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
#source=("https://files.pythonhosted.org/packages/73/87/397a0d22112f48b794b39613ee3bddd315e64a38b33f24898962c4def5e4/pydl-0.7.0.tar.gz")
md5sums=('8bf313aeb530669ab6ba364a38b020ab')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed" # -vv -ra --color=yes -o console_output_style=count
}

package_python-pydl() {
    depends=('python-astropy' 'python-scipy')
    optdepends=('python-matplotlib: all'
                'python-pytest-astropy: For testing'
                'python-pydl-doc: Documentation for PyDL')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.rst
    install -Dm644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-pydl-doc() {
    pkgdesc="Documentation for PyDL"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.rst
    install -dm755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
