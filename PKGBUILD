# Maintainer: kjxbyz

# Note:
# using the .deb instead of the .tar.gz as it already contains the icons as well as the .desktop file.

pkgname=artify-bin
pkgver=0.0.1
pkgrel=3
pkgdesc='Ideas, Painting & Art'
url=https://github.com/artifylabs/artify
arch=('x86_64' 'aarch64')
license=(GPL-3.0-only)
depends=(fuse2 xdg-user-dirs libayatana-appindicator)
conflicts=('artify')
provides=('artify')
options=(!debug)
source_x86_64=("${url}/releases/download/v${pkgver}+${pkgrel}/artify_${pkgver}+${pkgrel}_linux_amd64.deb")
source_aarch64=("${url}/releases/download/v${pkgver}+${pkgrel}/artify_${pkgver}+${pkgrel}_linux_aarch64.deb")
sha256sums_x86_64=('eb424911732ba4f9a076199e7cfdd6aa7220554f27c53d164f3f9d3eea4bb226')
sha256sums_aarch64=('15c771a6d389ec0057f21a3347a2e2fbc4199c9fa64ecc20cdb545135e49965c')
_pkgdesktop="artify.desktop"

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
    # Dirty - rename icons to artify
    for res in "128x128" "256x256"; do
        mv "${pkgdir}/usr/share/icons/hicolor/${res}/apps/artify.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/artify.png"
    done

    # Executable
    install -dm755 "${pkgdir}/opt/${pkgname%-*}/"
    cp -a "${srcdir}/usr/share/artify/." "${pkgdir}/opt/${pkgname%-*}"
    # Same as icons - rename to artify
    # mv "${pkgdir}/opt/${pkgname%-*}/artify" "${pkgdir}/opt/${pkgname%-*}/artify"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s \
        "/opt/${pkgname%-*}/${pkgname%-*}" \
        "${pkgdir}/usr/bin/${pkgname%-*}"
}
