# Maintainer: kjxbyz

# Note:
# using the .deb instead of the .tar.gz as it already contains the icons as well as the .desktop file.

pkgname=connectra-bin
pkgver=0.0.1
pkgrel=0
pkgdesc='Discover, Connect, Belong'
url=https://github.com/connectra/connectra
arch=('x86_64' 'aarch64')
license=(GPL-3.0-only)
depends=(fuse2 xdg-user-dirs libayatana-appindicator)
conflicts=('connectra')
provides=('connectra')
options=(!debug)
source_x86_64=("${url}/releases/download/v${pkgver}/connectra-${pkgver}-linux-amd64.deb")
source_aarch64=("${url}/releases/download/v${pkgver}/connectra-${pkgver}-linux-aarch64.deb")
sha256sums_x86_64=('aa35e9684c3ed00ecfb832243ea9bbace4518feea711a595e076d4bbc77e6ea3')
sha256sums_aarch64=('bc00bd69e2cddd277f87d2dbf75a4b56ed2269af6a344e9fbcc1d2c88a2de0da')
_pkgdesktop="connectra.desktop"

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
    # Dirty - rename icons to connectra
    for res in "128x128" "256x256"; do
        mv "${pkgdir}/usr/share/icons/hicolor/${res}/apps/connectra.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/connectra.png"
    done

    # Executable
    install -dm755 "${pkgdir}/opt/${pkgname%-*}/"
    cp -a "${srcdir}/usr/share/connectra/." "${pkgdir}/opt/${pkgname%-*}"
    # Same as icons - rename to connectra
    # mv "${pkgdir}/opt/${pkgname%-*}/connectra" "${pkgdir}/opt/${pkgname%-*}/connectra"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s \
        "/opt/${pkgname%-*}/${pkgname%-*}" \
        "${pkgdir}/usr/bin/${pkgname%-*}"
}
