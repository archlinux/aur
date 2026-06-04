# Maintainer: zbe <aur at zbe dot bz>
# Maintainer: Winston Astrachan <rew1red at rew1 dot red>
# Contributor: Plague-doctor <plague at privacyrequired dot com>

pkgname=pcloud-drive
pkgver=2.1.1
pkgrel=1
pkgdesc='pCloud drive. Electron edition.'
arch=('x86_64')
url='https://www.pcloud.com/'
license=("LicenseRef-${pkgname}")
depends=('fuse2' 'zlib' 'hicolor-icon-theme')
optdepends=('libappindicator-gtk3: Tray menu support')
options=(!strip !debug)
install="${pkgname}.install"
replaces=('pcloud-git' 'pcloud')
_shortname='pcloud'
_appimage="${pkgname}-${pkgver}-${pkgrel}.AppImage"
_api_code='XZtwII5Zjf5noLYtDwJ1qkyAXaqujuvVKBbX'
_api_response="$(curl -s "https://api.pcloud.com/getpublinkdownload?code=${_api_code}")"
_dlhost="$(echo ${_api_response} | grep -E -o '[a-zA-Z0-9\-]+\.pcloud\.com' | head -n 2 | sort -R | head -n 1)"
_dlpath="$(echo ${_api_response} | grep -E -o "\"path\":\s{0,1}\".+\"" | cut -d '"' -f 4 | tr -d '\\')"
source=('LICENSE'
        "${_appimage}::https://${_dlhost}${_dlpath}")
sha256sums=('9dce0249569d9dc9f00217009880458cf669a657ebb6604b4e52be4e875f1a42'
            '5b36540d4e33be0c4418fa41dfad9c7910112413cc2187be0537c3b1a4245364')

prepare() {
    chmod +x "${_appimage}"
    "./${_appimage}" --appimage-extract
}

package() {
    cd "${srcdir}"

    # Create Directories
    install -d "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/usr/share/icons/hicolor"

    # Install AppImage
    install -Dm755 "${_appimage}" "${pkgdir}/opt/${_shortname}/${_shortname/c/C}.AppImage"

    # Install License
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Install Icons, Desktop Shortcut
    find squashfs-root -type d -exec chmod 0755 {} \;
    cp -r squashfs-root/usr/share/icons/hicolor "${pkgdir}/usr/share/icons/"

    # Update desktop file entries
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_shortname}|" \
        "squashfs-root/${_shortname}.desktop"
    sed -i "s/Name=pcloud/Name=pCloud/" "squashfs-root/${_shortname}.desktop"

    # Install desktop file
    install -Dm644 "squashfs-root/${_shortname}.desktop" -t "${pkgdir}/usr/share/applications/"

    # Symlink AppImage
    ln -sf "/opt/${_shortname}/${_shortname/c/C}.AppImage" "${pkgdir}/usr/bin/${_shortname}"
}
