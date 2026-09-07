# Maintainer: taotieren <admin@taotieren.com>

pkgbase=miassistanttool-git
pkgname=miassistanttool-git
pkgver=1.4.2.r0.gbfbad4a
pkgrel=1
pkgdesc="Cross-platform CLI for Xiaomi Mi Assistant mode: flash, wipe, reboot"
arch=(any)
url="https://github.com/MiForge/MiAssistantTool"
license=('Apache-2.0')
groups=()
provides=(${pkgbase%-git})
conflicts=(${pkgbase%-git})
replaces=()
_pydeps=(
    pyaes
    pyusb
    requests
    rich
    rsa
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
    'miunlocktool: MiUnlockTool developed to retrieve encryptData(token) for Xiaomi devices for unlocking bootloader, It is compatible with all platforms.'
)
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
options=()

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
