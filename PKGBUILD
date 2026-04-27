# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-kicad
_name=${pkgname#python-}
pkgver=0.7.1
pkgrel=1
pkgdesc="KiCad API Python Bindings"
provides=(${pkgname} kicad-python)
conflicts=(${pkgname} kicad-python)
arch=('any')
url="https://gitlab.com/kicad/code/kicad-python"
_pydeps=(
    jsonschema
    protobuf
    typing_extensions
# AUR
    pynng
)
depends=('python'
    "${_pydeps[@]/#/python-}")
makedepends=(
    git
    'python-poetry'
    'python-poetry-core'
    'python-poetry-plugin-export'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
# AUR
    'python-protoletariat'
    'python-mypy-protobuf'
)
optdepends=('kicad')
license=('MIT')
source=(
    "${pkgname}::git+${url}.git#tag=$pkgver"
    "kicad::git+https://gitlab.com/kicad/code/kicad.git"
)
sha256sums=('a3101469ef55193be4f2fc2de857a8b139669a6322c98d244c927d5fbc7ca612'
            'SKIP')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
    cd "${srcdir}/${pkgname}"
    git submodule init
    git config submodule.kicad.url "$srcdir/kicad"
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "${srcdir}/${pkgname}"
    # python -m build --wheel --no-isolation
    ./dist.sh
}

package() {
    cd "${srcdir}/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
