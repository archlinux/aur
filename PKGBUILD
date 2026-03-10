# Maintainer: stormix <hello@stormix.co>
pkgname=deadlock-modmanager-bin
pkgdesc='A mod manager for the Valve game Deadlock (binary)'
_pkgver=0.16.0
pkgver=${_pkgver}
pkgrel=1
arch=('x86_64')
url='https://github.com/deadlock-mod-manager/deadlock-mod-manager'
license=('GPL-3.0-only')
depends=('webkit2gtk-4.1' 'cairo' 'desktop-file-utils' 'xdg-utils' 'gdk-pixbuf2'
         'glib2' 'gtk3' 'libsoup3' 'pango' 'openssl' 'bzip2' 'hicolor-icon-theme'
         'gst-plugins-good')
provides=('deadlock-modmanager')
conflicts=('deadlock-modmanager' 'deadlock-modmanager-git')
options=('!strip')
source=("deadlock-modmanager-${pkgver}.deb::https://github.com/deadlock-mod-manager/deadlock-mod-manager/releases/download/v${_pkgver}/Deadlock.Mod.Manager_${_pkgver}_amd64.deb"
        "deadlock-modmanager.desktop::https://raw.githubusercontent.com/deadlock-mod-manager/deadlock-mod-manager/main/distribution/aur/deadlock-modmanager.desktop"
        "dev.stormix.deadlock-mod-manager.metainfo.xml::https://raw.githubusercontent.com/deadlock-mod-manager/deadlock-mod-manager/main/apps/desktop/src-tauri/dev.stormix.deadlock-mod-manager.metainfo.xml")
sha256sums=('13f6614efd618f830831b9c454ff84601a8e4d6d408cfd385d02ea110c3f4b3f'
            '74f91f52da072e31df1dd9df8e7339aa6328e8f6ed11e9b565858c6b9fab0740'
            '3de0d67af4113322cdb26031a466eb28950d7899877bc2e5dd4e09ccfb0fd2f1')

package() {
    tar xf data.tar.gz -C "${pkgdir}"

    # Rename binary and icons to match package name
    mv "${pkgdir}/usr/bin/deadlock-mod-manager" \
        "${pkgdir}/usr/bin/deadlock-modmanager"
    for icon in "${pkgdir}"/usr/share/icons/hicolor/*/apps/deadlock-mod-manager.png; do
        [ -f "${icon}" ] || continue
        mv "${icon}" "${icon%deadlock-mod-manager.png}deadlock-modmanager.png"
    done

    # Replace .deb's desktop entry with ours (correct binary name)
    rm -f "${pkgdir}/usr/share/applications/deadlock-mod-manager.desktop"
    install -Dm644 "${srcdir}/deadlock-modmanager.desktop" \
        "${pkgdir}/usr/share/applications/deadlock-modmanager.desktop"

    install -Dm644 "${srcdir}/dev.stormix.deadlock-mod-manager.metainfo.xml" \
        "${pkgdir}/usr/share/metainfo/dev.stormix.deadlock-mod-manager.metainfo.xml"
}

post_install() {
    gtk-update-icon-cache -q -t -f /usr/share/icons/hicolor
    update-desktop-database -q
}

post_upgrade() {
    post_install
}

post_remove() {
    post_install
}
