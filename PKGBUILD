# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-sphinx-notfound-page
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.8.3
pkgrel=1
pkgdesc="Sphinx extension to build a 404 page with absolute URLs"
arch=('any')
url="https://sphinx-notfound-page.readthedocs.io"
license=('MIT')
makedepends=('python-flit-core'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-sphinx-autoapi'
             'python-sphinx-tabs'
             'python-sphinx-prompt'
             'python-sphinxemoji'
             'python-sphinx_rtd_theme')
checkdepends=('python-nose')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('66050d39df38030247fb70920880a8db')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    mkdir -p dist/lib
    bsdtar -xpf dist/${_pyname//-/_}-${pkgver}-py2.py3-none-any.whl -C dist/lib
    cd ${srcdir}/${_pyname}-${pkgver}/docs
    PYTHONPATH="../dist/lib" make html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   PYTHONPATH="dist/lib" pytest #|| warning "Tests failed"
    nosetests
}

package_python-sphinx-notfound-page() {
    depends=('python-sphinx>=2')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-sphinx-notfound-page-doc() {
    pkgdesc="Documentation for sphinx-notfound-page"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
