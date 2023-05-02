# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=mkdocstrings-python-legacy
pkgname=("${pkgbase}")
#"${pkgbase}-doc")
pkgver=0.2.3
pkgrel=1
pkgdesc="A legacy Python handler for mkdocstrings"
url="https://mkdocstrings.github.io/python-legacy"
license=('ISC')
arch=("any")
makedepends=('python-pdm-pep517'
             'python-build'
             'python-installer')
checkdepends=('python-pytest'
              'python-pytkdocs'
              'mkdocstrings'
              'mkdocs-material')
#source=("https://github.com/mkdocstrings/mkdocstrings/archive/refs/tags/${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${pkgbase:0:1}/${pkgbase}/${pkgbase}-${pkgver}.tar.gz")
sha256sums=('3fb58fdabe19c6b52b8bb1d3bb1540b1cd527b562865468d6754e8cd1201050c')

prepare() {
    cd "${pkgbase}-${pkgver}"

    mkdir -p docs
    sed -i 's/-expression//' pyproject.toml
}

build() {
    cd "${pkgbase}-${pkgver}"

    python -m build --wheel --no-isolation
}

check() {
    cd "${pkgbase}-${pkgver}"

    mkdir -p dist/lib
    bsdtar -xpf dist/${pkgbase//-/_}-${pkgver}-py3-none-any.whl -C dist/lib
    PYTHONPATH="dist/lib" pytest || warning "Tests failed" # -vv --color=yes
}

package_mkdocstrings-python-legacy() {
    depends=('python>=3.7'
             'mkdocstrings>=0.19'
             'python-pytkdocs>=0.14')
    conflicts=("python-mkdocstrings-python")
    cd "${pkgbase}-${pkgver}"

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

#package_mkdocstrings-python-doc() {
#    cd "${pkgbase}-${pkgver}"
#
#    install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
#    cp -a site "${pkgdir}/usr/share/doc/${pkgname%-doc}"
#}
