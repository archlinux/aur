# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-griffe
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=1.14.0
pkgrel=1
pkgdesc="Signatures for entire Python programs"
arch=('any')
url="https://mkdocstrings.github.io/griffe"
license=('ISC')
makedepends=('python-pdm-backend'
             'python-build'
             'python-installer')
#            'mkdocs-material'
#            'mkdocs-autorefs'
#            'mkdocs-coverage'
#            'mkdocs-gen-files'
#            'mkdocs-literate-nav'
#            'mkdocs-section-index'
#            'mkdocs-git-committers-plugin-2'
#            'mkdocs-git-revision-date-localized-plugin'
#            'mkdocs-redirects'
#            'python-markdown-callouts'
#            'python-markdown-exec'
#            'python-pygments-ansi-color'
#            'python-griffe-inherited-docstrings'
#            'mkdocstrings-python'
#            'git') # avoid circular dep
checkdepends=('python-pytest'
#             'python-pytest-xdist'
              'python-colorama'
              'python-jsonschema'
              'mkdocstrings'
              'git')
#source=("https://github.com/oprypin/markdown-callouts/archive/refs/tags/v${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
#       "https://github.com/mkdocstrings/griffe/raw/main/logo.svg")
#       "${pkgver}-schema.json::https://github.com/mkdocstrings/griffe/raw/${pkgver}/docs/schema.json")
md5sums=('67178bfd65a7d5521c9c983312f3849c')

#prepare() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
##   mkdir -p docs
##   ln -rs {${srcdir}/${pkgver}-,docs/}schema.json
#    ln -rs ${srcdir}/logo.svg .
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

    # ignore mkdocstrings related
#   mkdir -p dist/lib
#   bsdtar -xpf dist/${_pyname/-/_}-${pkgver}-py3-none-any.whl -C dist/lib
    PYTHONPATH="src" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package_python-griffe() {
    depends=('python>=3.9' 'python-colorama>=0.4')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-griffe-doc() {
#    pkgdesc="Documentation for markdown-callouts"
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a site "${pkgdir}/usr/share/doc/${pkgbase}"
#}
