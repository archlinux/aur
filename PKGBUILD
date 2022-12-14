# Maintainer: Plague-doctor <plague at privacyrequired dot com>
# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>

pkgname=pcloud-drive
pkgver=1.10.0
pkgrel=1
pkgdesc='pCloud drive. Electron edition.'
arch=('x86_64')
url='https://www.pcloud.com/'
license=('custom')
depends=('fuse2' 'zlib' 'hicolor-icon-theme')
options=(!strip)
replaces=('pcloud-git' 'pcloud')
_shortname='pcloud'
_appimage="${pkgname}-${pkgver}-${pkgrel}.AppImage"
_api_code='XZCy4sVZGb7r8VpDE4SCv2QI3OYx1HYChIvy'
_api_response="$(curl -s "https://api.pcloud.com/getpublinkdownload?code=${_api_code}")"
_dlhost="$(echo ${_api_response} | grep -E -o '[a-zA-Z0-9\-]+\.pcloud\.com' | head -n 2 | sort -R | head -n 1)"
_dlpath="$(echo ${_api_response} | grep -E -o "\"path\":\s{0,1}\".+\"" | cut -d '"' -f 4 | tr -d '\\')"
source=('LICENSE'
        "${_appimage}::https://${_dlhost}${_dlpath}")
sha256sums=('d512ec90082d82ef0e1fe5d7b14d63ae835f955d3119436d5c08761ff4e3366a'
            '6cd0bf57c32e1c1304a20189ffb82b9b52947f813037a26d9f7eaeaacc033109')

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
