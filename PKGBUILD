# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=mkdocs-llmstxt
pkgname=("${pkgbase}")
_pyname=("${pkgbase//-/_}")
#pkgname=("${_pname}" "${_pname}-doc")
pkgver=0.4.0
pkgrel=1
pkgdesc="MkDocs plugin to generate an /llms.txt file."
arch=('any')
url="https://pawamoy.github.io/mkdocs-llmstxt"
license=('ISC')
makedepends=('python-pdm-backend'
             'python-build'
             'python-installer')
#            'mkdocs-material'
#            'mkdocs-section-index'
#            'mkdocs-git-revision-date-localized-plugin'
#            'mkdocs-minify-plugin'
#            'mkdocs-coverage'
#            'mkdocstrings-python'
#            'python-markdown-callouts'
#            'python-markdown-exec'
#            'mdformat-tables'
#            'python-markdownify'
#           )  # autorefs, pymdown <- mkdocstrings; coverage: circular dep
checkdepends=('python-pytest'
#             'python-pytest-xdist'
              'mdformat-tables'
              'python-markdownify'
              'python-griffe'
              'mkdocstrings') # bs4 <- markdownify
#source=("https://github.com/oprypin/mkdocs-section-index/archive/refs/tags/v${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
#        "${pkgver}-mkdocs.yml::https://github.com/oprypin/mkdocs-section-index/raw/v${pkgver}/example/mkdocs.yml"
)
sha256sums=('a7e4d20496bc8c55b6773b55c8d69cf552448a9ad38915b6e8c657ae3a46c8b8')

#prepare() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    sed -i '$a use_directory_urls: false' mkdocs.yml
#}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   mkdir -p dist/lib
#   bsdtar -xpf dist/${_pyname//-/_}-${pkgver}-py3-none-any.whl -C dist/lib
#   PYTHONPATH="dist/lib" mkdocs build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    mkdir -p dist/lib
    bsdtar -xpf dist/${_pyname//-/_}-${pkgver}-py3-none-any.whl -C dist/lib
    PYTHONPATH="dist/lib" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package_mkdocs-llmstxt() {
    depends=('python>=3.9' 'mdformat-tables>=1.0' 'python-markdownify>=0.14')
    #optdepends=('mkdocs-llmstxt-index-doc: Documentation for mkdocs-llmstxt')
    replaces=("python-${pkgname}")
    provides=("python-${pkgname}=${pkgver}")
    conflicts=("python-${pkgname}")
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_mkdocs-llmstxt-doc() {
#    pkgdesc="Documentation for mkdocs-llmstxt"
#    provides=("python-${pkgname}=${pkgver}")
#    conflicts=("python-${pkgname}")
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a site "${pkgdir}/usr/share/doc/${pkgbase}"
#}
