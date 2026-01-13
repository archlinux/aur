# Maintainer: Mikhail Velichko <efklid at gmail dot com>
# Contributor: Moon Sungjoon <sumoon at seoulsaram dot org>
# Contributor: Hurstel Alexandre <alexandre at hurstel dot eu>
# Contributor: Tobias Manske <aur at rad4day dot de>
# Contributor: Mikata Riko <sanbikappa at qq dot com>

pkgname=xp-pen-tablet
pkgver=4.0.13
pkgrel=251226
epoch=0
pkgdesc="XP-Pen (Official) Linux utility (New UI driver)"
arch=('x86_64')
url='https://www.xp-pen.com/download/index.html'
license=('custom')
source=("XPPenLinux${pkgver}-${pkgrel}.deb::https://www.xp-pen.com/download/file.html?id=3665&pid=1211&ext=deb")
install=${pkgname}.install

sha512sums=('03bd071184f327adce3618b703b1e65338c2c83b5d8242e81c2f0184f6eafa1f1740441b9b88cd7f728f4f83e980ab0f1b28ff28274757fa61a601a028854205')

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

