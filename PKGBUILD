# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-failprint
_pyname=${pkgbase#python-}
#_pname=${pkgbase#python-}
#_pyname=${_pname//-/_}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=1.0.3
pkgrel=1
pkgdesc="Run a command, print its output only if it fails."
arch=('any')
url="https://pawamoy.github.io/failprint"
license=('ISC')
makedepends=('python-pdm-backend'
             'python-build'
             'python-installer')
#            'mkdocs')
checkdepends=('python-pytest-timeout'
              'python-hypothesis'
              'python-colorama'
              'python-ansimarkup'
              'python-jinja'
              'python-ptyprocess')
#source=("https://github.com/oprypin/mkdocs-section-index/archive/refs/tags/v${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('21af2e1d8da6db1d35d5ce0c1e3b8554e36bcc90339b874e6142d4c41add9b64')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   mkdocs build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    mkdir -p dist/lib
    bsdtar -xpf dist/${_pyname//-/_}-${pkgver}-py3-none-any.whl -C dist/lib
    PYTHONPATH="dist/lib" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
}

package_python-failprint() {
    depends=('python>=3.9' 'python-ansimarkup' 'python-jinja>=2.11' 'python-ptyprocess' 'python-typing_extensions')
#   optdepends=('python-failprint-doc: Documentation for python failprint')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-failprint-doc() {
#    pkgdesc="Documentation for python failprint"
#    provides=("python-${pkgname}=${pkgver}")
#    conflicts=("python-${pkgname}")
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a site "${pkgdir}/usr/share/doc/${pkgbase}"
#}
