# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-markdown-exec
_pname=${pkgbase#python-}
_pyname=${_pname/-/_}
pkgname=("python-${_pname}")
#"python-${_pname}-doc")
pkgver=1.6.0
pkgrel=1
pkgdesc="Utilities to execute code blocks in Markdown files"
arch=('any')
url="https://pawamoy.github.io/markdown-exec"
license=('ISC')
makedepends=('python-pdm-backend'
             'python-build'
             'python-installer')
#            'mkdocs'
checkdepends=('python-pytest'
              'python-markdown'
              'python-markupsafe'
              'mkdocs-material-pymdownx-extras')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('38c5d3467009a6a902add6f69909b4cb')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   mkdocs build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    mkdir -p dist/lib
    bsdtar -xpf dist/${_pyname/-/_}-${pkgver}-py3-none-any.whl -C dist/lib
    PYTHONPATH="dist/lib" pytest || warning "Tests failed" # -vv --color=yes
}

package_python-markdown-exec() {
    depends=('pymdown-extensions>=9')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-markdown-exec-doc() {
#    pkgdesc="Documentation for Markdown Exec"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
