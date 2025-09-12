# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=mkdocs-coverage
pkgname=("${pkgbase}" "${pkgbase}-doc")
_pyname=("${pkgbase//-/_}")
#_pyname=("${pkgbase}")
pkgver=2.0.0
pkgrel=1
pkgdesc="MkDocs plugin to integrate your coverage HTML report into your site"
url="https://pawamoy.github.io/mkdocs-coverage"
license=('ISC')
arch=("any")
makedepends=('python-pdm-backend'
             'python-build'
             'python-installer'
             'mkdocs-material'
             'mkdocs-llmstxt'
             'mkdocs-git-revision-date-localized-plugin'
             'mkdocs-minify-plugin'
             'mkdocstrings-python'
             'mkdocs-section-index'
             'python-markdown-callouts'
             'python-markdown-exec')  # autorefs, pymdown <- mkdocstrings
checkdepends=('python-pytest') # material, section-index, llms, git-revision, minify, mkdocstrings-py, callouts, exec already in makedepends
#source=("https://github.com/pawamoy/mkdocs-coverage/archive/refs/tags/${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('628568ae5364eec06581bd6d7d83a56f9682a57350e73f07c298d5e104c7f69a')

prepare() {
    cd "${_pyname}-${pkgver}"
#   export PDM_BUILD_SCM_VERSION=${pkgver}
    sed -i '$a use_directory_urls: false' mkdocs.yml
}

build() {
    cd "${_pyname}-${pkgver}"
#   cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation

    msg "Building Docs"
    mkdir -p dist/lib
    bsdtar -xpf dist/${_pyname//-/_}-${pkgver}-py3-none-any.whl -C dist/lib
    PYTHONPATH="dist/lib" mkdocs build
}

check() {
    cd "${_pyname}-${pkgver}"
#   mkdir -pv site/coverage
#   touch site/coverage
#   ls site
    PYTHONPATH="dist/lib" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count #
}

package_mkdocs-coverage() {
    depends=('python>=3.9' 'mkdocs>=1.6')
    cd "${_pyname}-${pkgver}"

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_mkdocs-coverage-doc() {
    cd "${_pyname}-${pkgver}"

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a site "${pkgdir}/usr/share/doc/${pkgname%-doc}"
}
