# Maintainer: lumexren <lumexren@gmail.com>

pkgname=plasma-minimal-osd
pkgver=1.0.0
pkgrel=1
pkgdesc="A clean, minimal, and bottom-aligned OSD replacement for KDE Plasma 6"
arch=('x86_64' 'aarch64')
url="https://github.com/lumexren/plasma-minimal-osd"
license=('GPL-2.0-or-later')
depends=(
    'plasma-workspace'
    'libplasma'
    'kwindowsystem'
    'qt6-base'
    'qt6-declarative'
    'wayland'
)
makedepends=(
    'git'
    'qt6-base'
    'qt6-declarative'
    'libplasma'
    'kwindowsystem'
    'wayland'
    'pkgconf'
)
install="${pkgname}.install"
source=("git+https://github.com/lumexren/plasma-minimal-osd.git#branch=6.x")
sha256sums=('SKIP')

build() {
    cd "${pkgname}/src"
    ./build.sh
}

package() {
    cd "${pkgname}"

    local qml_dest="${pkgdir}/usr/lib/plasma-minimal-osd/qt6/qml/org/kde/plasma/workspace/osd"
    install -dm755 "${qml_dest}"

    install -Dm644 Osd.qml OsdItem.qml qmldir plasmashell_osd.qmltypes "${qml_dest}/"
    install -Dm755 libplasmashell_osd.so "${qml_dest}/libplasmashell_osd.so"

    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/environment.d/10-plasma-minimal-osd.conf" << 'ENVEOF'
QML2_IMPORT_PATH=/usr/lib/plasma-minimal-osd/qt6/qml:${QML2_IMPORT_PATH}
ENVEOF

    install -Dm755 /dev/stdin "${pkgdir}/etc/profile.d/plasma-minimal-osd.sh" << 'SHREOF'
export QML2_IMPORT_PATH="/usr/lib/plasma-minimal-osd/qt6/qml${QML2_IMPORT_PATH:+:$QML2_IMPORT_PATH}"
SHREOF

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
