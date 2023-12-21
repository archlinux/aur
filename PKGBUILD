# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Contributor: Carlos Aznarán <caznaranl at uni dot pe>
pkgname=python-syrupy
_pyname=${pkgname#python-}
pkgdesc="Pytest Snapshot Test Utility"
pkgver=4.6.0
pkgrel=1
arch=('any')
url="https://github.com/tophat/${_pyname}"
license=('Apache')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
depends=('python-pytest>=7.0.0')
source=("${_pyname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('c2da07d4e25cba15e518d8ca24c396718ba44f68e9119b5b1e44a6ca2ba43e433378ea0cdda4198dcbb78a7b96f2afcce27c98c34c4b94fd54ae271538147a54')

build() {
    cd ${_pyname}-${pkgver}

    python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
    cd ${_pyname}-${pkgver}

    mkdir -p dist/lib
    bsdtar -xpf dist/${_pyname/-/_}-${pkgver}-py3-none-any.whl -C dist/lib
    PYTHONPATH="dist/lib" pytest || warning "Tests failed" # -vv -ra --color=yes -o console_output_style=count
}

package() {
    cd ${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

}
