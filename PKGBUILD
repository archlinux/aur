# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=mkdocs-autorefs
pkgname=("${pkgbase}")
#"${pkgbase}-doc")
pkgver=0.4.1
pkgrel=1
pkgdesc="Automatically link across pages in MkDocs"
url="https://mkdocstrings.github.io/autorefs"
license=('ISC')
arch=("any")
makedepends=('python-pdm-pep517'
             'python-build'
             'python-installer')
checkdepends=('python-pytest'
              'python-markdown'
              'mkdocs')
source=("https://files.pythonhosted.org/packages/source/${pkgbase:0:1}/${pkgbase}/${pkgbase}-${pkgver}.tar.gz")
sha256sums=('70748a7bd025f9ecd6d6feeba8ba63f8e891a1af55f48e366d6d6e78493aba84')

build() {
    cd "${pkgbase}-${pkgver}"

    python -m build --wheel --no-isolation
}

check() {
    cd "${pkgbase}-${pkgver}"

    mkdir -p dist/lib
    bsdtar -xpf dist/${pkgbase/-/_}-${pkgver}-py3-none-any.whl -C dist/lib
    PYTHONPATH="dist/lib" pytest || warning "Tests failed" # -vv --color=yes
}

package_mkdocs-autorefs() {
    depends=('mkdocs>=1.1'
             'python-markdown>=3.3')
    cd "${pkgbase}-${pkgver}"

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    python -m installer --destdir="$pkgdir" dist/*.whl
}

#package_mkdocs-autorefs-doc() {
#    cd "${pkgbase}-${pkgver}"
#
#    install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
#    cp -a site "${pkgdir}/usr/share/doc/${pkgname%-doc}"
#}
