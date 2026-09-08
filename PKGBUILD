# Maintainer: taotieren <admin@taotieren.com>

pkgbase=python-mitool-git
pkgname=python-mitool-git
_name=${pkgname%-git}
_name=${_name#python-}
pkgver=1.6.0.r2.gb503246
pkgrel=1
pkgdesc="Cross-platform CLI for Xiaomi"
arch=(any)
url="https://github.com/MiForge/MiTool"
license=('MIT')
groups=()
provides=(${_name} ${pkgname%-git})
conflicts=(${_name} ${pkgname%-git})
replaces=()
_pydeps=(
    rich
    # AUR
    miflash
    miapply
    fcetool 
)
depends=(
    miassistanttool
    miunlocktool
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
optdepends=()
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
    install -vDm644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -vDm644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
