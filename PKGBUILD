# Maintainer: Mikhail Velichko <efklid at gmail dot com>
# Contributor: Moon Sungjoon <sumoon at seoulsaram dot org>
# Contributor: Hurstel Alexandre <alexandre at hurstel dot eu>
# Contributor: Tobias Manske <aur at rad4day dot de>
# Contributor: Mikata Riko <sanbikappa at qq dot com>

pkgname=xp-pen-tablet
pkgver=4.0.7
pkgrel=250117
epoch=0
pkgdesc="XP-Pen (Official) Linux utility (New UI driver)"
arch=('x86_64')
url='https://www.xp-pen.com/download/index.html'
license=('custom')
source=("XPPenLinux${pkgver}-${pkgrel}.deb::https://www.xp-pen.com/download/file.html?id=3665&pid=1211&ext=deb")
install=${pkgname}.install

sha512sums=('3e56cac17a58fff8b9bb55fe0a2ed961391d3679181dac4aafc4c3da998d4b0ebc9523d1ebc010f2d3065833d61787204c1b040cc613c192871eb34c80f5a2af')

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

