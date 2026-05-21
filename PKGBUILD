# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-kicad-snapshot
_name=${pkgname#python-}
pkgver=1.0.5
pkgrel=1
pkgdesc="Snapshot and visual diff tool for KiCad projects"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/tanakamasayuki/kicad-snapshot"
_pydeps=(
    numpy
    platformdirs
)
depends=(
    'pyside6'
    'python'
    "${_pydeps[@]/#/python-}"
)
makedepends=(
    'git'
    'python-hatchling'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
optdepends=(
    "kicad: Electronic schematic and printed circuit board (PCB) design tools"
)
license=('MIT')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('88a6ee0dc44c29f0949251502c686215710af1b0b179354065aeb924672ff349')

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
}

build() {
    cd "${srcdir}/${_name}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
