# Maintainer: taotieren <admin@taotieren.com>

pkgname=nxp-uuu-qt-tool-git
pkgver=1.0.0.r7.g6250cad
pkgrel=1
pkgdesc="Gui tool based on mfgtools uuu."
arch=($CARCH)
url="https://github.com/nixgnauhcuy/nxp-uuu-qt-tool"
license=('MIT')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
depends=(
    glibc
    hicolor-icon-theme
)
makedepends=(
    git
    nuitka
    python-pyqt6
)
optdepends=(
    'mfgtools: uuu (Universal Update Utility), mfgtools 3.0.Freescale/NXP I.MX Chip image deploy tools.'
)
backup=()
options=('!strip' '!debug' '!lto')
install=
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^V//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}/"
    ./nuitka_build.sh
}

# check() {
#     cd "${srcdir}/${pkgname}/"
# }

package() {
    cd "${srcdir}/${pkgname}/"
    install -vDm755 "dist/nxp-uuu-qt-tool" -t "${pkgdir}/usr/bin/"
    install -vDm644 "src/Resources/applications/nxp-uuu-qt-tool.desktop" -t "${pkgdir}/usr/share/applications"
    install -vDm644 "src/Resources/icon/main.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/nxp-uuu-qt-tool.png"
    install -vDm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
