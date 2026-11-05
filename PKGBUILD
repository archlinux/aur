# Maintainer: Deltachaos <mr@deltachaos.de>

pkgname=raiderio-client
_pkgapp=raiderio-client
pkgver=6.0.1
pkgrel=1
pkgdesc="raider.io desktop client for Linux"
arch=('x86_64' 'arm64')
depends=("fuse2")
url="https://raider.io/"
source=("$_pkgapp-x86_64-v6.0.1.AppImage::https://github.com/RaiderIO/raiderio-client-builds/releases/download/v6.0.1/RaiderIO_Installer_Linux_x86_64.AppImage"
        "$_pkgapp-arm64-v6.0.1.AppImage::https://github.com/RaiderIO/raiderio-client-builds/releases/download/v6.0.1/RaiderIO_Installer_Linux_arm64.AppImage"
        'start')
license=('custom' 'MIT' 'custom:chromium-licenses')
options=(!strip)
# Skip checksum check for the RaiderIO binary, to avoid breakage on updates
sha512sums=('a19530233dd6292b7f52a1a45cc630f2ff57d47c90e16781cf0d1a1b961ed157b9f0cb56df2ddeb0dbb8d708fc36177857f4dc213bfdbe8fe24096d03ef90195'
            '07ad02c3068de24f6e1aa0bdb416162a080afda34205da7a6ebd7a2f93946b5fbe6c2e64c40f6a0d58c62ed1ce06f9112818056fb043c54d9f67a8f39960347c'
            'ee0cb07b4bf56ed43bf163f0141d5165889b051fe0aaf52f46789f67f6ab896f7d69c3527ab77bb1fd70e3c7c6a6611e691fd8ad91edd1db35a2252f10bef9a9')

normalize_desktop() {
    local desktop_files=()
    local desktop_file
    local target="${srcdir}/squashfs-root/${_pkgapp}.desktop"

    mapfile -t desktop_files < <(
        find "${srcdir}/squashfs-root" \
            -maxdepth 1 \
            -type f \
            -name '*.desktop' \
            -print
    )

    if (( ${#desktop_files[@]} == 0 )); then
        echo "ERROR: No .desktop file found in AppImage" >&2
        return 1
    fi

    if (( ${#desktop_files[@]} > 1 )); then
        echo "ERROR: Multiple .desktop files found in AppImage:" >&2
        printf '  %s\n' "${desktop_files[@]}" >&2
        return 1
    fi

    desktop_file="${desktop_files[0]}"

    if [[ "${desktop_file}" != "${target}" ]]; then
        mv "${desktop_file}" "${target}"
    fi
}

pkgver() {
    cd ${srcdir}
    rm -rf "${srcdir}/squashfs-root"
    chmod +x ${srcdir}/${_pkgapp}-${CARCH}-v6.0.1.AppImage
    ${srcdir}/${_pkgapp}-${CARCH}-v6.0.1.AppImage --appimage-extract >/dev/null

    normalize_desktop

    cat ${srcdir}/squashfs-root/${_pkgapp}.desktop | grep 'X-AppImage-Version' | sed 's!^X-AppImage-Version=!!g'
}

package() {
    cd ${srcdir}
    rm -rf "${srcdir}/squashfs-root"
    chmod +x ${srcdir}/${_pkgapp}-${CARCH}-v6.0.1.AppImage
    ./${_pkgapp}-${CARCH}-v6.0.1.AppImage --appimage-extract >/dev/null

    normalize_desktop

    sed -i 's/Exec=.*/Exec=\/usr\/bin\/'${_pkgapp}' %U/' squashfs-root/${_pkgapp}.desktop

    install -Dm755 ${_pkgapp}-${CARCH}-v6.0.1.AppImage "${pkgdir}/opt/${_pkgapp}/${_pkgapp}.AppImage"
    install -Dm755 "start" "${pkgdir}/usr/bin/${_pkgapp}"
    install -dm755 "${pkgdir}/usr/share/applications/"
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
    install -dm755 "${pkgdir}/usr/share/licenses/${_pkgapp}/"

    cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons/hicolor/scalable/apps/${_pkgapp}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
    cp --no-preserve=mode,ownership "${srcdir}/squashfs-root/${_pkgapp}.desktop" "${pkgdir}/usr/share/applications/"
    for i in ${srcdir}/squashfs-root/LICENSE.*; do
      cp --no-preserve=mode,ownership "${i}" "${pkgdir}/usr/share/licenses/${_pkgapp}"
    done
}
