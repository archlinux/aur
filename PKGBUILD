# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>

pkgname=mdm-display-manager
_pkgname=mdm
pkgver=2.0.4
pkgrel=1
pkgdesc="The MDM Display Manager"
arch=('i686' 'x86_64')
url="http://www.linuxmint.com"
license=('GPL')
depends=('pam' 'libdmx' 'gtk2' 'libgnomecanvas' 'librsvg' 
         'libxml2' 'libart-lgpl' 'dbus-glib' 'libwebkit')
makedepends=('gnome-common' 'intltool' 'perl' 'gnome-doc-utils' 'xorg-server' 'pango' 'zenity' 'popt' 'pkg-config' 'automake' 'autoconf' 'libtool')
provides=('gdm' 'gdm-old' 'mate-display-manager' 'mdm')
conflicts=('gdm' 'mate-display-manager' 'mdm')
replaces=('mate-display-manager' 'mdm')
options=('!libtool')
install='mdm-display-manager.install'
backup=('etc/mdm/custom.conf' 'etc/pam.d/mdm' 'etc/pam.d/mdm-autologin')
source=("$_pkgname-$pkgver.zip::https://github.com/linuxmint/$_pkgname/archive/$pkgver.zip"
	'mdm.pam'
	'mdm.service'
	'mdm-autologin.pam'
	'defaults.conf'
	'org.cinnamon.pkexec.mdmsetup.policy'
	'mdm-plymouth.service')
noextract=()

prepare() {
cd ${srcdir}/${_pkgname}-${pkgver}
aclocal --install
}

build() {
cd ${srcdir}/${_pkgname}-${pkgver}
chmod +x ./autogen.sh
export AUTOMAKE=automake
./autogen.sh --enable-ipv6=yes --with-prefetch \
--prefix=/usr --with-console-kit=no --sysconfdir=/etc \
--with-systemd --libexecdir=/usr/lib/mdm --localstatedir=/var/lib \
--disable-static --with-xevie=yes --disable-scrollkeeper \
--enable-secureremote=yes --enable-ipv6=yes \
--enable-compile-warnings=no --sbindir=/usr/bin \
LDFLAGS="-lXau -lm"
sed -i -e 's|${prefix}|/usr|' config.h
make DESTDIR=$pkgdir
}

package() {
cd ${srcdir}/${_pkgname}-${pkgver}
make DESTDIR=$pkgdir install

msg2 'Adding PAM rules'
#PAM, we use our own, not LinuxMint stuff, problem?...
install -m755 -d $pkgdir/etc/pam.d
install -m644 $srcdir/mdm-autologin.pam $pkgdir/etc/pam.d/mdm-autologin
install -m644 $srcdir/mdm.pam $pkgdir/etc/pam.d/mdm

msg2 'Adding SystemD services'
#systemd Init script, but ... SysV Inint is soo old
install -m755 -d $pkgdir/usr/lib/systemd/system
install -m644 $srcdir/mdm.service $pkgdir/usr/lib/systemd/system/mdm.service
install -m644 $srcdir/mdm-plymouth.service $pkgdir/usr/lib/systemd/system/mdm-plymouth.service

msg2 'Adding config files'
#configuration
install -m444 "${srcdir}/defaults.conf" "${pkgdir}/usr/share/mdm/"
install -m444 "${srcdir}/defaults.conf" "${pkgdir}/usr/share/mdm/distro.conf"
rm -f ${pkgdir}/usr/share/xsessions/gnome.desktop || true

msg2 'Adding PolicyKit execution scheme'
#PolicyKit execution scheme (need some tests)
install -m755 -d $pkgdir/usr/share/polkit-1/actions/
install -m644 $srcdir/org.cinnamon.pkexec.mdmsetup.policy $pkgdir/usr/share/polkit-1/actions/

#Why on the hay this directory is created empty in etc, remove it
rmdir $pkgdir/etc/dm

msg2 'Adding faces'
#Fix mdm files conflict with gnome-control-center (usr/share/pixmaps/faces/*)
install -m755 -d $pkgdir/usr/share/pixmaps/faces/

make DESTDIR=$pkgdir install -C gui/faces

msg2 'Adding applications'
#Fix gdmsetup.desktop
sed -i -e 's|^Exec=gksu|Exec=pkexec|' $pkgdir/usr/share/mdm/applications/mdmsetup.desktop
sed -i -e 's|^Categories=|Categories=GNOME;GTK;System;Settings;X-GNOME-Settings-Panel;X-GNOME-SystemSettings;X-XFCE-SettingsDialog;X-XFCE-SystemSettings;|' $pkgdir/usr/share/mdm/applications/mdmsetup.desktop

#Fix erroneous path for certain applications
install -m755 -d $pkgdir/usr/share/applications
mv -f $pkgdir/usr/share/mdm/applications/*.* $pkgdir/usr/share/applications
chmod 755 $pkgdir/usr/share/applications/*.*
rmdir $pkgdir/usr/share/mdm/applications

}
sha256sums=('7e047c45edc6a5a1141650ca9af448d8d5596fe12fb9863001eb8e6f1e0d577c'
            '8663192f02fbbcaf9b84a37a44d47af7381c18d4327c576ca7924baca2cc163b'
            'd3dd582eb25bb31f012167069c869d3ce89c1dbd9b5aa7396350d8cf609994a5'
            '479e8fd4d5ef353fec5af776ad05e4f414a92d6f374f9b8f5deef77b9e301bc7'
            'ce9448356c54d8de5b8af5cdef2b5c30b4e6ae970126ce0c4ef295be557bbd2a'
            'bd22d536a7a1b455a8f8a45d7d8cc46156cb4ef5f3bc706dd73c89d503acad6b'
            '7579ed402ee0db60e0c40ddbb7b2c80be0aec4315e45aa525908bef8aa181bd6')

