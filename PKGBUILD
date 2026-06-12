# Maintainer: Mikhail Velichko <efklid at gmail dot com>
# Contributor: Moon Sungjoon <sumoon at seoulsaram dot org>
# Contributor: Hurstel Alexandre <alexandre at hurstel dot eu>
# Contributor: Tobias Manske <aur at rad4day dot de>
# Contributor: Mikata Riko <sanbikappa at qq dot com>

pkgname=xp-pen-tablet
pkgver=4.0.15
_vendor_rel=260422
pkgrel=${_vendor_rel}.1
pkgdesc="XP-Pen (Official) Linux utility (New UI driver)"
arch=('x86_64')
url='https://www.xp-pen.com/download/index.html'
license=('custom')
source=("XPPenLinux${pkgver}-${_vendor_rel}.deb::https://download01.xp-pen.com/file/2026/04/XPPenLinux${pkgver}-${_vendor_rel}.deb")
install=${pkgname}.install

sha512sums=('ebaabc40973fa466b99af4e5b8158053bae07e13cdb009421df31b0b67c8479ad8c4dad0213061fa413f3c57011fd3940ef516d7bc0034796a152dc1c116c348')

prepare() {
    tar -xf data.tar.xz
}

package() {
       cp -dr --no-preserve=ownership usr  ${pkgdir}/
       # conf files: set ownership and permissions for pre-existing files at install time.
       # new files created by the app at runtime inherit group via setgid on the directory (see tmpfiles.d below).
       chown root:users "${pkgdir}"/usr/lib/pentablet/conf/xppen/*
       chmod 0664 "${pkgdir}"/usr/lib/pentablet/conf/xppen/*
       # libraries: read-only
       chmod 0644 "${pkgdir}"/usr/lib/pentablet/lib/*.so.*
       chmod 0644 "${pkgdir}/usr/lib/pentablet/platforms/libqxcb.so"
       chmod 0644 "${pkgdir}/usr/share/applications/xppentablet.desktop"
       chmod 0644 "${pkgdir}/usr/share/icons/hicolor/256x256/apps/xppentablet.png"
       install -Dm0644 ${pkgdir}/usr/lib/pentablet/doc/EULA ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
       # conf directory: tmpfiles.d sets setgid so files created by the app inherit group users
       mkdir -p "${pkgdir}/usr/lib/tmpfiles.d"
       cat <<EOF >"${pkgdir}/usr/lib/tmpfiles.d/xp-pen-tablet.conf"
d /usr/lib/pentablet/conf/xppen 2775 root users - -
EOF
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
Environment=QT_QPA_PLATFORM=xcb
ExecStart=/usr/lib/pentablet/PenTablet.sh /mini

[Install]
WantedBy=xdg-desktop-autostart.target
EOF
}

