# Maintainer: Mikhail Velichko <efklid at gmail dot com>
# Contributor: Mikata Riko <sanbikappa at qq dot com>

pkgname=xppenlinux-v3
pkgver=3.4.9
_vendor_rel=240607
pkgrel=${_vendor_rel}.2
pkgdesc="XP-Pen (Official) Linux utility for legacy XPPen Tablets"
arch=('x86_64')
url='https://www.xp-pen.com/download/index.html'
license=('custom')
conflicts=('xp-pen-tablet' 'xppenlinux3')
source=("XPPenLinux${pkgver}-${_vendor_rel}.tar.gz::https://www.xp-pen.com/download/file/id/2901/pid/68/ext/gz.html")
install=${pkgname}.install

sha512sums=('40598c05d5ada0bd7a874b943e7819d6ffd0ef79d77e7433f814cfdc885846cc49276e1162e082bfe03f76b17f095323abfb8d5108f444cd30a685a0e0826ca4')

prepare() {
       #https://wiki.archlinux.org/title/Users_and_groups#Pre-systemd_groups
       #use udev uaccess for device permission
       cat <<EOF >$srcdir/XPPenLinux${pkgver}-${_vendor_rel}/App/lib/udev/rules.d/10-xp-pen.rules
KERNEL=="uinput",SUBSYSTEMS=="misc",MODE="0660",TAG+="uaccess",OPTIONS+="static_node=uinput"
SUBSYSTEMS=="usb",ATTRS{idVendor}=="28bd",MODE="0660",TAG+="uaccess"
EOF
}

package() {
       cp -r $srcdir/XPPenLinux${pkgver}-${_vendor_rel}/App/* $pkgdir
       cp -r $pkgdir/lib/* $pkgdir/usr/lib
       rm -r $pkgdir/lib
       # per-user tempdir for manual launches (.desktop -> PenTablet.sh): keep Qt's
       # single-instance socket+lockfile in /run/user/UID so parallel logins don't collide
       # on a shared /tmp lockfile. The systemd service sets TMPDIR=%t; ${TMPDIR:-...} respects it.
       sed -i '/export LD_LIBRARY_PATH/a if [ -n "$XDG_RUNTIME_DIR" ]; then export TMPDIR="${TMPDIR:-$XDG_RUNTIME_DIR}"; fi' "${pkgdir}/usr/lib/pentablet/PenTablet.sh"
       chown root:users "${pkgdir}/usr/lib/pentablet/conf/xppen"
       chmod 2775 "${pkgdir}/usr/lib/pentablet/conf/xppen"
       chown root:users "${pkgdir}"/usr/lib/pentablet/conf/xppen/*
       chmod 0664 "${pkgdir}"/usr/lib/pentablet/conf/xppen/*
       chmod 0644 "${pkgdir}"/usr/lib/pentablet/lib/*.so.*
       chmod 0644 "${pkgdir}/usr/lib/pentablet/platforms/libqxcb.so"
       mkdir -p "${pkgdir}/usr/lib/tmpfiles.d"
       cat <<EOF >"${pkgdir}/usr/lib/tmpfiles.d/xppenlinux-v3.conf"
d /usr/lib/pentablet/conf/xppen 2775 root users - -
EOF
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
Environment=QT_QPA_PLATFORM=xcb
# per-user tempdir (/run/user/UID): QtSingleApplication keeps its socket+lockfile here,
# so parallel logins don't collide on a shared /tmp lockfile (see qtsingleapp-* handling)
Environment=TMPDIR=%t
ExecStart=/usr/lib/pentablet/PenTablet.sh /mini

[Install]
WantedBy=xdg-desktop-autostart.target
EOF
}
