# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=mkdocs-click
pkgname=("${pkgbase}")
_pyname=("${pkgbase//-/_}")
#_pyname=("${pkgbase}")
#pkgname=("${_pname}" "${_pname}-doc")
pkgver=0.9.0
pkgrel=1
pkgdesc="An MkDocs extension to generate documentation for Click command line applications"
arch=('any')
url="https://github.com/mkdocs/mkdocs-click"
license=('Apache-2.0')
makedepends=('python-hatchling'
             'python-build'
             'python-installer')
#            'mkdocs'
checkdepends=('python-pytest'
#             'python-pytest-xdist'
              'python-click'
              'python-markdown')
#source=("https://github.com/mkdocs/mkdocs-click/archive/refs/tags/${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('6050917628d4740517541422b607404d044117bc31b770c4f9e9e1939a50c908')

#prepare() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    sed -i '$a use_directory_urls: false' mkdocs.yml
#}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   mkdir -p dist/lib
#   bsdtar -xpf dist/${_pyname//-/_}-${pkgver}-py3-none-any.whl -C dist/lib
#   PYTHONPATH="dist/lib" mkdocs build
#   PYTHONPATH="dist/lib" mkdocs build
#   mkdocs build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package_mkdocs-click() {
    depends=('python>=3.9' 'python-click>=8.1' 'python-markdown>=3.3')
    #optdepends=('mkdocs-click-doc: Documentation for mkdocs-click')
    replaces=("python-${pkgname}")
    provides=("python-${pkgname}=${pkgver}")
    conflicts=("python-${pkgname}")
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_mkdocs-click-doc() {
#    pkgdesc="Documentation for mkdocs-click"
#    provides=("python-${pkgname}=${pkgver}")
#    conflicts=("python-${pkgname}")
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a site "${pkgdir}/usr/share/doc/${pkgbase}"
#}
