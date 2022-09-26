# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-pydata-sphinx-theme
_pname=${pkgbase#python-}
_pyname=${_pname//-/_}
pkgname=("python-${_pname}" "python-${_pname}-doc")
pkgver=0.8.0
pkgrel=2
pkgdesc="Bootstrap-based Sphinx theme from the PyData community"
arch=('any')
url="https://pydata-sphinx-theme.readthedocs.io"
license=('BSD')
makedepends=('python-sphinx-theme-builder'
             'python-flit-core'
             'python-build'
             'python-installer'
             'nodejs-lts-gallium'
             'npm'
             'python-beautifulsoup4'
             'python-jupyter-sphinx'
             'python-myst-parser'
             'python-numpydoc'
             'python-sphinxext-rediraffe'
             'python-sphinx-sitemap'
             'python-pandas'
             'python-plotly'
             'python-tenacity'
             'python-xarray')
checkdepends=('python-pytest-regressions')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'Makefile')
md5sums=('a4ef9f5f9f0b6e05945f186be9b85d94'
         'a6aa4bc42b138d75f938065a0994c3e1')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    ln -s ${srcdir}/Makefile docs
    mkdir bin
    ln -s /usr/bin/node bin/nodejs
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    PATH="${PWD}/bin:${PATH}" python -m build --wheel --no-isolation

    msg "Building Docs"
    mkdir dist/lib
    bsdtar -xpf dist/${_pyname}-${pkgver}-py3-none-any.whl -C dist/lib
    cd ${srcdir}/${_pyname}-${pkgver}/docs
    PYTHONPATH="../dist/lib" make html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    PYTHONPATH="dist/lib" pytest || warning "Tests failed"
}

package_python-pydata-sphinx-theme() {
    depends=('python-sphinx' 'python-beautifulsoup4' 'python-docutils')
    optdepends=('python-pandas')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-pydata-sphinx-theme-doc() {
    pkgdesc="Documentation for PyData Sphinx Theme"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
