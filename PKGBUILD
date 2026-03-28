# Maintainer: Jai Brown (AUR: JaINTP) <dev [at] jaintp [dot] com>

_pkgname=devpod
_pkgver=0.17.0
_image_url="https://github.com/skevetter/devpod/releases/download/v${_pkgver}/DevPod_linux_amd64.AppImage"

pkgname="${_pkgname}-community-appimage"
pkgver=0.17.0
pkgrel=2
pkgdesc="Codespaces but open-source, client-only, and unopinionated - community fork (AppImage version)"
arch=('x86_64')
url="https://github.com/skevetter/devpod"
license=('MPL-2.0')
options=(!strip)

depends=('fuse2' 'hicolor-icon-theme' 'zlib')

# This fork installs the same binaries as upstream, so it MUST conflict.
provides=("devpod" "devpod-cli")
conflicts=("devpod" "devpod-bin" "devpod-cli-bin")

source_x86_64=("${_pkgname}-${pkgver}-x86_64.AppImage::${_image_url}")
sha256sums_x86_64=('747bd7fae5699b04bb4bdb7ab2bc44e5030add300d4296626791a07b269f5a55')

_appimage="${_pkgname}-${pkgver}-${CARCH}.AppImage"
noextract=("${_appimage}")

prepare() {
    chmod +x "${_appimage}"
    # Extract the AppImage to access the bundled CLI binary and desktop files.
    ./"${_appimage}" --appimage-extract > /dev/null
}

build() {
    sed -i \
        -e "s|Exec=AppRun|Exec=/usr/bin/devpod-desktop|" \
        -e "s|Icon=.*|Icon=devpod-desktop|" \
        "squashfs-root/DevPod.desktop"
}

package() {
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${_pkgname}.AppImage"
    
    # Extract the ACTUAL CLI binary bundled inside the AppImage
    install -Dm755 "${srcdir}/squashfs-root/usr/bin/devpod" "${pkgdir}/usr/bin/devpod"

    install -Dm644 "${srcdir}/squashfs-root/DevPod.desktop" \
        "${pkgdir}/usr/share/applications/DevPod.desktop"

    install -Dm644 "${srcdir}/squashfs-root/DevPod.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/devpod-desktop.png"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/devpod-desktop"
    ln -s "/usr/bin/devpod" "${pkgdir}/usr/bin/devpod-cli"
}