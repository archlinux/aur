# Maintainer: Follen22 <baffer2024@gmail.com>
pkgname=ds5-edge-relay
pkgver=2.1.0
pkgrel=1
pkgdesc="Qt6 GUI relay daemon for DualSense Edge — presents it as standard DualSense to fix Proton/Steam compatibility, with button remapping, macro recorder and quick-record"
arch=("x86_64")
url="https://github.com/Follen22/ds5-edge-relay"
license=("MIT")
depends=("glibc" "qt6-base")
makedepends=("cmake" "ninja")
install="${pkgname}.install"
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/Follen22/ds5-edge-relay/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=("422f10d92121c754d779365aab6f05f4064bf6d3fd11ada845a2dae895f6dce2")

build() {
    cd "${pkgname}-${pkgver}"
    cmake -B build -GNinja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    ninja -C build
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "build/${pkgname}"             "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "99-${pkgname}.rules"          "${pkgdir}/usr/lib/udev/rules.d/99-${pkgname}.rules"
    install -Dm644 "${pkgname}.service"           "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"
    install -Dm644 "${pkgname}.desktop"           "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 LICENSE                        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
