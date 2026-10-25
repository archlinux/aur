# Maintainer: Aditya Hebballe <45328110+AdityaHebballe@users.noreply.github.com>

pkgname=aiostreams-desktop-bin
_pkgname=aiostreams-desktop
pkgver=0.20.0
pkgrel=1
pkgdesc="AIOStreams desktop app in a native window, playing through mpv"
arch=('x86_64' 'aarch64')
url="https://github.com/Viren070/AIOStreams"
license=('AGPL-3.0-only')
depends=(
    'gtk4'
    'hicolor-icon-theme'
    'mpv'
    'webkitgtk-6.0'
)
optdepends=(
    'discord: Discord Rich Presence support'
    'vesktop: Discord Rich Presence support'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
makedepends=(
    'flatpak'
    'ostree'
)

source_x86_64=("${pkgname}-${pkgver}-x64.flatpak::https://github.com/Viren070/AIOStreams/releases/download/desktop-v${pkgver}/aiostreams-desktop-linux-x64.flatpak")
source_aarch64=("${pkgname}-${pkgver}-arm64.flatpak::https://github.com/Viren070/AIOStreams/releases/download/desktop-v${pkgver}/aiostreams-desktop-linux-arm64.flatpak")

sha256sums_x86_64=('c1cc654d6768fee5bb6962a9f2c7c41eac0a9fb9837619eb8a70c7448384f488')
sha256sums_aarch64=('c7dc8640b219b030814eb2ff99b7c52f335e5acd666e43c491d39c06c3e06c7a')

prepare() {
    case "${CARCH}" in
        x86_64)
            _flatpak_file="${pkgname}-${pkgver}-x64.flatpak"
            _flatpak_arch="x86_64"
            ;;
        aarch64)
            _flatpak_file="${pkgname}-${pkgver}-arm64.flatpak"
            _flatpak_arch="aarch64"
            ;;
    esac

    rm -rf "${srcdir}/repo" "${srcdir}/extracted"
    ostree init --repo="${srcdir}/repo" --mode=bare-user-only
    flatpak build-import-bundle "${srcdir}/repo" "${srcdir}/${_flatpak_file}"
    ostree checkout --repo="${srcdir}/repo" --subpath=files "app/io.github.viren070.aiostreams/${_flatpak_arch}/master" "${srcdir}/extracted"
}

package() {
    # Application files
    install -d "${pkgdir}/usr/lib/${_pkgname}"
    install -Dm755 "${srcdir}/extracted/lib/${_pkgname}/${_pkgname}" "${pkgdir}/usr/lib/${_pkgname}/${_pkgname}"
    cp -dr --no-preserve=ownership "${srcdir}/extracted/lib/${_pkgname}/web" "${pkgdir}/usr/lib/${_pkgname}/"

    # Symlink to bin
    install -d "${pkgdir}/usr/bin"
    ln -s "../lib/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    # Desktop entry
    install -Dm644 "${srcdir}/extracted/share/applications/io.github.viren070.aiostreams.desktop" \
        "${pkgdir}/usr/share/applications/io.github.viren070.aiostreams.desktop"

    # AppStream Metainfo
    install -Dm644 "${srcdir}/extracted/share/metainfo/io.github.viren070.aiostreams.metainfo.xml" \
        "${pkgdir}/usr/share/metainfo/io.github.viren070.aiostreams.metainfo.xml"

    # Icons
    install -Dm644 "${srcdir}/extracted/share/icons/hicolor/512x512/apps/io.github.viren070.aiostreams.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/io.github.viren070.aiostreams.png"

    # Licenses
    install -Dm644 "${srcdir}/extracted/share/licenses/io.github.viren070.aiostreams/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/extracted/share/licenses/io.github.viren070.aiostreams/THIRD-PARTY.md" \
        "${pkgdir}/usr/share/licenses/${pkgname}/THIRD-PARTY.md"
}
