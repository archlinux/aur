# Maintainer: Mikhail Velichko <efklid at gmail dot com>
# Contributor: Moon Sungjoon <sumoon at seoulsaram dot org>
# Contributor: Hurstel Alexandre <alexandre at hurstel dot eu>
# Contributor: Tobias Manske <aur at rad4day dot de>
# Contributor: Mikata Riko <sanbikappa at qq dot com>

pkgname=xp-pen-tablet
pkgver=4.0.5
pkgrel=241126
epoch=0
pkgdesc="XP-Pen (Official) Linux utility (New UI driver)"
arch=('x86_64')
url='https://www.xp-pen.com/download/index.html'
license=('custom')
source=("XPPenLinux${pkgver}-${pkgrel}.deb::https://www.xp-pen.com/download/file.html?id=3561&pid=1179&ext=deb")
install=${pkgname}.install

sha512sums=('35d093089c76f3d912805004d0e5e6291b50f3cd0d3f31e02440d3f5e079d54cbbf8c476205feb6653f47507a0b59211f2568102505728fd3a10db73e19bf282')

prepare() {
    tar -xf data.tar.xz
}

package() {
       cp -dr --no-preserve=ownership usr  ${pkgdir}/
       chmod +0777 ${pkgdir}/usr/lib/pentablet/conf/xppen
       install -Dm0644 ${pkgdir}/usr/lib/pentablet/doc/EULA ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
       #https://wiki.archlinux.org/title/Users_and_groups#Pre-systemd_groups
       #use udev uaccess for device permission
       mkdir -p ${pkgdir}/usr/lib/udev/rules.d/
       cat <<EOF >${pkgdir}/usr/lib/udev/rules.d/10-xp-pen.rules
KERNEL=="uinput",SUBSYSTEMS=="misc",MODE="0660",TAG+="uaccess",OPTIONS+="static_node=uinput"
SUBSYSTEMS=="usb",ATTRS{idVendor}=="28bd",MODE="0660",TAG+="uaccess"
EOF
       #Using systemd user service instead of mandatory autostart
       mkdir -p ${pkgdir}/usr/lib/systemd/user
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

