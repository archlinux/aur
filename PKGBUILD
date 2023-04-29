# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=mkdocs-jupyter
pkgname=("${pkgbase}")
#"${pkgbase}-doc")
_pyname=("${pkgbase//-/_}")
pkgver=0.24.1
pkgrel=1
pkgdesc="Use Jupyter in mkdocs websites"
url="https://mkdocs-jupyter.danielfrg.com"
license=('Apache')
arch=("any")
makedepends=('python-hatchling'
             'python-build'
             'python-installer')
checkdepends=('python-pytest-cov'
              'python-jupytext'
              'mkdocs-material-pymdownx-extras'
              'jupyter-nbclient'
              'jupyter-nbconvert')
#source=("https://github.com/mkdocstrings/mkdocstrings/archive/refs/tags/${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('9677037fb7e931268f3df7599fc0828c261247df3d1575bced320ba8b7d1d46d')

build() {
    cd "${_pyname}-${pkgver}"

    python -m build --wheel --no-isolation
}

check() {
    cd "${_pyname}-${pkgver}"

    mkdir -p dist/lib
    bsdtar -xpf dist/${_pyname/-/_}-${pkgver}-py3-none-any.whl -C dist/lib
    PYTHONPATH="dist/lib" pytest || warning "Tests failed" # -vv --color=yes
}

package_mkdocs-jupyter() {
    depends=('python>=3.7'
             'python-jupytext>1.13.8'
             'python-pygments>2.12.0'
             'mkdocs>=1.4.0'
             'mkdocs-material>9.0.0'
             'jupyter-nbconvert>=7.2.9')
    cd "${_pyname}-${pkgver}"

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_mkdocs-jupyter-doc() {
#    cd "${pkgbase}-${pkgver}"
#
#    install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
#    cp -a site "${pkgdir}/usr/share/doc/${pkgname%-doc}"
#}
