# Maintainer: czyt <czytcn@gmail.com>
pkgname=tldraw-offline-bin
pkgver=1.20.0
pkgrel=1
pkgdesc="A local whiteboard for you and your agents"
arch=('x86_64' 'aarch64')
url="https://github.com/tldraw/tldraw-offline"
license=('LicenseRef-Proprietary')
depends=(
    'alsa-lib'
    'at-spi2-core'
    'gtk3'
    'libnotify'
    'libsecret'
    'libxss'
    'libxtst'
    'nss'
    'util-linux-libs'
    'xdg-utils'
)
optdepends=('libappindicator-gtk3: system tray icon support')
provides=('tldraw-offline')
conflicts=('tldraw-offline')
options=('!strip' '!debug')
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::https://github.com/tldraw/tldraw-offline/releases/download/v${pkgver}/tldraw-offline-linux-amd64.deb")
source_aarch64=("${pkgname}-${pkgver}-aarch64.AppImage::https://github.com/tldraw/tldraw-offline/releases/download/v${pkgver}/tldraw-offline-linux-arm64.AppImage")
sha256sums_x86_64=('85122dffea51358483d1d8e649af6c7d6d9d017cccde7fa7961749d9e46c28a2')
sha256sums_aarch64=('0bc096188354123f8c4d7b70e6fbad99267176c888e23b650fd0731f70d73474')
noextract=(
    "${pkgname}-${pkgver}-x86_64.deb"
    "${pkgname}-${pkgver}-aarch64.AppImage"
)

package() {
    case "$CARCH" in
        x86_64)
            bsdtar -xOf "${srcdir}/${pkgname}-${pkgver}-x86_64.deb" data.tar.xz |
                bsdtar -xJf - -C "${pkgdir}"
            rm -rf "${pkgdir}/usr/share/doc"
            ;;
        aarch64)
            local _appimage="${pkgname}-${pkgver}-aarch64.AppImage"
            local _appdir="${pkgdir}/opt/tldraw offline"

            chmod +x "${srcdir}/${_appimage}"
            cd "${srcdir}"
            rm -rf squashfs-root
            "${srcdir}/${_appimage}" --appimage-extract >/dev/null

            install -dm755 "${_appdir}"
            local _entry
            for _entry in squashfs-root/*; do
                case "$(basename "${_entry}")" in
                    AppRun|usr|tldraw-offline.desktop|tldraw-offline.png) continue ;;
                esac
                cp -a "${_entry}" "${_appdir}/"
            done

            install -Dm644 squashfs-root/tldraw-offline.desktop \
                "${pkgdir}/usr/share/applications/tldraw-offline.desktop"
            install -Dm644 squashfs-root/tldraw-offline.png \
                "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/tldraw-offline.png"
            install -Dm644 squashfs-root/usr/share/mime/packages/tldraw-offline.xml \
                "${pkgdir}/usr/share/mime/packages/tldraw-offline.xml"
            ;;
    esac

    sed -i 's|^Exec=.*|Exec=tldraw-offline %U|' \
        "${pkgdir}/usr/share/applications/tldraw-offline.desktop"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s '/opt/tldraw offline/tldraw-offline' "${pkgdir}/usr/bin/tldraw-offline"

    install -Dm644 "${pkgdir}/opt/tldraw offline/LICENSE.electron.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
    install -Dm644 "${pkgdir}/opt/tldraw offline/LICENSES.chromium.html" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
