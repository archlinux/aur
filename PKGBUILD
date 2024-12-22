# Maintainer: kjxbyz

# Note:
# using the .deb instead of the .tar.gz as it already contains the icons as well as the .desktop file.

pkgname=artify-bin
pkgver=0.0.1
pkgrel=1
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
sha256sums_x86_64=('dcf2c5272af5f9afb6a60fbbd6d45f254ae5b0b8516a616f0c2a197f7bc25ea0')
sha256sums_aarch64=('9effd700ab6ab995b03d71f53fac1347ea06b62ace070acbf1bfb9838ba0334f')
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
