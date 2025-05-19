# Maintainer: SibbyAru <sibbyaru@gmail.com>

pkgname=miru-hayase-bin
_installed_app_dir_name="Miru"
_hayase_version=6.3.2
_release_tag_version=6.1.0

pkgver=${_hayase_version}
pkgrel=1
pkgdesc="Anime streaming application (Hayase ${_hayase_version}, pre-compiled from release v${_release_tag_version})"
arch=('x86_64')
url="https://github.com/ThaUnknown/miru"
license=('GPL3')
depends=(
    'xdg-utils'
    'ffmpeg'
    'gtk3'
    'nss'
    'alsa-lib'
    'libxss'
    'libxtst'
)
options=('!strip' '!emptydirs')
install=${pkgname}.install

_deb_filename="linux-hayase-${_hayase_version}-linux.deb"

source_x86_64=(
    "${_deb_filename}::https://github.com/ThaUnknown/miru/releases/download/v${_release_tag_version}/${_deb_filename}"
    "LICENSE_GPL3::https://raw.githubusercontent.com/ThaUnknown/miru/v${_release_tag_version}/LICENSE"
)
sha256sums_x86_64=(
    '6035f9fcbf5cb251468ef305ca74b47e5ac3099f79979a14e567a3a2d06ac6e0'
    '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
)

package() {
    cd "${srcdir}"

    local data_tar_file=""
    if bsdtar -tf "${_deb_filename}" | grep -qE '^data\.tar\.(xz|gz|zst)$'; then
        data_tar_file=$(bsdtar -tf "${_deb_filename}" | grep -E '^data\.tar\.(xz|gz|zst)$' | head -n1)
    fi

    if [ -n "$data_tar_file" ]; then
        bsdtar -xf "${_deb_filename}" "$data_tar_file"
        case "$data_tar_file" in
            *.xz) tar -xJf "$data_tar_file" -C "${pkgdir}" ;;
            *.gz) tar -xzf "$data_tar_file" -C "${pkgdir}" ;;
            *.zst) tar -xIf zstd -f "$data_tar_file" -C "${pkgdir}" ;;
            *) error "Unknown compression for $data_tar_file"; return 1 ;;
        esac
    else
        error "Could not find data.tar archive in the .deb package: ${_deb_filename}"
        return 1
    fi

    install -Dm644 "${srcdir}/LICENSE_GPL3" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_GPL3"

    if [ -f "${pkgdir}/opt/${_installed_app_dir_name}/LICENSES.chromium.html" ]; then
        install -Dm644 "${pkgdir}/opt/${_installed_app_dir_name}/LICENSES.chromium.html" \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_chromium"
    fi

    local actual_icon_name="hayase"
    local consistent_desktop_basename="${pkgname%-bin}"

    if [ ! -f "${pkgdir}/usr/share/icons/hicolor/320x320/apps/${actual_icon_name}.png" ]; then
         msg2 "WARNING: Icon file (${actual_icon_name}.png) not found where expected after .deb extraction."
    fi

    local source_desktop_file_path=""
    if [ -f "${pkgdir}/usr/share/applications/${actual_icon_name}.desktop" ]; then
        source_desktop_file_path="${pkgdir}/usr/share/applications/${actual_icon_name}.desktop"
    elif [ -f "${pkgdir}/usr/share/applications/miru.desktop" ]; then
        source_desktop_file_path="${pkgdir}/usr/share/applications/miru.desktop"
    fi

    local target_desktop_file_path="${pkgdir}/usr/share/applications/${consistent_desktop_basename}.desktop"

    if [ -n "${source_desktop_file_path}" ]; then
        sed -i "s|^Icon=.*|Icon=${actual_icon_name}|" "${source_desktop_file_path}"
        if [ "${source_desktop_file_path}" != "${target_desktop_file_path}" ]; then
            mv "${source_desktop_file_path}" "${target_desktop_file_path}"
        fi

        sed -i "s|^Name=.*|Name=Miru (Hayase)|" "${target_desktop_file_path}"
        sed -i "s|^Comment=.*|Comment=${pkgdesc}|" "${target_desktop_file_path}"
        sed -i "s|^Exec=.*|Exec=miru %U|" "${target_desktop_file_path}"
        sed -i "s|^StartupWMClass=.*|StartupWMClass=Miru|" "${target_desktop_file_path}"
        grep -qxF 'Version=1.0' "${target_desktop_file_path}" || echo 'Version=1.0' >> "${target_desktop_file_path}"
    else
        install -Dm644 /dev/stdin "${target_desktop_file_path}" <<EOF
[Desktop Entry]
Version=1.0
Name=Miru (Hayase)
GenericName=Anime Streamer
Comment=${pkgdesc}
Exec=miru %U
Icon=${actual_icon_name}
Terminal=false
Type=Application
Categories=AudioVideo;Video;Player;Network;
StartupWMClass=Miru
EOF
    fi
}
