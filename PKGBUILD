# Maintainer: czyt <czytcn@gmail.com>
pkgname=tldraw-offline-bin
pkgver=1.11.0
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
sha256sums_x86_64=('8537d12982f460fe5869975aecac45c3dd9d9ab5c14b913b438b79c801f72247')
sha256sums_aarch64=('294fd2a8d24841c953ca78709b5b4dead90543a33e56efff1284ad94e794ae95')
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
                    AppRun|usr|'@tldesktop.desktop'|'@tldesktop.png') continue ;;
                esac
                cp -a "${_entry}" "${_appdir}/"
            done

            install -Dm644 squashfs-root/@tldesktop.desktop \
                "${pkgdir}/usr/share/applications/@tldesktop.desktop"
            install -Dm644 squashfs-root/resources/app.asar.unpacked/resources/Icon-1024.png \
                "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/@tldesktop.png"
            install -Dm644 squashfs-root/usr/share/mime/@tldesktop.xml \
                "${pkgdir}/usr/share/mime/packages/@tldesktop.xml"
            ;;
    esac

    sed -i 's|^Exec=.*|Exec=tldraw-offline %U|' \
        "${pkgdir}/usr/share/applications/@tldesktop.desktop"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s '/opt/tldraw offline/@tldesktop' "${pkgdir}/usr/bin/tldraw-offline"

    install -Dm644 "${pkgdir}/opt/tldraw offline/LICENSE.electron.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
    install -Dm644 "${pkgdir}/opt/tldraw offline/LICENSES.chromium.html" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
