# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-jupyter-cache
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=0.6.1
pkgrel=1
pkgdesc="A defined interface for working with a cache of jupyter notebooks"
arch=('any')
url="https://jupyter-cache.readthedocs.io"
license=('MIT')
makedepends=('python-flit-core'
             'python-build'
             'python-installer')
#            'python-sphinx-copybutton'
#            'python-sphinx-book-theme'
#            'python-myst-nb'
#            'python-myst-parser<0.19'
#            'python-jupytext'
#            'python-nbdime')   # myst-nb: circular dep
checkdepends=('python-pytest'
              'python-click'
              'python-importlib-metadata'
              'python-jupytext'
              'python-nbdime'
              'jupyter-nbclient'
              'jupyter-nbformat'
              'python-sqlalchemy'
              'python-tabulate'
              'python-yaml')
#source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
source=("https://github.com/executablebooks/jupyter-cache/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('18376504e5882af3b74801f55fe77546')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    mkdir -p dist/lib
    bsdtar -xpf dist/${_pyname/-/_}-${pkgver}-py3-none-any.whl -C dist/lib
    PYTHONPATH="dist/lib" pytest || warning "Tests failed" # -vv --color=yes
#       --deselect=tests/test_cache.py::test_execution_jupytext
}

package_python-jupyter-cache() {
    depends=('python-attrs' 'python-click' 'python-importlib-metadata' 'python-tabulate' 'python-yaml' 'jupyter-nbformat' 'jupyter-nbclient' 'python-sqlalchemy<3')
    optdepends=('python-click-log: cli'
                'python-jupytext: rtd'
                'python-myst-nb: rtd'
                'python-nbdime: rtd'
                'python-sphinx-book-theme: rtd'
                'python-sphinx-copybutton: rtd'
                'python-pre-commit: code_style')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-jupyter-cache-doc() {
#    pkgdesc="Documentation for Sphinx-Gallery extension"
#    cd ${srcdir}/${_pyname}-${pkgver}/doc/_build
#
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
