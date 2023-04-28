# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-griffe
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=0.27.1
pkgrel=1
pkgdesc="Signatures for entire Python programs"
arch=('any')
url="https://mkdocstrings.github.io/griffe"
license=('ISC')
makedepends=('python-pdm-backend'
             'python-build'
             'python-installer')
checkdepends=('python-pytest'
              'python-colorama'
              'python-jsonschema'
              'git')
#source=("https://github.com/oprypin/markdown-callouts/archive/refs/tags/v${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "${pkgver}-schema.json::https://github.com/mkdocstrings/griffe/raw/${pkgver}/docs/schema.json")
md5sums=('bbb0842354b2d724d8444a3d8f2e8eef'
         'bfe51f53db056100353171d2fd53346c')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    mkdir -p docs
    ln -rs {${srcdir}/${pkgver}-,docs/}schema.json
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation #--skip-dependency-check

#   msg "Building Docs"
#   mkdir -p dist/lib
#   bsdtar -xpf dist/${_pyname/-/_}-${pkgver}-py3-none-any.whl -C dist/lib
#   PYTHONPATH="dist/lib" mkdocs build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    mkdir -p dist/lib
    bsdtar -xpf dist/${_pyname/-/_}-${pkgver}-py3-none-any.whl -C dist/lib
    PYTHONPATH="dist/lib" pytest || warning "Tests failed" # -vv --color=yes
}

package_python-griffe() {
    depends=('python>=3.7' 'python-colorama>=0.4')
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
