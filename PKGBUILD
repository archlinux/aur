# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=mkdocs-literate-nav
pkgname=("${pkgbase}")
#"${pkgbase}-doc")
_pyname=("${pkgbase//-/_}")
pkgver=0.6.1
pkgrel=1
pkgdesc="MkDocs plugin to specify the navigation in Markdown instead of YAML"
url="https://oprypin.github.io/mkdocs-literate-nav"
license=('MIT')
arch=("any")
makedepends=('python-hatchling'
             'python-build'
             'python-installer')
checkdepends=('python-pytest-golden'
              'mkdocs')
#source=("https://github.com/mkdocstrings/mkdocstrings/archive/refs/tags/${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('78a7ab6d878371728acb0cdc6235c9b0ffc6e83c997b037f4a5c6ff7cef7d759')

build() {
    cd "${_pyname}-${pkgver}"

    python -m build --wheel --no-isolation
}

check() {
    cd "${_pyname}-${pkgver}"

    mkdir -p dist/lib
    bsdtar -xpf dist/${_pyname/-/_}-${pkgver}-py3-none-any.whl -C dist/lib
    PYTHONPATH="dist/lib" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
}

package_mkdocs-literate-nav() {
    depends=('python>=3.7' 'mkdocs>=1.0.3')
    cd "${_pyname}-${pkgver}"

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.md
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_mkdocs-literate-nav-doc() {
#    cd "${pkgbase}-${pkgver}"
#
#    install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
#    cp -a site "${pkgdir}/usr/share/doc/${pkgname%-doc}"
#}
