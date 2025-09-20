# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-duty
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
#pkgname=("${_pname}" "${_pname}-doc")
pkgver=1.6.3
pkgrel=1
pkgdesc="A simple task runner."
arch=('any')
url="https://pawamoy.github.io/duty"
license=('ISC')
makedepends=('python-pdm-backend'
             'python-build'
             'python-installer')
#            'mkdocs-material'
#            'mkdocs-autorefs'
#            'mkdocs-gen-files'
#            'mkdocs-literate-nav'
#            'mkdocs-coverage'
#            'mkdocstrings-python'
#            'mkdocs-git-committers-plugin-2'
#            'python-markdown-callouts'
#            'python-markdown-exec'
#            )
checkdepends=('python-pytest'
#             'python-pytest-xdist'
              'python-failprint'
              'python-griffe'
              'mkdocstrings')
#source=("https://github.com/oprypin/mkdocs-section-index/archive/refs/tags/v${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "${pkgver}-demo.svg::https://github.com/pawamoy/duty/raw/${pkgver}/demo.svg")
sha256sums=('006f09863b8550ea62b0f8a4a52591dc61a82abe9c2b1c0407f8ba55c9c67f18'
            '59726640b93e61a9e70d3dedb79d6dc441fdbf5e43b2862895ee1d9449414893')

#prepare() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#    # Too much makedepends
#    ln -rs {${srcdir}/${pkgver}-,}demo.svg
#    sed -i -e '$a use_directory_urls: false' mkdocs.yml
#}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   mkdocs build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   mkdir -p dist/lib
#   bsdtar -xpf dist/${_pyname//-/_}-${pkgver}-py3-none-any.whl -C dist/lib
#   PYTHONPATH="dist/lib" pytest -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 # || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
    PYTHONPATH="src" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package_python-duty() {
    depends=('python>=3.9' 'python-failprint>=1.0.5')
    optdepends=('python-duty-doc: Documentation for python duty')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-duty-doc() {
#    pkgdesc="Documentation for python duty"
#    provides=("python-${pkgname}=${pkgver}")
#    conflicts=("python-${pkgname}")
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a site "${pkgdir}/usr/share/doc/${pkgbase}"
#}
