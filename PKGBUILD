# Maintainer: orange-guo
# Packaging Repo: https://github.com/orange-guo/aur-packages/tree/main/packages/fingerprint-chromium-bin
pkgname=fingerprint-chromium-bin
pkgver=148.0.7778.215
pkgrel=1
pkgdesc=Fingerprint\ Chromium\ \(Ungoogled\ Chromium\ with\ fingerprinting\ protection\)
arch=(x86_64 )
url=https://github.com/adryfish/fingerprint-chromium
license=(BSD )
depends=(gtk3 nss alsa-lib xdg-utils libxss ttf-liberation )
makedepends=()
checkdepends=()
optdepends=()
options=(\!strip )
provides=(fingerprint-chromium )
conflicts=(fingerprint-chromium )
validpgpkeys=()

source=()
sha256sums_x86_64=('a5fa5e6c05cb7fa3617ec2ca642ad3cc6e586ac5249cc29edb0a602d695685f0')
source_x86_64=(fingerprint-chromium-bin-148.0.7778.215-x86_64.AppImage::https://github.com/adryfish/fingerprint-chromium/releases/download/148.0.7778.215/ungoogled-chromium-148.0.7778.215-1-x86_64.AppImage )

_appimage_source_file=fingerprint-chromium-bin-148.0.7778.215-x86_64.AppImage
_appimage_appdir_name=squashfs-root
_appimage_install_dir=fingerprint-chromium
_install_bin_path=/usr/bin/fingerprint-chromium
_install_bin_dir=/usr/bin
_desktop_exec_rewrite=/usr/bin/fingerprint-chromium
_desktop_name_rewrite=Fingerprint\ Chromium
_service_file=''
_service_install_path=''
_desktop_candidates=(ungoogled-chromium.desktop fingerprint-chromium.desktop )
_icon_candidates=(product_logo_256.png )
_license_files=()


prepare() {
    rm -rf "${srcdir}/${_appimage_appdir_name}"
    chmod +x "${srcdir}/${_appimage_source_file}"
    "${srcdir}/${_appimage_source_file}" --appimage-extract >/dev/null
}

package() {
    install -d "${pkgdir}/opt/${_appimage_install_dir}"
    cp -r "${srcdir}/${_appimage_appdir_name}/." "${pkgdir}/opt/${_appimage_install_dir}/"
    chmod -R a+rX "${pkgdir}/opt/${_appimage_install_dir}"

    install -d "${pkgdir}${_install_bin_dir}"
    ln -sf "/opt/${_appimage_install_dir}/AppRun" "${pkgdir}${_install_bin_path}"

    local desktop_candidate=""
    local candidate
    for candidate in "${_desktop_candidates[@]}"; do
        if [ -f "${srcdir}/${_appimage_appdir_name}/${candidate}" ]; then
            desktop_candidate="${candidate}"
            break
        fi
    done

    if [ -n "${desktop_candidate}" ]; then
        install -Dm644 "${srcdir}/${_appimage_appdir_name}/${desktop_candidate}" "${pkgdir}/usr/share/applications/fingerprint-chromium.desktop"
        if [ -n "${_desktop_exec_rewrite}" ]; then
            sed -i "s|^Exec=.*|Exec=${_desktop_exec_rewrite}|" "${pkgdir}/usr/share/applications/fingerprint-chromium.desktop"
        fi
        if [ -n "${_desktop_name_rewrite}" ]; then
            sed -i "s|^Name=.*|Name=${_desktop_name_rewrite}|" "${pkgdir}/usr/share/applications/fingerprint-chromium.desktop"
        fi
    fi

    local icon_candidate=""
    for candidate in "${_icon_candidates[@]}"; do
        if [ -f "${srcdir}/${_appimage_appdir_name}/${candidate}" ]; then
            icon_candidate="${candidate}"
            break
        fi
    done

    if [ -n "${icon_candidate}" ]; then
        install -Dm644 "${srcdir}/${_appimage_appdir_name}/${icon_candidate}" "${pkgdir}/usr/share/pixmaps/fingerprint-chromium.png"
        if [ -f "${pkgdir}/usr/share/applications/fingerprint-chromium.desktop" ]; then
            sed -i "s|^Icon=.*|Icon=fingerprint-chromium|" "${pkgdir}/usr/share/applications/fingerprint-chromium.desktop"
        fi
    fi

    local license_file
    for license_file in "${_license_files[@]}"; do
        [ -f "${srcdir}/${license_file}" ] || [ -f "${srcdir}/${_appimage_appdir_name}/${license_file}" ] || continue
        if [ -f "${srcdir}/${license_file}" ]; then
            install -Dm644 "${srcdir}/${license_file}" "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${license_file}")"
        else
            install -Dm644 "${srcdir}/${_appimage_appdir_name}/${license_file}" "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${license_file}")"
        fi
    done

    if [ -n "${_service_file}" ] && [ -f "${srcdir}/${_service_file}" ]; then
        install -Dm644 "${srcdir}/${_service_file}" "${pkgdir}${_service_install_path}"
    fi
}
