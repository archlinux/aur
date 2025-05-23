# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=mkdocstrings-python-legacy
pkgname=("${pkgbase}")
_pyname=${pkgname//-/_}
#"${pkgbase}-doc")
pkgver=0.2.7
pkgrel=1
pkgdesc="A legacy Python handler for mkdocstrings"
url="https://mkdocstrings.github.io/python-legacy"
license=('ISC')
arch=("any")
makedepends=('python-pdm-backend'
             'python-build'
             'python-installer')
#             'mkdocs-material'
#           'python-pymdown-extensions'
#             'mkdocs-coverage'
#             'mkdocs-llmstxt'
##          'mkdocs-minify-plugin'
##            'mkdocs-git-revision-date-localized-plugin'
#             'mkdocstrings'
#             'python-markdown-callouts'
#           'mkdocs-autorefs'
#           'mkdocs-section-index'
#             'python-markdown-exec'
##            'python-pytkdocs'
#            )
checkdepends=('python-pytest'
#             'python-pytest-xdist'
              'python-pytkdocs'
              'mkdocstrings'
              'mkdocs-material')
#source=("https://github.com/mkdocstrings/python-legacy/archive/refs/tags/${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('1aa8a277a332fb0d49be3786de3fa18af7d8792e8d611f6ba8d550dc3a1ff8a1')

#prepare() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
##   mkdir -p docs
##   sed -i 's/-expression//' pyproject.toml
#    sed -i -e '$a use_directory_urls: false' mkdocs.yml
#}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
#   cd ${srcdir}/python-legacy-${pkgver}
    python -m build --wheel --no-isolation

#    msg "Building Docs"
##   mkdir -p dist/lib
##   bsdtar -xpf dist/${_pyname/-/_}-${pkgver}-py3-none-any.whl -C dist/lib
##   PYTHONPATH="dist/lib" mkdocs build
#    PYTHONPATH="src" mkdocs build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}
#   cd ${srcdir}/python-legacy-${pkgver}

#   mkdir -p dist/lib
#   bsdtar -xpf dist/${pkgbase//-/_}-${pkgver}-py3-none-any.whl -C dist/lib
#   PYTHONPATH="dist/lib" pytest -vv -l -ra --color=yes -o console_output_style=count # || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count #
    PYTHONPATH="src" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package_mkdocstrings-python-legacy() {
    depends=('python>=3.9'
             'mkdocstrings>=0.28.3'
             'mkdocs-autorefs>=1.1'
             'python-pytkdocs>=0.14')
    conflicts=("python-mkdocstrings-python")
    cd ${srcdir}/${_pyname}-${pkgver}

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
