# Maintainer: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=kdebase-workspace-consolekit
_pkgname=kde-workspace
pkgver=4.11.6
_kdever=4.12.2
pkgrel=1
pkgdesc="kdebase-workspace with ConsoleKit support for non-systemd systems"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/kde-workspace'
license=('GPL' 'LGPL' 'FDL')
groups=('kde')
# note on libxdamage:
# 	not detected by namcap because libgl depends on it
#	but nvidia providing libgl does not depend on libxdamage
depends=("kdelibs>=${pkgver}" 'kdepim-runtime' 'lm_sensors' 'libraw1394'
         'qimageblitz' 'polkit-kde' 'xorg-xprop' 'libxdamage' 'libqalculate'
         'libxklavier' 'xorg-xsetroot' 'libxcomposite' 'libxinerama'
         'xorg-xrdb' 'libxres' 'xorg-xrandr' 'xorg-xmessage' 'libusb-compat'
         'kde-base-artwork' 'xcb-util-renderutil' 'xcb-util-image' 'ttf-font'
         'xcb-util-keysyms' 'xcb-util-wm' 'pciutils' 'polkit-consolekit' 'consolekit')
makedepends=('cmake' 'automoc4' 'boost' 'kdebindings-python2' 'networkmanager')
optdepends=('kde-wallpapers: wallpapers for KDE Plasma Workspaces'
            'appmenu-qt: menu applications over dbus')
provides=("kdebase-workspace=$pkgver")
conflicts=('kdebase-workspace')
install="kdebase-workspace.install"
backup=('usr/share/config/kdm/kdmrc')
source=("http://download.kde.org/stable/${_kdever}/src/${_pkgname}-${pkgver}.tar.xz"
        'kdm' 'kde.pam' 'kde-np.pam' 'kscreensaver.pam' 'kdm.service' 'kdm.logrotate'
	'etc-scripts.patch' 'terminate-server.patch' 'kdm-xinitrd.patch')
sha1sums=('f1da23a472064307dcd244605a7004701982e5de'
          '5db3a245201bd4a50e65aa2ef583cf5490e4f646'
          '660eae40a707d2711d8d7f32a93214865506b795'
          '6aeecc9e0e221f0515c6bf544f9a3c11cb6961fe'
          '106635aa1aae51d6f0668b1853f6c49a4fe9d3d8'
          'b6f8e8692737b11eec1f8022ce74b5b23e247b1b'
          'bbe55f2000217474ce7246f12ee437ceaaf7e9ae'
          'c079ebd157c836ba996190f0d2bcea1a7828d02c'
          'ac7bc292c865bc1ab8c02e6341aa7aeaf1a3eeee'
          'd509dac592bd8b310df27991b208c95b6d907514')

prepare() {
	cd ${_pkgname}-${pkgver}

	# reads the shell scripts in /etc/kde/
	patch -p0 -i "${srcdir}"/etc-scripts.patch
	# FS#26120
	patch -p1 -i "${srcdir}"/kdm-xinitrd.patch

	# KDEBUG#202629
	patch -p0 -i "${srcdir}"/terminate-server.patch

	cd ../
}

build() {
	mkdir build
	cd build
	cmake ../${_pkgname}-${pkgver} \
		-DCMAKE_BUILD_TYPE=Release \
		-DKDE4_BUILD_TESTS=OFF \
		-DCMAKE_SKIP_RPATH=ON \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DWITH_Xmms=OFF \
		-DWITH_libgps=OFF \
		-DPYTHON_EXECUTABLE=/usr/bin/python2 \
		-DWITH_CkConnector=ON
	make
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install

	install -D -m644 "${srcdir}"/kde.pam "${pkgdir}"/etc/pam.d/kde
	install -D -m644 "${srcdir}"/kde-np.pam "${pkgdir}"/etc/pam.d/kde-np
	install -D -m644 "${srcdir}"/kscreensaver.pam "${pkgdir}"/etc/pam.d/kscreensaver

	install -d -m755 "${pkgdir}"/usr/share/xsessions/
	ln -sf /usr/share/apps/kdm/sessions/kde-plasma{,-safe}.desktop \
                "${pkgdir}"/usr/share/xsessions/
	install -d -m755 "${pkgdir}"/etc/kde/{env,shutdown}

	install -d -g 135 -o 135 "${pkgdir}"/var/lib/kdm
        install -D -m755 "${srcdir}"/kdm "${pkgdir}"/etc/rc.d/kdm
        install -D -m644 "${srcdir}"/kdm.service \
                "${pkgdir}"/usr/lib/systemd/system/kdm.service
        install -Dm644 "${srcdir}"/kdm.logrotate "${pkgdir}"/etc/logrotate.d/kdm
}
