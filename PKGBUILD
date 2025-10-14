# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-sphinx-remove-toctrees
_pname=${pkgbase#python-}
_pyname=${_pname//-/_}
pkgname=("python-${_pname}" "python-${_pname}-doc")
pkgver=1.0.0.post1
pkgrel=1
pkgdesc="Reduce your documentation build size by selectively removing toctrees from pages"
arch=('any')
url="https://github.com/executablebooks/sphinx-remove-toctrees"
license=('MIT')
makedepends=('python-hatchling'
             'python-build'
             'python-installer'
             'python-sphinx-book-theme'
             'python-myst-parser')  # wheel required by new setuptools
checkdepends=('python-pytest')   # bs4 <- pydata <- book theme, myst-parser already in makedepends
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('a348043f08b63f73a767206e2ced0c9d')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i "/language\ = /s/None/'en'/" docs/conf.py
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    PYTHONPATH="${PWD}" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count #
}

package_python-sphinx-remove-toctrees() {
    depends=('python>=3.9' 'python-sphinx>=5')
    optdepends=('python-sphinx-remove-toctrees-doc: Documentation for sphinx-remove-toctrees')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-sphinx-remove-toctrees-doc() {
    pkgdesc="Documentation for Python Remove toctrees from Sphinx pages module"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
