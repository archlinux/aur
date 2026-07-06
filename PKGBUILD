# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-soc-consistency
_name=${pkgname#python-}
pkgver=1.5.0
pkgrel=1
pkgdesc="Intelligent KiCad Bill of Materials generator with inventory matching"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/gahingwoo/SoC-Consistency"
_pydeps=(
    click
    # dataclasses-json
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
    "dtc: Device Tree Compiler"
    "rkdeveloptool-gui: RKDevelopTool GUI is a graphical front-end for Rockchip's official rkdeveloptool"
)
license=('MIT')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('997cf057520890d20759530ff97d937f1ddca1abdc60cb017727278061587173')

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
