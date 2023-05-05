# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=mkdocstrings-crystal
pkgname=("${pkgbase}" "${pkgbase}-doc")
pkgsuff=${pkgbase#mkdocstrings-}
#pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.3.5
pkgrel=1
pkgdesc="Crystal language doc generator for mkdocstrings"
arch=('any')
url="https://mkdocstrings.github.io/crystal"
license=('MIT')
makedepends=('python-poetry'
#            'python-platformdirs'
             'python-build'
             'python-installer'
             'mkdocstrings-python'
             'mkdocs-material-pymdownx-extras'
             'mkdocs-section-index'
             'python-markdown-callouts')
checkdepends=('python-pytest-golden'
              'python-cached-property')    # mkdocstrings, markdown-callouts already in makedepends
source=("https://github.com/mkdocstrings/crystal/archive/refs/tags/v${pkgver}.tar.gz")
#source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('caed91c100b52cb3683779126dbecb94')

prepare() {
#   cd "${pkgbase}-${pkgver}"
    cd "${pkgsuff}-${pkgver}"

    sed -i '/cached/d' pyproject.toml
}

build() {
#   cd ${srcdir}/${_pyname}-${pkgver}
    cd "${pkgsuff}-${pkgver}"
    python -m build --wheel --no-isolation --skip-dependency-check

    msg "Building Docs"
    mkdocs build
}

check() {
#   cd ${srcdir}/${_pyname}-${pkgver}
    cd "${pkgsuff}-${pkgver}"

    mkdir -p dist/lib
    bsdtar -xpf dist/${pkgbase/-/_}-${pkgver}-py3-none-any.whl -C dist/lib
    PYTHONPATH="dist/lib" pytest || warning "Tests failed" # -vv --color=yes
}

package_mkdocstrings-crystal() {
    depends=('python>=3.7'
             'python-cached-property>=1.5.2'
             'python-jinja>=2.11.2'
             'python-markdown-callouts>=0.1.0'
             'python-markupsafe>=1.1.1'
             'mkdocs-autorefs>=0.2.0'
             'mkdocstrings>=0.18.0')
#   cd ${srcdir}/${_pyname}-${pkgver}
    cd "${pkgsuff}-${pkgver}"

    install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_mkdocstrings-crystal-doc() {
    pkgdesc="Documentation for mkdocstrings-crystal"
#   cd ${srcdir}/${_pyname}-${pkgver}
    cd "${pkgsuff}-${pkgver}"

    install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a site "${pkgdir}/usr/share/doc/${pkgbase}"
}
