# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-markdown-callouts
_pname=${pkgbase#python-}
_pyname=${_pname//-/_}
#_pyname=${pkgbase#python-}
#pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgname=("python-${_pname}")
#"python-${_pname}-doc")
pkgver=0.4.0
pkgrel=1
pkgdesc="Markdown extension: a classier syntax for admonitions"
arch=('any')
url="https://oprypin.github.io/markdown-callouts"
license=('MIT')
makedepends=('python-hatchling'
#            'python-platformdirs'
             'python-build'
             'python-installer')
#            'mkdocs-material-pymdownx-extras'
checkdepends=('python-pytest-golden'
              'python-beautifulsoup4'
              'python-markdown')
#source=("https://github.com/oprypin/markdown-callouts/archive/refs/tags/v${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('20f92ca493c8a7bf495a304a21691290')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation --skip-dependency-check

#   msg "Building Docs"
#   mkdir -p dist/lib
#   bsdtar -xpf dist/${_pyname/-/_}-${pkgver}-py3-none-any.whl -C dist/lib
#   PYTHONPATH="dist/lib" mkdocs build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    mkdir -p dist/lib
    bsdtar -xpf dist/${_pyname/-/_}-${pkgver}-py3-none-any.whl -C dist/lib
    PYTHONPATH="dist/lib" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
}

package_python-markdown-callouts() {
    depends=('python>=3.8' 'python-markdown>=3.3.3')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-markdown-callouts-doc() {
#    pkgdesc="Documentation for markdown-callouts"
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a site "${pkgdir}/usr/share/doc/${pkgbase}"
#}
