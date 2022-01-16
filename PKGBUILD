# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-pydata-sphinx-theme
_pname=${pkgbase#python-}
_pyname=${_pname//-/_}
pkgname=("python-${_pname}")
#"python-${_pname}-doc")
pkgver=0.8.0
pkgrel=1
pkgdesc="Bootstrap-based Sphinx theme from the PyData community"
arch=('any')
url="https://pydata-sphinx-theme.readthedocs.io"
license=('BSD')
makedepends=('python-dephell')
#'python-sphinx' 'python-beautifulsoup4' 'python-jupyter_sphinx' 'python-myst-parser' 'python-numpydoc' 'python-sphinxext-rediraffe' 'python-sphinx-sitemap')
checkdepends=('python-pytest-regressions' 'python-sphinx' 'python-beautifulsoup4')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('a4ef9f5f9f0b6e05945f186be9b85d94')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    dephell deps convert --from pyproject.toml --to setup.py
    sed -i "s/docs.demo.test_py_module/${_pyname}/" setup.py
    export _pyver=$(python -c 'import sys; print("%d.%d" % sys.version_info[:2])')
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

#   msg "Building Docs"
#   PYTHONPATH="build/lib" python setup.py build_sphinx
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    #python setup.py egg_info
    #export _pyver=$(python -c 'import sys; print("%d.%d" % sys.version_info[:2])')
    #ln -rs ${srcdir}/${_pyname}-${pkgver}/src/${_pyname//-/_}*egg-info \
    #    build/lib/${_pyname//-/_}-${pkgver}-py${_pyver}.egg-info
    PYTHONPATH="build/lib" pytest || warning "Tests failed"
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
