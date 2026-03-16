# Maintainer: Follen22 <baffer2024@gmail.com>
pkgname=ds5-edge-relay
pkgver=1.0.2
pkgrel=1
pkgdesc="Qt GUI relay daemon for DualSense Edge — presents it as a standard DualSense to fix Proton/Steam compatibility"
arch=("x86_64")
url="https://github.com/Follen22/ds5-edge-relay"
license=("MIT")
depends=("glibc" "qt6-base")
makedepends=("cmake" "ninja")
install="${pkgname}.install"
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/Follen22/ds5-edge-relay/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=("193a48cecf8f24e417c371bc4999250028cf7c00d17b6d2345b306327dc7d7a3")

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
