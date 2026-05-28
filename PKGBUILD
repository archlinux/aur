pkgname=proton-vpn-qt-app
pkgver=1.9.0
pkgrel=1
pkgdesc="A Qt GUI frontend for the ProtonVPN CLI"
arch=('x86_64')
url="https://github.com/wheat32/proton-vpn-qt-app"
license=('GPL3')
depends=(
    'qt6-base'
    'qt6-svg'
    'proton-vpn-cli'
)
optdepends=(
    'curl: display public IP address'
    'systemd: have the app auto-start'
    'libnatpmp: enables port forwarding'
)
makedepends=(
    'cmake'
    'ninja'
    'git'
)
source=(
  "git+https://github.com/wheat32/proton-vpn-qt-app.git#tag=v${pkgver}"
)
sha256sums=('SKIP')

build() {
    cmake -S "${srcdir}/${pkgname}/src" \
          -B build \
          -G Ninja \
          -DCMAKE_BUILD_TYPE=Release

    cmake --build build
}

package() {
    install -Dm755 build/proton_vpn_qt \
        "${pkgdir}/usr/bin/proton_vpn_qt"

    # Compatibility symlink for any existing scripts/launchers
    ln -s proton_vpn_qt "${pkgdir}/usr/bin/proton-vpn-qt-app"

    install -Dm644 "${srcdir}/${pkgname}/proton-vpn-qt-app.desktop" \
        "${pkgdir}/usr/share/applications/proton-vpn-qt-app.desktop"

    install -Dm644 "${srcdir}/${pkgname}/proton-vpn-sign.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/proton-vpn-qt-app.svg"

    install -Dm644 "${srcdir}/${pkgname}/io.github.wheat32.ProtonVPNQt.metainfo.xml" \
        "${pkgdir}/usr/share/metainfo/io.github.wheat32.ProtonVPNQt.metainfo.xml"
}
