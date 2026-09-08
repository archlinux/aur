# Maintainer: taotieren <admin@taotieren.com>

pkgbase=python-miflash-git
pkgname=python-miflash-git
_name=${pkgname%-git}
_name=${_name#python-}
pkgver=1.0.0.r2.g73926c8
pkgrel=1
pkgdesc="Flash Xiaomi fastboot ROMs on Termux, Linux, macOS, or Windows"
arch=(any)
url="https://github.com/MiForge/MiFlash"
license=('MIT')
groups=()
provides=(${_name} ${pkgname%-git})
conflicts=(${_name} ${pkgname%-git})
replaces=()
_pydeps=(
    rich
)
depends=(
    python
    "${_pydeps[@]/#/python-}"
)
makedepends=(
    git
    python-build
    python-installer
    python-wheel
    python-setuptools
)
checkdepends=()
optdepends=(
    'miassistanttool: Cross-platform CLI for Xiaomi Mi Assistant mode: flash, wipe, reboot'
)
source=("${_name}::git+${url}.git")
sha256sums=('SKIP')
options=()

pkgver() {
    cd "${srcdir}/${_name}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

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
    install -vDm644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
