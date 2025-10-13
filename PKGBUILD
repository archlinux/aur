# Maintainer: xifan <xifan2333@gmail.com>
# Based on linuxqq by Purofle <purofle@gmail.com>
# Contributor: Integral <integral@member.fsf.org>

pkgname=linuxqq-appimage-wayland
_pkgname=linuxqq
pkgver=3.2.18_250626
pkgrel=1
epoch=5
pkgdesc="New Linux QQ based on Electron (Wayland native support, AppImage build)"
arch=('x86_64' 'aarch64')
url="https://im.qq.com/${_pkgname}"
license=('LicenseRef-QQ')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-nt-bwrap")
depends=('fuse2')
optdepends=('libappindicator-gtk3: Allow QQ to extend a menu via Ayatana indicators in Unity, KDE or Systray (GTK+ 3 library).')
options=('!strip')
_filename_x86_64="QQ-3.2.18_250626-x86_64.AppImage"
_filename_aarch64="QQ-3.2.18_250626-aarch64.AppImage"
source_x86_64=("QQ-3.2.18_250626-x86_64.AppImage::https://dldir1v6.qq.com/qqfile/qq/QQNT/Linux/QQ_3.2.18_250626_x86_64_01.AppImage")
source_aarch64=("QQ-3.2.18_250626-aarch64.AppImage::https://dldir1v6.qq.com/qqfile/qq/QQNT/Linux/QQ_3.2.18_250626_arm64_01.AppImage")
sha512sums_x86_64=('e1f89afc5d968503a091c20fe3039198b280d61d1502f86be7def21882f9e518a6f67bfcecff9859a7c99a22a7233c44ae747d4a617e266c4b6dbd1370898879')
sha512sums_aarch64=('SKIP')

prepare() {
    cd "${srcdir}"
    local _filename
    case "${CARCH}" in
        x86_64) _filename="${_filename_x86_64}" ;;
        aarch64) _filename="${_filename_aarch64}" ;;
    esac

    chmod +x "${_filename}"
    if [[ ! -d squashfs-root ]]; then
        "./${_filename}" --appimage-extract >/dev/null
    fi
}

package() {
    cd "${srcdir}"

    local _filename
    case "${CARCH}" in
        x86_64) _filename="${_filename_x86_64}" ;;
        aarch64) _filename="${_filename_aarch64}" ;;
    esac

    # Install AppImage
    local appdir="${pkgdir}/opt/appimages/${_pkgname}"
    install -d "${appdir}"
    install -Dm755 "${_filename}" "${appdir}/${_filename}"

    # Install launcher with Wayland support
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${_pkgname}" <<'EOF'
#!/bin/sh
# Detect architecture
case "$(uname -m)" in
    x86_64) _appimage="QQ-3.2.18_250626-x86_64.AppImage" ;;
    aarch64) _appimage="QQ-3.2.18_250626-aarch64.AppImage" ;;
    *) echo "Unsupported architecture"; exit 1 ;;
esac

# Run QQ with Wayland and IME support
exec /opt/appimages/linuxqq/"${_appimage}" \
    --enable-features=UseOzonePlatform,WaylandWindowDecorations \
    --ozone-platform-hint=auto \
    --enable-wayland-ime \
    --wayland-text-input-version=3 \
    "$@"
EOF

    # Install icon
    install -Dm644 squashfs-root/usr/share/icons/hicolor/512x512/apps/qq.png \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/qq.png"

    # Install desktop file
    install -Dm644 squashfs-root/qq.desktop \
        "${pkgdir}/usr/share/applications/qq.desktop"

    # Fix desktop file to use our launcher
    sed -i 's|^Exec=.*|Exec=linuxqq %U|' "${pkgdir}/usr/share/applications/qq.desktop"
    sed -i 's|^Icon=.*|Icon=qq|' "${pkgdir}/usr/share/applications/qq.desktop"

    # Install licenses
    install -Dm644 squashfs-root/LICENSE.electron.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 squashfs-root/LICENSES.chromium.html -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
