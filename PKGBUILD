# Maintainer: rilian-la-te <ria.freelander@gmail.com>

_disable_mate=0
_disable_xfce=0
_disable_vala=0
_disable_budgie=0

pkgname=(
'sntray-plugin-translations-git'
)

_opts=(
	-DCMAKE_INSTALL_PREFIX=/usr 
	-DCMAKE_INSTALL_LIBDIR=lib
	-DCMAKE_INSTALL_LIBEXECDIR=lib
)

makedepends=('cmake' 'vala' 'gtk3' 'libpeas')

if (("${_disable_mate}" == 0));then
	_opts+=(-DENABLE_MATE=ON)
	pkgname+=('mate-panel-sntray-git')
	makedepends+=('mate-panel')
	msg "Mate applet enabled"
else
	_opts+=(-DENABLE_MATE=OFF)
fi

if (("${_disable_xfce}" == 0));then
	_opts+=(-DENABLE_XFCE=ON)
	pkgname+=('xfce4-panel-sntray-git')
	makedepends+=('xfce4-panel>=4.11.2')
	msg "Xfce applet enabled"
else
	_opts+=(-DENABLE_XFCE=OFF)
fi

if (("${_disable_vala}" == 0));then
	_opts+=(-DENABLE_VALAPANEL=ON)
	pkgname+=('vala-panel-sntray-git')
	makedepends+=('vala-panel-git')
	msg "Vala Panel applet enabled"
else
	_opts+=(-DENABLE_VALAPANEL=OFF)
fi

if (("${_disable_budgie}" == 0));then
	_opts+=(-DENABLE_BUDGIE=ON)
	pkgname+=('budgie-sntray-git')
	makedepends+=('budgie-desktop')
	msg "Budgie applet enabled"
else
	_opts+=(-DENABLE_BUDGIE=OFF)
fi


msg "If you want to disable an applet, edit pkgbuild variables _disable_[applet]"

pkgbase=vala-panel-sntray-git
_pkgbase=xfce4-sntray-plugin
_cmakename=cmake-vala
_dbusmenuname=vala-dbusmenu
pkgver=0.4.9
pkgrel=2
pkgdesc="Plugin for xfce4-panel and vala-panel to show StatusNotifierItems (AppIndicators) via FlowBox"
url="https://gitlab.com/vala-panel-project/xfce4-sntray-plugin"
arch=('i686' 'x86_64')
license=('LGPL')
source=("git://gitlab.com/vala-panel-project/${_pkgbase}.git"
        "git://gitlab.com/vala-panel-project/${_cmakename}.git"
        "git://gitlab.com/vala-panel-project/${_dbusmenuname}.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "${srcdir}/${_pkgbase}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${srcdir}/${_cmakename}"
  cp -r . "${srcdir}/${_pkgbase}/cmake/vala"
  cd "${srcdir}/${_dbusmenuname}"
  cp -r . "${srcdir}/${_pkgbase}/src/dbusmenu"
}

build(){
	cd "${srcdir}/${_pkgbase}"
	cmake ./ "${_opts[@]}"
	make
}

package_xfce4-panel-sntray-git(){
	pkgdesc="Plugin for xfce4-panel to show StatusNotifierItems (AppIndicators) via FlowBox"
	depends=('gtk3' 'xfce4-panel>=4.11.2' 'sntray-plugin-translations-git')
	optdepends=('vala-panel-extras-volume: ALSA volume applet'
				'vala-panel-extras-battery: UPower battery applet'
				'vala-panel-extras-weather: Weather applet'
				'vala-panel-extras-xkb: XKB applet'
				'sni-qt: Qt applications for StatusNotifier'
				'libappindicator-gtk2: Gtk2 applications for StatusNotifier'
				'libappindicator-gtk3: Gtk3 applications for StatusNotifier')
	cd "${srcdir}/${_pkgbase}"
	make -C "src" DESTDIR="${pkgdir}" install
	make -C "data" DESTDIR="${pkgdir}" install
	rm -rf "${pkgdir}/usr/lib/vala-panel"
	rm -rf "${pkgdir}/usr/share/mate-panel"
	rm -rf "${pkgdir}/usr/lib/mate-panel"
	rm -rf "${pkgdir}/usr/lib/budgie-desktop"
	rm -rf "${pkgdir}/usr/share/glib-2.0"
	rm -rf "${pkgdir}/usr/share/dbus-1"
}

package_mate-panel-sntray-git(){
	pkgdesc="Plugin for mate-panel to show StatusNotifierItems (AppIndicators) via FlowBox"
	depends=('gtk3' 'mate-panel' 'sntray-plugin-translations-git')
	optdepends=('vala-panel-extras-volume: ALSA volume applet'
				'vala-panel-extras-battery: UPower battery applet'
				'vala-panel-extras-weather: Weather applet'
				'vala-panel-extras-xkb: XKB applet'
				'sni-qt: Qt applications for StatusNotifier'
				'libappindicator-gtk2: Gtk2 applications for StatusNotifier'
				'libappindicator-gtk3: Gtk3 applications for StatusNotifier')
	cd "${srcdir}/${_pkgbase}"
	make -C "src" DESTDIR="${pkgdir}" install
	make -C "data" DESTDIR="${pkgdir}" install
	rm -rf "${pkgdir}/usr/lib/vala-panel"
	rm -rf "${pkgdir}/usr/lib/xfce4"
	rm -rf "${pkgdir}/usr/share/xfce4"
	rm -rf "${pkgdir}/usr/lib/budgie-desktop"
	rm -rf "${pkgdir}/usr/share/glib-2.0"
}

package_vala-panel-sntray-git(){
	pkgdesc="Plugin for vala-panel to show StatusNotifierItems (AppIndicators) via FlowBox"
	depends=('gtk3' 'vala-panel' 'libpeas' 'sntray-plugin-translations-git')
	optdepends=('vala-panel-extras-volume: ALSA volume applet'
				'vala-panel-extras-battery: UPower battery applet'
				'vala-panel-extras-weather: Weather applet'
				'vala-panel-extras-xkb: XKB applet'
				'sni-qt: Qt applications for StatusNotifier'
				'libappindicator-gtk2: Gtk2 applications for StatusNotifier'
				'libappindicator-gtk3: Gtk3 applications for StatusNotifier')
	cd "${srcdir}/${_pkgbase}"
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

package_budgie-sntray-git(){
	pkgdesc="Plugin for budgie to show StatusNotifierItems (AppIndicators) via FlowBox"
	depends=('budgie-desktop' 'gtk3' 'libpeas' 'sntray-plugin-translations-git')
	optdepends=('vala-panel-extras-volume: ALSA volume applet'
				'vala-panel-extras-battery: UPower battery applet'
				'vala-panel-extras-weather: Weather applet'
				'vala-panel-extras-xkb: XKB applet'
				'sni-qt: Qt applications for StatusNotifier'
				'libappindicator-gtk2: Gtk2 applications for StatusNotifier'
				'libappindicator-gtk3: Gtk3 applications for StatusNotifier')
  	cd "${srcdir}/${_pkgbase}"
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

package_sntray-plugin-translations-git(){
	pkgdesc="Translations for StatusNotifier Menu"
	optdepends=('xfce4-panel-sntray-git' 'mate-panel-sntray-git' 'vala-panel-sntray-git' 'budgie-sntray-git')
	arch=('any')
	cd "${srcdir}/${_pkgbase}"
	make -C "po" DESTDIR="${pkgdir}" install
	make -C "data" DESTDIR="${pkgdir}" install
	rm -rf "${pkgdir}/usr/share/xfce4"
	rm -rf "${pkgdir}/usr/share/mate-panel"
	rm -rf "${pkgdir}/usr/lib/"
	rm -rf "${pkgdir}/usr/share/dbus-1"
}
