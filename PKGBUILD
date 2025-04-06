# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Maintainer: jmcb <joelsgp at protonmail dot com>

pkgbase=python-mkdocs-section-index
_pyname=${pkgbase#python-}
#_pname=${pkgbase#python-}
#_pyname=${_pname//-/_}
pkgname=("${_pyname}" "${_pyname}-doc")
#pkgname=("${_pname}" "${_pname}-doc")
pkgver=0.3.10
pkgrel=1
pkgdesc="MkDocs plugin to allow clickable sections that lead to an index page"
arch=('any')
url="https://oprypin.github.io/mkdocs-section-index/"
license=('MIT')
makedepends=('python-hatchling'
             'python-build'
             'python-installer'
             'mkdocs-material'
             'python-pymdown-extensions')
checkdepends=('python-pytest-golden'
#             'python-pytest-xdist'
              'python-mechanicalsoup'
              'python-testfixtures')    # 'mkdocs-material' satisfied in makedepends; jinja <- mkdocs
source=("https://github.com/oprypin/mkdocs-section-index/archive/refs/tags/v${pkgver}.tar.gz")
#source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
#        "${pkgver}-mkdocs.yml::https://github.com/oprypin/mkdocs-section-index/raw/v${pkgver}/example/mkdocs.yml"
#)
sha256sums=('48683894accdaad2e2d4da8fca122ec8261fb81946170f3cbdb63cccee0c46a3')

#prepare() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    mkdir -p example/docs
#    ln -rs {${srcdir}/${pkgver}-,example/}mkdocs.yml
#}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    mkdocs build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    mkdir -p dist/lib
    bsdtar -xpf dist/${_pyname//-/_}-${pkgver}-py3-none-any.whl -C dist/lib
    PYTHONPATH="dist/lib" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package_mkdocs-section-index() {
    depends=('python>=3.9' 'mkdocs>=1.2')
    optdepends=('mkdocs-section-index-doc: Documentation for mkdocs-section-index')
    replaces=("python-${pkgname}")
    provides=("python-${pkgname}=${pkgver}")
    conflicts=("python-${pkgname}")
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.md
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_mkdocs-section-index-doc() {
    pkgdesc="Documentation for mkdocs-section-index"
    provides=("python-${pkgname}=${pkgver}")
    conflicts=("python-${pkgname}")
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a site "${pkgdir}/usr/share/doc/${pkgbase}"
}
