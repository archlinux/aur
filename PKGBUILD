# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=mkdocs-gen-files
pkgname=("${pkgbase}")
#"${pkgbase}-doc")
_pyname=("${pkgbase//-/_}")
pkgver=0.6.0
pkgrel=1
pkgdesc="MkDocs plugin to programmatically generate documentation pages during the build"
url="https://oprypin.github.io/mkdocs-gen-files"
license=('MIT')
arch=("any")
makedepends=('python-hatchling'
             'python-build'
             'python-installer')
checkdepends=('python-pytest-golden'
#             'python-pytest-xdist'
              'mkdocs')
#source=("https://github.com/mkdocstrings/mkdocstrings/archive/refs/tags/${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('52022dc14dcc0451e05e54a8f5d5e7760351b6701eff816d1e9739577ec5635e')

build() {
    cd "${_pyname}-${pkgver}"

    python -m build --wheel --no-isolation
}

check() {
    cd "${_pyname}-${pkgver}"

#   mkdir -p dist/lib
#   bsdtar -xpf dist/${_pyname/-/_}-${pkgver}-py3-none-any.whl -C dist/lib
#   PYTHONPATH="dist/lib" pytest -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 # || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
    PYTHONPATH="." pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package_mkdocs-gen-files() {
    depends=('python>=3.7' 'mkdocs>=1.4.1')
    cd "${_pyname}-${pkgver}"

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.md
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_mkdocs-gen-files-doc() {
#    cd "${pkgbase}-${pkgver}"
#
#    install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
#    cp -a site "${pkgdir}/usr/share/doc/${pkgname%-doc}"
#}
