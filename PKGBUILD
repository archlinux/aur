# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>

pkgname=kiibohd-configurator-bin
_shortname=kiibohd-configurator
_appimage="${pkgname}-${pkgver}-${pkgrel}.AppImage"
pkgver=1.1.0
pkgrel=1
pkgdesc='Configuration utility for Input Club keyboards'
arch=('x86_64')
url='https://github.com/kiibohd/configurator'
license=('GPL')
depends=('fuse2' 'zlib' 'hicolor-icon-theme' 'dfu-util')
provides=($_shortname)
conflicts=('kiibohd-configurator-git')
options=(!strip)
install="${pkgname}.install"
source=("${_appimage}::https://github.com/kiibohd/configurator/releases/download/v${pkgver}/${_shortname}-${pkgver}-linux-${CARCH}.AppImage"
        "98-kiibohd.rules"
)
sha256sums=('c6908bae5f7e1024cd653fbcbee3a32ecd10f365f32634b103f5f883f6f851af'
            '570124a77f39dc4b50afac411ffb5d5717aae176641c7b371b2fcfc02ee9807a')

prepare() {
    # Extract files from appimage
    chmod +x ${_appimage}
    ./${_appimage} --appimage-extract
}

package() {
    cd "$srcdir"

    # Install udev rules
    install -d "${pkgdir}/etc/udev/rules.d"
    install -Dm644 98-kiibohd.rules -t "${pkgdir}/etc/udev/rules.d"

    # Install appimage
    install -d "${pkgdir}/usr/bin"
    install -Dm755 "${_appimage}" -t "${pkgdir}/opt/${_shortname}"

    # Install icons
    install -dm755 "${pkgdir}/usr/share/icons/hicolor"
    find squashfs-root -type d -exec chmod 0755 {} \;
    cp -r squashfs-root/usr/share/icons/hicolor "${pkgdir}/usr/share/icons"

    # Install desktop file
    install -d "${pkgdir}/usr/share/applications"
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_shortname}|" "squashfs-root/${_shortname}.desktop"
    install -Dm644 "squashfs-root/${_shortname}.desktop" -t "${pkgdir}/usr/share/applications"

    # Symlink AppImage
    ln -s "/opt/${_shortname}/${_appimage}" "${pkgdir}/usr/bin/${_shortname}"
}
