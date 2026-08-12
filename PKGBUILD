# Maintainer: Icarus_Alpha <Icarus_Alpha@outlook.com>
# Contributor: engcapa <https://github.com/engcapa>

# Taomni is a Tauri 2 + React 19 desktop app. Upstream ships prebuilt .deb /
# .rpm / AppImage bundles via GitHub Releases; this package repackages the
# official .deb for Arch Linux using the -bin convention.

pkgname=taomni-bin
_pkgname=taomni
pkgver=0.4.15
pkgrel=1
pkgdesc="AI-native remote workspace for developers - terminal, SSH, SFTP, RDP/VNC, tunnels, database client"
arch=('x86_64')
url="https://github.com/engcapa/taomni"
license=('custom')
# Direct DT_NEEDED libraries of the Tauri binary plus runtime keyring support.
# libsecret is dlopened by the Rust keyring crate for credential storage.
depends=('webkit2gtk-4.1' 'gtk3' 'libsoup3' 'alsa-lib' 'libsecret'
         'hicolor-icon-theme' 'desktop-file-utils')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=(!strip)
source_x86_64=("${_pkgname}_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/Taomni_${pkgver}_amd64.deb")
sha256sums_x86_64=('d9ac9d4cb536da4b4de60a8ca623518941ed68118a59cd61d7c6e57da06163ec')

package() {
    cd "${srcdir}"

    bsdtar -xf "${_pkgname}_${pkgver}_amd64.deb" -C .
    bsdtar -xf data.tar.gz -C .

    # Main binary (~84 MB). Shipped unstripped per upstream Tauri policy.
    install -Dm0755 "usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    # Desktop launcher. upstream ships an empty Categories= field; populate it
    # so the entry appears under Development/Network in application menus.
    install -Dm0644 "usr/share/applications/Taomni.desktop" \
        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    sed -i \
        -e 's|^Categories=.*|Categories=Development;Network;RemoteAccess;|' \
        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # hicolor icons (32, 128, 256x256@2)
    find usr/share/icons -type f | while read -r icon; do
        install -Dm0644 "${icon}" "${pkgdir}/${icon}"
    done
}
