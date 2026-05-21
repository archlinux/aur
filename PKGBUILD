# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-kicad-snapshot
_name=${pkgname#python-}
pkgver=1.0.6
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
sha256sums=('f70dc641eef055f88801aeb84cf72938acb470f12504253282f0b18eea3cfdec')

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
    install -vDm0644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -vDm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
