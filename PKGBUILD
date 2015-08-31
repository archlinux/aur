# Maintainer: Martin Wimpress <code@flexion.org>

pkgname=btsync-gui
pkgver=0.8.5
_pkgupd=1
pkgrel=2
pkgdesc="Unofficial Bittorrent Sync GUI for Linux desktops."
arch=('any')
url="http://www.yeasoft.com/site/projects:btsync-deb:btsync-gui"
license=('GPL2')
depends=('hicolor-icon-theme' 'python2-dbus' 'python2-gobject' 'python2-requests' 'python2-qrencode' 'pygtk')
optdepends=('btsync: btsync 2.0'
            'btsync-1.4: bysync 1.4 (beta)')
makedepends=('gettext')
conflicts=('btsyncindicator' 'btsync-autoconfig')
source=("https://github.com/tuxpoldo/btsync-deb/archive/${pkgname}-${pkgver}-${_pkgupd}.tar.gz"
        "${pkgname}.key")
sha1sums=('4aa45155166e3e0eb68961782872911fa7cb98da'
          '2a0f2cc3004e248b3f3548f325e1b03cb384bc20')
install="${pkgname}.install"

prepare() {
    cd "${srcdir}/btsync-deb-${pkgname}-${pkgver}-${_pkgupd}/${pkgname}"
    # Arch Linux compatibility patches
    sed -i 's|env python|env python2|' ${pkgname}
    sed -i 's|/usr/lib/btsync-common/btsync-core|/usr/bin/btsync|' btsyncagent.py
}

package() {
    cd "${srcdir}/btsync-deb-${pkgname}-${pkgver}-${_pkgupd}/${pkgname}"
    install -d -m 0755 "${pkgdir}/usr/bin"
    install -m 0755 ${pkgname} "${pkgdir}/usr/bin/"

    install -d -m 0755 "${pkgdir}/usr/lib/${pkgname}"
    install -m 0755 *.py "${pkgdir}/usr/lib/${pkgname}"
    install -m 0644 *.glade "${pkgdir}/usr/lib/${pkgname}"
    install -m 0644 "${srcdir}/${pkgname}.key" "${pkgdir}/usr/lib/${pkgname}"

    install -d -m 0755 "${pkgdir}/usr/share/applications"
    install -m 0644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/"

    install -d -m 0755 "${pkgdir}/usr/share/man/man7"
    install -m 0644 ${pkgname}.7 "${pkgdir}/usr/share/man/man7/"

    install -d -m 0755 "${pkgdir}/usr/share/doc/${pkgname}"
    install -m 0644 *.md "${pkgdir}/usr/share/doc/${pkgname}"

    cd "${srcdir}/btsync-deb-${pkgname}-${pkgver}-${_pkgupd}/${pkgname}/icons"
    for ICON in *
    do
        if [ -d ${ICON}/apps ]; then
            install -d -m 0755 "${pkgdir}/usr/share/icons/hicolor/${ICON}/apps"
            install -m 0644 ${ICON}/apps/* "${pkgdir}/usr/share/icons/hicolor/${ICON}/apps/"
        fi
        if [ -d ${ICON}/status ]; then
            install -d -m 0755 "${pkgdir}/usr/share/icons/hicolor/${ICON}/status"
            install -m 0644 ${ICON}/status/* "${pkgdir}/usr/share/icons/hicolor/${ICON}/status/"
        fi
    done

    cd "${srcdir}/btsync-deb-${pkgname}-${pkgver}-${_pkgupd}/${pkgname}/po"
    for PO in *.po
    do
        LANG_CODE=`basename ${PO} .po`
        install -d -m 0755 "${pkgdir}/usr/share/locale/${LANG_CODE}/LC_MESSAGES"
        msgfmt -c ${PO} -o "${pkgdir}/usr/share/locale/${LANG_CODE}/LC_MESSAGES/btsync-gui.mo" 2>/dev/null
    done
}
