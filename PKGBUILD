# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-kicad
_name=${pkgname#python-}
pkgver=0.9.2
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
    zstandard
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
checkdepends=(
    python-pytest
)
optdepends=('kicad')
license=('MIT')
source=(
    "${pkgname}::git+${url}.git#tag=$pkgver"
    "kicad::git+https://gitlab.com/kicad/code/kicad.git"
)
sha256sums=('5a69b986d5356b25ee3f443b93f76e4b5b1251050aca26e990bf333cdffa503c'
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

check() {
	cd "${srcdir}/${pkgname}"

	export PYTHONPATH="${srcdir}/${pkgname}${PYTHONPATH:+:${PYTHONPATH}}"
	pytest -x
}

package() {
    cd "${srcdir}/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
