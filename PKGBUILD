# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=mkdocs-autorefs
pkgname=("${pkgbase}")
_pyname=("${pkgbase/-/_}")
#"${pkgbase}-doc")
pkgver=1.0.1
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
              'pymdown-extensions'
              'mkdocs')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('f684edf847eced40b570b57846b15f0bf57fb93ac2c510450775dcf16accb971')

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
             'python-markupsafe>=2.0.1'
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
