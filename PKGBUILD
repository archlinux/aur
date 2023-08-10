# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=mkdocs-autorefs
pkgname=("${pkgbase}")
_pyname=("${pkgbase/-/_}")
#"${pkgbase}-doc")
pkgver=0.5.0
pkgrel=1
pkgdesc="Automatically link across pages in MkDocs"
url="https://mkdocstrings.github.io/autorefs"
license=('ISC')
arch=("any")
makedepends=('python-pdm-backend'
             'python-build'
             'python-installer')
checkdepends=('python-pytest'
              'python-markdown'
              'mkdocs')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('9a5054a94c08d28855cfab967ada10ed5be76e2bfad642302a610b252c3274c0')

build() {
    cd "${_pyname}-${pkgver}"

    python -m build --wheel --no-isolation
}

check() {
    cd "${_pyname}-${pkgver}"

    mkdir -p dist/lib
    bsdtar -xpf dist/${pkgbase/-/_}-${pkgver}-py3-none-any.whl -C dist/lib
    PYTHONPATH="dist/lib" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
}

package_mkdocs-autorefs() {
    depends=('mkdocs>=1.1'
             'python-markdown>=3.3')
    cd "${_pyname}-${pkgver}"

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    python -m installer --destdir="$pkgdir" dist/*.whl
}

#package_mkdocs-autorefs-doc() {
#    cd "${_pyname}-${pkgver}"
#
#    install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
#    cp -a site "${pkgdir}/usr/share/doc/${pkgname%-doc}"
#}
