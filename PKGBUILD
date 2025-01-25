# Maintainer: kjxbyz

# Note:
# using the .deb instead of the .tar.gz as it already contains the icons as well as the .desktop file.

pkgname=kitify-bin
pkgver=0.0.1
pkgrel=2
pkgdesc='All-in-one tools, boosting your efficiency'
url=https://github.com/kitifylabs/kitify
arch=('x86_64' 'aarch64')
license=(GPL-3.0-only)
depends=(fuse2 xdg-user-dirs libayatana-appindicator)
conflicts=('kitify')
provides=('kitify')
options=(!debug)
source_x86_64=("${url}/releases/download/v${pkgver}+${pkgrel}/kitify_${pkgver}+${pkgrel}_linux_amd64.deb")
source_aarch64=("${url}/releases/download/v${pkgver}+${pkgrel}/kitify_${pkgver}+${pkgrel}_linux_aarch64.deb")
sha256sums_x86_64=('ae7c95a7e8d4fdbf5c2931d8b9bd263f6e5114a0e13fe725e02c34c1b395b687')
sha256sums_aarch64=('43e4edd448158f01f669f50df9f12bf06e932ff39a32c8fddd9110b5f18d044d')
_pkgdesktop="kitify.desktop"

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
    # Dirty - rename icons to kitify
    for res in "128x128" "256x256"; do
        mv "${pkgdir}/usr/share/icons/hicolor/${res}/apps/kitify.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/kitify.png"
    done

    # Executable
    install -dm755 "${pkgdir}/opt/${pkgname%-*}/"
    cp -a "${srcdir}/usr/share/kitify/." "${pkgdir}/opt/${pkgname%-*}"
    # Same as icons - rename to kitify
    # mv "${pkgdir}/opt/${pkgname%-*}/kitify" "${pkgdir}/opt/${pkgname%-*}/kitify"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s \
        "/opt/${pkgname%-*}/${pkgname%-*}" \
        "${pkgdir}/usr/bin/${pkgname%-*}"
}
