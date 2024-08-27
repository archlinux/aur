# Maintainer: Mikata Riko<sanbikappa at qq dot com>
# Contributor: Mikhail Velichko <efklid at gmail dot com>

pkgname=xppenlinux3
pkgver=3.4.9
pkgrel=240607
epoch=0
pkgdesc="XP-Pen (Official) Linux utility for legacy XPPen Tablets"
arch=('x86_64')
url='https://www.xp-pen.com/download/index.html'
license=('custom')
conflicts=('xp-pen-tablet' 'xppenlinux-v3')
source=("XPPenLinux${pkgver}-${pkgrel}.tar.gz::https://download01.xp-pen.com/file/2024/06/XPPenLinux3.4.9-240607.tar.gz")
install=${pkgname}.install
sha512sums=('40598c05d5ada0bd7a874b943e7819d6ffd0ef79d77e7433f814cfdc885846cc49276e1162e082bfe03f76b17f095323abfb8d5108f444cd30a685a0e0826ca4')

package() {
        cp -r ${srcdir}/XPPenLinux${pkgver}-${pkgrel}/App/usr ${pkgdir}
        echo "Change file permission according to install.sh script."
        chmod -v 0777 ${pkgdir}/usr/lib/pentablet/conf/xppen
        chmod -v 0666 ${pkgdir}/usr/lib/pentablet/conf/xppen/{*.xml,*.ini}
        chmod -v 0755 ${pkgdir}/usr/lib/pentablet/PenTablet.sh
        chmod -v 0555 ${pkgdir}/usr/lib/pentablet/PenTablet
        chmod -v 0666 ${pkgdir}/usr/lib/pentablet/resource.rcc

        chmod -v 0444 ${pkgdir}/usr/share/applications/xppentablet.desktop
        #TODO: why .png file requires +x permission?(from 0644 to 0555)
        #chmod -v 0555 ${pkgdir}/usr/share/icons/hicolor/256x256/apps/xppentablet.png

        mkdir -p ${pkgdir}/usr/bin
        ln -s /usr/lib/pentablet/PenTablet.sh ${pkgdir}/usr/bin/${pkgname}

        cp -r ${srcdir}/XPPenLinux${pkgver}-${pkgrel}/App/lib/udev ${pkgdir}/usr/lib
        #patch 10-xp-pen.rules
        #https://wiki.archlinux.org/title/Users_and_groups#Pre-systemd_groups
        #use udev uaccess for device permission
        cat <<EOF >${pkgdir}/usr/lib/udev/rules.d/10-xp-pen.rules
KERNEL=="uinput",SUBSYSTEMS=="misc",MODE="0660",TAG+="uaccess",OPTIONS+="static_node=uinput"
SUBSYSTEMS=="usb",ATTRS{idVendor}=="28bd",MODE="0660",TAG+="uaccess"
EOF

        #Using systemd user service instead of mandatory autostart
        mkdir -p ${pkgdir}/usr/lib/systemd/user
        cat <<EOF >${pkgdir}/usr/lib/systemd/user/${pkgname}.service
[Unit]
Description=XPPen Driver
Requires=xdg-desktop-autostart.target
After=xdg-desktop-autostart.target

[Service]
ExecStart=/usr/lib/pentablet/PenTablet.sh /mini

[Install]
WantedBy=xdg-desktop-autostart.target
EOF

        #Licence information
        mkdir -p ${pkgdir}/usr/share/licenses/
        mv ${pkgdir}/usr/lib/pentablet/doc ${pkgdir}/usr/share/licenses/${pkgname}

}
