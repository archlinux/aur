# Maintainer: Mikhail Velichko <efklid at gmail dot com>
# Contributor: Mikata Riko <sanbikappa at qq dot com>

pkgname=xppenlinux-v3
pkgver=3.4.9
pkgrel=240607
epoch=0
pkgdesc="XP-Pen (Official) Linux utility for legacy XPPen Tablets"
arch=('x86_64')
url='https://www.xp-pen.com/download/index.html'
license=('custom')
conflicts=('xp-pen-tablet' 'xppenlinux3')
source=("XPPenLinux${pkgver}-${pkgrel}.tar.gz::https://www.xp-pen.com/download/file/id/2901/pid/68/ext/gz.html")
install=${pkgname}.install

sha512sums=('40598c05d5ada0bd7a874b943e7819d6ffd0ef79d77e7433f814cfdc885846cc49276e1162e082bfe03f76b17f095323abfb8d5108f444cd30a685a0e0826ca4')

prepare() {
       #https://wiki.archlinux.org/title/Users_and_groups#Pre-systemd_groups
       #use udev uaccess for device permission
       cat <<EOF >$srcdir/XPPenLinux${pkgver}-${pkgrel}/App/lib/udev/rules.d/10-xp-pen.rules
KERNEL=="uinput",SUBSYSTEMS=="misc",MODE="0660",TAG+="uaccess",OPTIONS+="static_node=uinput"
SUBSYSTEMS=="usb",ATTRS{idVendor}=="28bd",MODE="0660",TAG+="uaccess"
EOF
}

package() {
       cp -r $srcdir/XPPenLinux${pkgver}-${pkgrel}/App/* $pkgdir
       cp -r $pkgdir/lib/* $pkgdir/usr/lib
       rm -r $pkgdir/lib
       chmod +0777 ${pkgdir}/usr/lib/pentablet/conf/xppen
       #Licence  information
       install -Dm0644 $pkgdir/usr/lib/pentablet/doc/EULA $pkgdir/usr/share/licenses/${pkgname}/LICENSE
       #Using systemd user service instead of mandatory autostart
       rm -r $pkgdir/etc
       mkdir -p $pkgdir/usr/lib/systemd/user
       cat <<EOF >$pkgdir/usr/lib/systemd/user/xppentablet.service
[Unit]
Description=XPPen Driver
Requires=xdg-desktop-autostart.target
After=xdg-desktop-autostart.target

[Service]
ExecStart=/usr/lib/pentablet/PenTablet.sh /mini

[Install]
WantedBy=xdg-desktop-autostart.target
EOF
}
