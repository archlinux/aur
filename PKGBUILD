# Maintainer: rilian-la-te <ria.freelander@gmail.com>

_disable_mate=0
_disable_xfce=0
_disable_vala=0
_disable_budgie=0

pkgname=(
'sntray-plugin-translations'
)

_opts=(
	-DCMAKE_INSTALL_PREFIX=/usr 
	-DCMAKE_INSTALL_LIBDIR=lib
	-DCMAKE_INSTALL_LIBEXECDIR=lib
)

makedepends=('cmake' 'vala' 'gtk3' 'libpeas')

if (("${_disable_mate}" == 0));then
	_opts+=(-DENABLE_MATE=ON)
	pkgname+=('mate-panel-sntray')
	makedepends+=('mate-panel')
	msg "Mate applet enabled"
else
	_opts+=(-DENABLE_MATE=OFF)
fi

if (("${_disable_xfce}" == 0));then
	_opts+=(-DENABLE_XFCE=ON)
	pkgname+=('xfce4-panel-sntray')
	makedepends+=('xfce4-panel>=4.11.2')
	msg "Xfce applet enabled"
else
	_opts+=(-DENABLE_XFCE=OFF)
fi

if (("${_disable_vala}" == 0));then
	_opts+=(-DENABLE_VALAPANEL=ON)
	pkgname+=('vala-panel-sntray')
	makedepends+=('vala-panel-git')
	msg "Vala Panel applet enabled"
else
	_opts+=(-DENABLE_VALAPANEL=OFF)
fi

if (("${_disable_budgie}" == 0));then
	_opts+=(-DENABLE_BUDGIE=ON)
	pkgname+=('budgie-sntray')
	makedepends+=('budgie-desktop')
	msg "Budgie applet enabled"
else
	_opts+=(-DENABLE_BUDGIE=OFF)
fi


msg "If you want to disable an applet, edit pkgbuild variables _disable_[applet]"

pkgbase=xfce4-sntray-plugin
_cmakename=cmake-vala
_dbusmenuname=vala-dbusmenu
pkgver=0.4.7
pkgrel=1
pkgdesc="Plugin for xfce4-panel and vala-panel to show StatusNotifierItems (AppIndicators) via FlowBox"
url="https://github.com/rilian-la-te/xfce4-sntray-plugin"
arch=('i686' 'x86_64')
license=('LGPL')
source=("https://github.com/rilian-la-te/xfce4-sntray-plugin/releases/download/${pkgver}/${pkgbase}-${pkgver}.tar.gz")
sha256sums=('9d220e6d7754b6911dac6c50e4e54f3b789dd00f2f7e374a1b9a51b2bcf2b476')

build(){
	cd "${srcdir}/${pkgbase}-${pkgver}"
	cmake ./ "${_opts[@]}"
	make
}

package_xfce4-panel-sntray(){
	pkgdesc="Plugin for xfce4-panel to show StatusNotifierItems (AppIndicators) via FlowBox"
	depends=('gtk3' 'xfce4-panel>=4.11.2')
	optdepends=('vala-panel-extras-volume: ALSA volume applet'
				'vala-panel-extras-battery: UPower battery applet'
				'vala-panel-extras-weather: Weather applet'
				'vala-panel-extras-xkb: XKB applet'
				'sni-qt: Qt applications for StatusNotifier'
				'libappindicator-gtk2: Gtk2 applications for StatusNotifier'
				'libappindicator-gtk3: Gtk3 applications for StatusNotifier')
	cd "${srcdir}/${pkgbase}-${pkgver}"
	make -C "src" DESTDIR="${pkgdir}" install
	make -C "data" DESTDIR="${pkgdir}" install
	rm -rf "${pkgdir}/usr/lib/vala-panel"
	rm -rf "${pkgdir}/usr/share/mate-panel"
	rm -rf "${pkgdir}/usr/lib/mate-panel"
	rm -rf "${pkgdir}/usr/lib/budgie-desktop"
	rm -rf "${pkgdir}/usr/share/glib-2.0"
	rm -rf "${pkgdir}/usr/share/dbus-1"
}

package_mate-panel-sntray(){
	install=vala-panel-sntray.install
	pkgdesc="Plugin for mate-panel to show StatusNotifierItems (AppIndicators) via FlowBox"
	depends=('gtk3' 'mate-panel' 'sntray-plugin-translations')
	optdepends=('vala-panel-extras-volume: ALSA volume applet'
				'vala-panel-extras-battery: UPower battery applet'
				'vala-panel-extras-weather: Weather applet'
				'vala-panel-extras-xkb: XKB applet'
				'sni-qt: Qt applications for StatusNotifier'
				'libappindicator-gtk2: Gtk2 applications for StatusNotifier'
				'libappindicator-gtk3: Gtk3 applications for StatusNotifier')
	cd "${srcdir}/${pkgbase}-${pkgver}"
	make -C "src" DESTDIR="${pkgdir}" install
	make -C "data" DESTDIR="${pkgdir}" install
	rm -rf "${pkgdir}/usr/lib/vala-panel"
	rm -rf "${pkgdir}/usr/lib/xfce4"
	rm -rf "${pkgdir}/usr/share/xfce4"
	rm -rf "${pkgdir}/usr/lib/budgie-desktop"
	rm -rf "${pkgdir}/usr/share/glib-2.0"
}

package_vala-panel-sntray(){
	pkgdesc="Plugin for vala-panel to show StatusNotifierItems (AppIndicators) via FlowBox"
	depends=('gtk3' 'vala-panel' 'libpeas' 'sntray-plugin-translations')
	install=vala-panel-sntray.install
	optdepends=('vala-panel-extras-volume: ALSA volume applet'
				'vala-panel-extras-battery: UPower battery applet'
				'vala-panel-extras-weather: Weather applet'
				'vala-panel-extras-xkb: XKB applet'
				'sni-qt: Qt applications for StatusNotifier'
				'libappindicator-gtk2: Gtk2 applications for StatusNotifier'
				'libappindicator-gtk3: Gtk3 applications for StatusNotifier')
	cd "${srcdir}/${pkgbase}-${pkgver}"
	make -C "src" DESTDIR="${pkgdir}" install
	make -C "data" DESTDIR="${pkgdir}" install
	rm -rf "${pkgdir}/usr/lib/xfce4"
	rm -rf "${pkgdir}/usr/share/xfce4"
	rm -rf "${pkgdir}/usr/share/mate-panel"
	rm -rf "${pkgdir}/usr/lib/mate-panel"
	rm -rf "${pkgdir}/usr/lib/budgie-desktop"
	rm -rf "${pkgdir}/usr/share/glib-2.0"
	rm -rf "${pkgdir}/usr/share/dbus-1"
}

package_budgie-sntray(){
	install=vala-panel-sntray.install
	pkgdesc="Plugin for budgie to show StatusNotifierItems (AppIndicators) via FlowBox"
	depends=('budgie-desktop' 'gtk3' 'libpeas' 'sntray-plugin-translations')
	optdepends=('vala-panel-extras-volume: ALSA volume applet'
				'vala-panel-extras-battery: UPower battery applet'
				'vala-panel-extras-weather: Weather applet'
				'vala-panel-extras-xkb: XKB applet'
				'sni-qt: Qt applications for StatusNotifier'
				'libappindicator-gtk2: Gtk2 applications for StatusNotifier'
				'libappindicator-gtk3: Gtk3 applications for StatusNotifier')
  	cd "${srcdir}/${pkgbase}-${pkgver}"
  	make -C "src" DESTDIR="${pkgdir}" install
  	make -C "data" DESTDIR="${pkgdir}" install
	rm -rf "${pkgdir}/usr/lib/xfce4"
	rm -rf "${pkgdir}/usr/share/xfce4"
	rm -rf "${pkgdir}/usr/share/mate-panel"
	rm -rf "${pkgdir}/usr/lib/mate-panel"
	rm -rf "${pkgdir}/usr/lib/vala-panel"
	rm -rf "${pkgdir}/usr/share/glib-2.0"
	rm -rf "${pkgdir}/usr/share/dbus-1"
}

package_sntray-plugin-translations(){
	pkgdesc="Translations for StatusNotifier Menu"
	optdepends=('xfce4-panel-sntray' 'mate-panel-sntray' 'vala-panel-sntray' 'budgie-sntray')
	arch=('any')
	cd "${srcdir}/${pkgbase}-${pkgver}"
	make -C "po" DESTDIR="${pkgdir}" install
	make -C "data" DESTDIR="${pkgdir}" install
	rm -rf "${pkgdir}/usr/share/xfce4"
	rm -rf "${pkgdir}/usr/share/mate-panel"
	rm -rf "${pkgdir}/usr/lib/"
	rm -rf "${pkgdir}/usr/share/dbus-1"
}
