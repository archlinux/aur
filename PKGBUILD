# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>
# Contributor: Plague-doctor <plague at privacyrequired dot com>

pkgname=pcloud-drive
pkgver=1.14.5
pkgrel=1
pkgdesc='pCloud drive. Electron edition.'
arch=('x86_64')
url='https://www.pcloud.com/'
license=('custom')
depends=('fuse2' 'zlib' 'hicolor-icon-theme')
optdepends=('libappindicator-gtk3: Tray menu support')
options=(!strip)
replaces=('pcloud-git' 'pcloud')
_shortname='pcloud'
_appimage="${pkgname}-${pkgver}-${pkgrel}.AppImage"
_api_code='XZ0AMJ0ZdrENNeVMNI4Tz3lO1nxr577ryOMV'
_api_response="$(curl -s "https://api.pcloud.com/getpublinkdownload?code=${_api_code}")"
_dlhost="$(echo ${_api_response} | grep -E -o '[a-zA-Z0-9\-]+\.pcloud\.com' | head -n 2 | sort -R | head -n 1)"
_dlpath="$(echo ${_api_response} | grep -E -o "\"path\":\s{0,1}\".+\"" | cut -d '"' -f 4 | tr -d '\\')"
source=('LICENSE'
        "${_appimage}::https://${_dlhost}${_dlpath}")
sha256sums=('ba438cd891d5aeaf326b849d6191869bc8424c40418cca30cccbc33d23e62b20'
            '6b0edf0ea0d5894b4c6fbcc864ce6f23a2b4ae9b2c1a3fa2b96a4950930accc2')

prepare() {
    chmod +x ${_appimage}
    ./${_appimage} --appimage-extract
}

package() {
    cd "$srcdir"

    # Create Directories
    install -d "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/usr/share/icons/hicolor"

    # Install AppImage
    install -Dm755 "${_appimage}" -t "${pkgdir}/opt/${_shortname}"

    # Install License
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Install Icons, Desktop Shortcut
    find squashfs-root -type d -exec chmod 0755 {} \;
    cp -r squashfs-root/usr/share/icons/hicolor "${pkgdir}/usr/share/icons/"
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_shortname}|" "squashfs-root/${_shortname}.desktop"
    sed -i "s/Name=pcloud/Name=pCloud/" "squashfs-root/${_shortname}.desktop"
    install -Dm644 "squashfs-root/${_shortname}.desktop" -t "${pkgdir}/usr/share/applications/"

    # Symlink AppImage
    ln -s "/opt/${_shortname}/${_appimage}" "${pkgdir}/usr/bin/${_shortname}"
}
