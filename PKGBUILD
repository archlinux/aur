# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=mkdocstrings-python
_pyname=("${pkgbase//-/_}")
pkgname=("${pkgbase}")
#"${pkgbase}-doc")
pkgver=2.0.0
pkgrel=1
pkgdesc="A Python handler for mkdocstrings"
url="https://mkdocstrings.github.io"
license=('ISC')
arch=('any')
makedepends=('python-pdm-backend'
             'python-build'
             'python-installer')
#             'python-markdown-callouts'
#             'python-markdown-exec'
#             'python-griffe'
#             'python-tomli'
#             'mkdocs-material'
#             'mkdocs-autorefs'
#             'mkdocs-gen-files'
#             'mkdocs-literate-nav'
#             'mkdocs-git-committers-plugin-2'
#             'mkdocstrings'
#             )
checkdepends=('python-pytest'
              'python-griffe'
              'mkdocstrings'
              'python-beautifulsoup4'
              'python-inline-snapshot'
              'mkdocs-material')
#source=("https://github.com/mkdocstrings/mkdocstrings/archive/refs/tags/${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('4d872290f595221740a304bebca5b3afa4beafe84cc6fd27314d52dc3fbb4676')

#prepare() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
##   mkdir -p docs
#    sed -i -e '$a use_directory_urls: false' mkdocs.yml
#}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   mkdir -p dist/lib
#   bsdtar -xpf dist/${_pyname/-/_}-${pkgver}-py3-none-any.whl -C dist/lib
#   PYTHONPATH="dist/lib" mkdocs build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   mkdir -p dist/lib
#   bsdtar -xpf dist/${_pyname/-/_}-${pkgver}-py3-none-any.whl -C dist/lib
    PYTHONPATH="src" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count # no xdist for inline-snapshot #
}

package_mkdocstrings-python() {
    depends=('python>=3.10'
             'mkdocs-autorefs>=1.4'
             'mkdocstrings>=0.30'
             'python-griffe>=1.13')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

#package_mkdocstrings-python-doc() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
#    cp -a site "${pkgdir}/usr/share/doc/${pkgname%-doc}"
#}
