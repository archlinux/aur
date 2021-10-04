# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-pydata-sphinx-theme
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=0.7.1
pkgrel=1
pkgdesc="Bootstrap-based Sphinx theme from the PyData community"
arch=('any')
url="https://pydata-sphinx-theme.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools')
#checkdepends=('python-sphinx' 'python-beautifulsoup4' 'python-docutils')
checkdepends=('python-pytest' 'python-sphinx' 'python-beautifulsoup4' 'python-pytest-regressions')
#'python-sphinx' 'python-sphinx-bootstrap-theme')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('89a4b5f28e2a150c4aa2e1f5f85d0b29')

prepare() {
    export _pyver=$(python -c 'import sys; print("%d.%d" % sys.version_info[:2])')
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

#   msg "Building Docs"
#   python setup.py build_sphinx
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    export _pyver=$(python -c 'import sys; print("%d.%d" % sys.version_info[:2])')
#   python setup.py test || warning "Tests failed"
    ln -rs ${srcdir}/${_pyname}-${pkgver}/${_pyname//-/_}*egg-info \
        build/lib/${_pyname//-/_}-${pkgver}-py${_pyver}.egg-info
    PYTHONPATH="build/lib" pytest
}

package_python-pydata-sphinx-theme() {
    depends=('python-sphinx' 'python-beautifulsoup4' 'python-docutils')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

#package_python-pydata-sphinx-theme-doc() {
#    pkgdesc="Documentation for PyData Sphinx Theme"
#    cd ${srcdir}/${_pyname}-${pkgver}/doc/_build
#
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
