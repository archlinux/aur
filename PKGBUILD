# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-soc-consistency
_name=${pkgname#python-}
pkgver=1.6.0
pkgrel=3
pkgdesc="Static analysis tool that catches hardware-level bugs in Linux Device Tree Source (DTS) files"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/gahingwoo/SoC-Consistency"
_pydeps=(
    click
    dataclasses-json
    openpyxl
    rich
    yaml
# AUR
    pyvis
)
depends=(
    'ipython'
    'python'
    "${_pydeps[@]/#/python-}"
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
checkdepends=(
    'python-pytest'
)
optdepends=(
    "clang: C language family frontend for LLVM"
    "dtc: Device Tree Compiler"
    "kicad: Electronic schematic and printed circuit board (PCB) design tools"
    "python-dt-schema: Tooling for devicetree validation using YAML and jsonschema"
    "rkdeveloptool-gui: RKDevelopTool GUI is a graphical front-end for Rockchip's official rkdeveloptool"
)
license=('MIT')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('74b5332e72f9d3be3c3c5c3912e4683b57bbf8eda2b8882ebf210a7cc1581df5')

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
}

build() {
    cd "${srcdir}/${_name}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/${_name}"
    python -m pytest tests/ -q
}
package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm0644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    cp -R docs "${pkgdir}/usr/share/doc/${pkgname}/"
}
