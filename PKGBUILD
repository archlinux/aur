# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=mkdocstrings-python
pkgname=("${pkgbase}")
#"${pkgbase}-doc")
pkgver=0.9.0
pkgrel=1
pkgdesc="Automatic documentation from sources, for MkDocs"
url="https://mkdocstrings.github.io"
license=('ISC')
arch=("any")
makedepends=('python-pdm-pep517'
             'python-build'
             'python-installer')
checkdepends=('python-pytest'
              'python-griffe'
              'python-markdown'
              'mkdocstrings'
              'mkdocs-material')
#source=("https://github.com/mkdocstrings/mkdocstrings/archive/refs/tags/${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${pkgbase:0:1}/${pkgbase}/${pkgbase}-${pkgver}.tar.gz")
sha256sums=('da0a54d7d46523a25a5227f0ecc74b491291bd9d36fc71445bfb0ea64283e287')

prepare() {
    cd "${pkgbase}-${pkgver}"

    mkdir -p docs
}

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

package_mkdocstrings-python() {
    depends=('python>=3.7'
             'mkdocstrings>=0.20'
             'python-griffe>=0.24')
    cd "${pkgbase}-${pkgver}"

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

#package_mkdocstrings-python-doc() {
#    cd "${pkgbase}-${pkgver}"
#
#    install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
#    cp -a site "${pkgdir}/usr/share/doc/${pkgname%-doc}"
#}
