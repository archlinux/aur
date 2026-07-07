# Maintainer: taotieren <admin@taotieren.com>

pkgbase=python-soc-consistency
pkgname=(python-soc-consistency meta-socc)
_name=${pkgname#python-}
pkgver=1.6.0
pkgrel=5
pkgdesc="Static analysis tool that catches hardware-level bugs in Linux Device Tree Source (DTS) files"
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
source=(
    "${_name}::git+${url}.git#tag=v$pkgver"
    'meta-socc.install'
)
sha256sums=('74b5332e72f9d3be3c3c5c3912e4683b57bbf8eda2b8882ebf210a7cc1581df5'
            '3b8a4aafd0cd146ee522fa32ae2a4e6ecbd89f14384fe581dc465ced5e90e4a1')

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

package_python-soc-consistency() {
    provides=(${pkgname})
    conflicts=(${pkgname})

    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm0644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    cp -R docs "${pkgdir}/usr/share/doc/${pkgname}/"
}

package_meta-socc() {
    provides=(${pkgname})
    conflicts=(${pkgname})
    depends=(
        'python-soc-consistency'
        'bitbake'
    )
    install=meta-socc.install
    
    cd "${srcdir}/${_name}"
    install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    cp -Ra meta-socc "${pkgdir}/usr/share/"
}
