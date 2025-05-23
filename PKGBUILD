# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-ipytest
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=0.14.2
pkgrel=1
pkgdesc="Unit tests in IPython notebooks"
arch=('any')
url="https://github.com/chmp/ipytest"
license=('MIT')
makedepends=('python-poetry-core'
             'python-build'
             'python-installer')
checkdepends=('python-pytest'
              'python-coverage'
              'ipython')
#source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
source=("https://github.com/chmp/ipytest/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('c6dddc545581058330361bdad3c6fb85')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i "1 i\[project]\nname = \"ipytest\"" pyproject.toml
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    mkdir -p dist/lib
    bsdtar -xpf dist/${_pyname/-/_}-${pkgver}-py3-none-any.whl -C dist/lib
    PYTHONPATH="dist/lib" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count #
}

package_python-ipytest() {
    depends=('python>=3.8' 'python-packaging' 'python-pytest>=5.4' 'ipython')
    optdepends=('python-ipytest-doc: Documentation for ipytest')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 License.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 Readme.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-ipytest-doc() {
#    pkgdesc="Documentation for Python ipytest"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
