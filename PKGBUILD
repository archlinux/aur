# Maintainer: stormix <hello@stormix.co>
pkgname=deadlock-modmanager-bin
pkgdesc='A mod manager for the Valve game Deadlock (binary)'
_pkgver=1.1.0
pkgver=${_pkgver}
pkgrel=3
arch=('x86_64')
url='https://github.com/deadlock-mod-manager/deadlock-mod-manager'
license=('GPL-3.0-only')
depends=('webkit2gtk-4.1' 'cairo' 'desktop-file-utils' 'xdg-utils' 'gdk-pixbuf2'
         'glib2' 'gtk3' 'libsoup3' 'pango' 'openssl' 'bzip2' 'hicolor-icon-theme'
         'gst-plugins-good' 'glibc' 'libgcc' 'libstdc++' 'dbus')
provides=('deadlock-modmanager')
conflicts=('deadlock-modmanager' 'deadlock-modmanager-git')
options=('!strip')
source=("deadlock-modmanager-${pkgver}.deb::https://github.com/deadlock-mod-manager/deadlock-mod-manager/releases/download/v${_pkgver}/Deadlock.Mod.Manager_${_pkgver}_amd64.deb"
        "deadlock-modmanager.desktop::https://raw.githubusercontent.com/deadlock-mod-manager/deadlock-mod-manager/v${_pkgver}/distribution/aur/deadlock-modmanager.desktop"
        "dev.stormix.deadlock-mod-manager.metainfo.xml::https://raw.githubusercontent.com/deadlock-mod-manager/deadlock-mod-manager/v${_pkgver}/apps/desktop/src-tauri/dev.stormix.deadlock-mod-manager.metainfo.xml")
sha256sums=('18a1eb0e68d794365ff67be2e9a733b93de0902246d956b17b73cc6430205009'
            '74f91f52da072e31df1dd9df8e7339aa6328e8f6ed11e9b565858c6b9fab0740'
            '9972534fb418587adc14ec23c231f60c0082bc317072c5ae69a6e1e48018a7c5')

package() {
    tar xf data.tar.gz -C "${pkgdir}"

    local _hicolor="${pkgdir}/usr/share/icons/hicolor"

    # Rename binary and icons to match package name
    mv "${pkgdir}/usr/bin/deadlock-mod-manager" \
        "${pkgdir}/usr/bin/deadlock-modmanager"

    # The .deb's 2x icon lands in "256x256@2", which no icon theme reads
    if [ -d "${_hicolor}/256x256@2/apps" ]; then
        install -d "${_hicolor}/256x256/apps"
        mv "${_hicolor}/256x256@2/apps/"*.png "${_hicolor}/256x256/apps/"
        rm -rf "${_hicolor}/256x256@2"
    fi

    for icon in "${_hicolor}"/*/apps/deadlock-mod-manager.png; do
        [ -f "${icon}" ] || continue
        mv "${icon}" "${icon%deadlock-mod-manager.png}deadlock-modmanager.png"
    done

    # Drop the .deb's own entry (named after productName) and install ours
    rm -f "${pkgdir}"/usr/share/applications/*.desktop
    install -Dm644 "${srcdir}/deadlock-modmanager.desktop" \
        "${pkgdir}/usr/share/applications/deadlock-modmanager.desktop"

    install -Dm644 "${srcdir}/dev.stormix.deadlock-mod-manager.metainfo.xml" \
        "${pkgdir}/usr/share/metainfo/dev.stormix.deadlock-mod-manager.metainfo.xml"
}
