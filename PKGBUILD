# Maintainer: kjxbyz

# Note:
# using the .deb instead of the .tar.gz as it already contains the icons as well as the .desktop file.

pkgname=fafarunner-bin
pkgver=2.6.0
pkgrel=0
pkgdesc='Enjoy smooth gameplay, stunning graphics, and endless fun'
url=https://github.com/fafarunner/fafarunner
arch=('x86_64' 'aarch64')
license=(MIT)
depends=(fuse2 xdg-user-dirs libayatana-appindicator)
conflicts=('fafarunner')
provides=('fafarunner')
options=(!debug)
source_x86_64=("${url}/releases/download/v${pkgver}/fafarunner-${pkgver}-linux-amd64.deb")
source_aarch64=("${url}/releases/download/v${pkgver}/fafarunner-${pkgver}-linux-aarch64.deb")
sha256sums_x86_64=('791af7f6596d929c1defd2bcd24d2faf36e14d11c6ed10f6c6f4e5a8d6db1e23')
sha256sums_aarch64=('22a3b3d0f7bc003b11690a67014fe3dde8293537092bce337aae4b2fbf284f08')
_pkgdesktop="fafarunner.desktop"

prepare() {
    tar -xf data.tar.zst
}

build() {
    sed -i -E '/^Version=/d' "${srcdir}/usr/share/applications/${_pkgdesktop}"
}

package() {
    # Desktop
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgdesktop}" "${pkgdir}/usr/share/applications/${pkgname%-*}.desktop"

    # Icons
    install -dm644 "${pkgdir}/usr/share/icons/"
    cp -a "${srcdir}/usr/share/icons" "${pkgdir}/usr/share"
    # Dirty - rename icons to fafarunner
    for res in "128x128" "256x256"; do
        mv "${pkgdir}/usr/share/icons/hicolor/${res}/apps/fafarunner.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/fafarunner.png"
    done

    # Executable
    install -dm755 "${pkgdir}/opt/${pkgname%-*}/"
    cp -a "${srcdir}/usr/share/fafarunner/." "${pkgdir}/opt/${pkgname%-*}"
    # Same as icons - rename to fafarunner
    # mv "${pkgdir}/opt/${pkgname%-*}/fafarunner" "${pkgdir}/opt/${pkgname%-*}/fafarunner"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s \
        "/opt/${pkgname%-*}/${pkgname%-*}" \
        "${pkgdir}/usr/bin/${pkgname%-*}"
}
