# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-sphinx-thebe
_pname=${pkgbase#python-}
_pyname=${_pname/-/_}
pkgname=("python-${_pname}" "python-${_pname}-doc")
pkgver=0.3.1
pkgrel=1
pkgdesc="Integrate interactive code blocks into your documentation with Thebe and Binder"
arch=('any')
url="https://sphinx-thebe.readthedocs.io"
license=('MIT')
makedepends=('python-hatch-vcs'
             'python-build'
             'python-installer'
             'python-sphinx-copybutton'
             'python-sphinx_design'
             'python-sphinx-book-theme'
             'python-myst-nb'
             'python-matplotlib')
checkdepends=('python-pytest-regressions'
              'python-beautifulsoup4')     # myst-nb, sphinx-copybutton, sphinx_design already in makedepends
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('85d81d6ad0ce49b598e56ba930f708ec')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    mkdir -p dist/lib
    bsdtar -xpf dist/${_pyname/-/_}-${pkgver}-py3-none-any.whl -C dist/lib
    PYTHONPATH="../dist/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    PYTHONPATH="${srcdir}/${_pyname}-${pkgver}/dist/lib" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
}

package_python-sphinx-thebe() {
    depends=('python-sphinx>=4')
    optdepends=('python-matplotlib'
                'python-myst-nb: sphinx'
                'python-sphinx-book-theme>=0.4.0'
                'python-sphinx-copybutton'
                'python-sphinx_design'
                'python-sphinx-thebe-doc: Documentation for sphinx-thebe')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-sphinx-thebe-doc() {
    pkgdesc="Documentation for Sphinx-Thebe extension"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
