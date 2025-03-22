# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-baseband
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=4.3.0
pkgrel=1
pkgdesc="Package to read and write radio baseband data"
arch=('any')
url="https://baseband.readthedocs.io"
license=('GPL-3.0-or-later')
makedepends=('python-setuptools-scm'
             'python-build'
             'python-installer'
             'python-sphinx-astropy'
             'python-astropy'
             'graphviz')  # wheel required by new setuptools
checkdepends=('python-pytest-astropy-header'
              'python-pytest-doctestplus')   # astropy already in makedepends
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('68225bdc37a539fd1cfad3d8fa18cc55')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count #
}

package_python-baseband() {
    depends=('python-astropy>=5.1')
    optdepends=('python-baseband-doc: Documentation for Baseband')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-baseband-doc() {
    pkgdesc="Documentation for Python Baseband"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
