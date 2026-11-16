# Maintainer: slatkin@woims.net
pkgname=mbv
pkgver=0.27.1
pkgrel=1
pkgdesc="mpv/Emby and Audiobookshelf front-end"
arch=('x86_64')
url="https://github.com/slatkin/mbv"
license=('MIT')
depends=('mpv' 'pipewire' 'wayland' 'libxkbcommon' 'libxkbcommon-x11' 'libxcb' 'libx11' 'fontconfig' 'vulkan-icd-loader')
optdepends=('pinwin>=0.4.1: pinned panel support')
source=("${pkgname}-${pkgver}-linux-x86_64.tar.gz::https://github.com/slatkin/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('9cb37d91b6d2104984cb64e7b1437694ac145c6f4513775d9160bda66f8a87e3')

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 "mbvd" "${pkgdir}/usr/bin/mbvd"
    install -Dm755 "mbv-gui" "${pkgdir}/usr/bin/mbv-gui"
    install -Dm644 "mbv.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    install -Dm644 "mbv.lua" "${pkgdir}/usr/share/${pkgname}/scripts/mbv.lua"
    for script in mbv_*.lua; do
        install -Dm644 "${script}" "${pkgdir}/usr/share/${pkgname}/scripts/${script}"
    done
    install -Dm644 "Material-Design-Iconic-Font.ttf" \
        "${pkgdir}/usr/share/${pkgname}/fonts/Material-Design-Iconic-Font.ttf"
    install -Dm644 "config.toml" "${pkgdir}/usr/share/${pkgname}/config.toml"
    install -Dm640 "mbvd.toml" "${pkgdir}/etc/mbv/config.toml"
    install -Dm644 "mbvd.service" "${pkgdir}/usr/lib/systemd/system/mbvd.service"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
    # Only release tarballs built from a commit that has LICENSES/ ship notices.
    if [ -d LICENSES ]; then
        for notice in LICENSES/*.txt; do
            install -Dm644 "${notice}" "${pkgdir}/usr/share/licenses/${pkgname}/${notice}"
        done
    fi
}
