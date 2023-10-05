# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=mkdocstrings-python
_pyname=("${pkgbase//-/_}")
pkgname=("${pkgbase}")
#"${pkgbase}-doc")
pkgver=1.7.2
pkgrel=1
pkgdesc="A Python handler for mkdocstrings"
url="https://mkdocstrings.github.io"
license=('ISC')
arch=("any")
makedepends=('python-pdm-backend'
             'python-build'
             'python-installer')
checkdepends=('python-pytest'
              'python-griffe'
              'mkdocstrings'
              'mkdocs-material')
#source=("https://github.com/mkdocstrings/mkdocstrings/archive/refs/tags/${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('75b6af86f9dcdc2d864072d8fed5b1d45ad94dd2ce97843ef52ca87ad53d9b26')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    mkdir -p docs
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    mkdir -p dist/lib
    bsdtar -xpf dist/${_pyname}-${pkgver}-py3-none-any.whl -C dist/lib
    PYTHONPATH="dist/lib" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
}

package_mkdocstrings-python() {
    depends=('python>=3.8'
             'mkdocstrings>=0.20'
             'python-griffe>=0.35')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

#package_mkdocstrings-python-doc() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
#    cp -a site "${pkgdir}/usr/share/doc/${pkgname%-doc}"
#}
