# Maintainer: Deltachaos <mr@deltachaos.de>

pkgname=raiderio-client
_pkgapp=raiderio-client
pkgver=6.0.6
pkgrel=1
pkgdesc="raider.io desktop client for Linux"
arch=('x86_64' 'aarch64')
depends=("fuse2")
url="https://raider.io/"
source=('start')
source_x86_64=("$_pkgapp-x86_64-${pkgver}.AppImage::https://github.com/RaiderIO/raiderio-client-builds/releases/download/v6.0.6/RaiderIO_Installer_Linux_x86_64.AppImage")
source_aarch64=("$_pkgapp-aarch64-${pkgver}.AppImage::https://github.com/RaiderIO/raiderio-client-builds/releases/download/v6.0.6/RaiderIO_Installer_Linux_arm64.AppImage")
license=('custom' 'MIT' 'custom:chromium-licenses')
options=(!strip)
# Skip checksum check for the RaiderIO binary, to avoid breakage on updates
sha512sums=('ee0cb07b4bf56ed43bf163f0141d5165889b051fe0aaf52f46789f67f6ab896f7d69c3527ab77bb1fd70e3c7c6a6611e691fd8ad91edd1db35a2252f10bef9a9')
sha512sums_x86_64=('d5e6d9aacc7c1226cb21396c1fe75807d349f16aaf0c90ac3ca5b2caa684da989a35f4e485bb0b9d1ac8f31d6a667273dddea65e945c3ef7681de2314405a2a0')
sha512sums_aarch64=('7a2e8636d66649ad80473b3dd6b14c8eb550f23950159d9df8e4efd876564bcae34169d8da12a22af71e6da418ee328713aba95d17f31cd544588b5c4d7b7b13')

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
    chmod +x ${srcdir}/${_pkgapp}-${CARCH}-${pkgver}.AppImage
    ${srcdir}/${_pkgapp}-${CARCH}-${pkgver}.AppImage --appimage-extract >/dev/null

    normalize_desktop

    cat ${srcdir}/squashfs-root/${_pkgapp}.desktop | grep 'X-AppImage-Version' | sed 's!^X-AppImage-Version=!!g'
}

package() {
    cd ${srcdir}
    rm -rf "${srcdir}/squashfs-root"
    chmod +x ${srcdir}/${_pkgapp}-${CARCH}-${pkgver}.AppImage
    ./${_pkgapp}-${CARCH}-${pkgver}.AppImage --appimage-extract >/dev/null

    normalize_desktop

    sed -i 's/Exec=.*/Exec=\/usr\/bin\/'${_pkgapp}' %U/' squashfs-root/${_pkgapp}.desktop

    install -Dm755 ${_pkgapp}-${CARCH}-${pkgver}.AppImage "${pkgdir}/opt/${_pkgapp}/${_pkgapp}.AppImage"
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
