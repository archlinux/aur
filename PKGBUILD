# Maintainer: rilian-la-te <ria.freelander@gmail.com>

_disable_mate=0
_disable_xfce=0
_disable_vala=0
_disable_budgie=0
_disable_unity_gtk_module=o

_opts=(
	-DCMAKE_INSTALL_PREFIX=/usr
	-DCMAKE_INSTALL_LIBDIR=lib
	-DCMAKE_INSTALL_LIBEXECDIR=lib
)

pkgname=(
'vala-panel-appmenu-translations-git'
'vala-panel-appmenu-registrar-git' 
)

makedepends=('cmake' 'vala' 'gtk3' 'libwnck3' 'bamf>=0.5.0' 'git')

if (("${_disable_mate}" == 0));then
	_opts+=(-DENABLE_MATE=ON)
	pkgname+=('vala-panel-appmenu-mate-git')
	makedepends+=('mate-panel')
	msg "Mate applet enabled"
else
	_opts+=(-DENABLE_MATE=OFF)
fi

if (("${_disable_xfce}" == 0));then
	_opts+=(-DENABLE_XFCE=ON)
	pkgname+=('vala-panel-appmenu-xfce-git')
	makedepends+=('xfce4-panel>=4.11.2' 'xfconf')
	msg "Xfce applet enabled"
else
	_opts+=(-DENABLE_XFCE=OFF)
fi

if (("${_disable_vala}" == 0));then
	_opts+=(-DENABLE_VALAPANEL=ON)
	pkgname+=('vala-panel-appmenu-valapanel-git')
	makedepends+=('vala-panel-git')
	msg "Vala Panel applet enabled"
else
	_opts+=(-DENABLE_VALAPANEL=OFF)
fi

if (("${_disable_budgie}" == 0));then
	_opts+=(-DENABLE_BUDGIE=ON)
	pkgname+=('vala-panel-appmenu-budgie-git')
	makedepends+=('budgie-desktop')
	msg "Budgie applet enabled"
else
	_opts+=(-DENABLE_BUDGIE=OFF)
fi

if (("${_disable_unity_gtk_module}" == 0));then
	_opts+=(-DENABLE_APPMENU_GTK_MODULE=ON)
	pkgname+=('appmenu-gtk-module-git')
	makedepends+=('gtk2')
	msg "AppMenu GTK+ module enabled"
else
	_opts+=(-DENABLE_APPMENU_GTK_MODULE=OFF)
fi
msg "If you want to disable an applet, edit pkgbuild variables _disable_[applet]"

_pkgbase=vala-panel-appmenu
pkgbase=${_pkgbase}-xfce-git
_cmakename=cmake-vala
_dbusmenuname=vala-dbusmenu
pkgver=0.6.0.r3.g339632a
pkgrel=1
pkgdesc="AppMenu (Global Menu) plugin"
url="https://github.com/rilian-la-te/vala-panel-appmenu"
arch=('i686' 'x86_64')
license=('GPL3')

source=("git://github.com/rilian-la-te/${_pkgbase}.git"
        "git://github.com/rilian-la-te/${_cmakename}.git"
        "git://github.com/rilian-la-te/${_dbusmenuname}.git"
		80appmenu-gtk-module)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
			'4c006c4ea7b8556070ad6d35529d3a9e23da8033429e34d1824c25942d969fbc')

pkgver() {
  cd "${srcdir}/${_pkgbase}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${srcdir}/${_cmakename}"
  cp -r . "${srcdir}/${_pkgbase}/cmake"
  cd "${srcdir}/${_dbusmenuname}"
  cp -r . "${srcdir}/${_pkgbase}/dbusmenu"
}

build() {
  cd "${srcdir}/${_pkgbase}"
  cmake ./ "${_opts[@]}"
  make
}

package_vala-panel-appmenu-xfce-git() {
  pkgdesc="AppMenu (Global Menu) plugin for xfce4-panel"
  depends=('gtk3' 'bamf>=0.5.0' 'xfce4-panel>=4.11.2' 'xfconf' 'libwnck3')
  optdepends=('gtk2-ubuntu: for hiding gtk2 menus'
            'unity-gtk-module: for gtk2/gtk3 menus'
            'vala-panel-appmenu-registrar: for DBusMenu registrar' 
            'appmenu-qt: for qt4 menus'
            'appmenu-qt5: for qt5 menus')
  cd "${srcdir}/${_pkgbase}"
  make -C "lib" DESTDIR="${pkgdir}" install
  make -C "data" DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/lib/vala-panel"
  rm -rf "${pkgdir}/usr/lib/mate-panel"
  rm -rf "${pkgdir}/usr/share/mate-panel"
  rm -rf "${pkgdir}/usr/share/dbus-1"
  rm -rf "${pkgdir}/usr/lib/budgie-desktop"
}

package_vala-panel-appmenu-valapanel-git() {
  pkgdesc="AppMenu (Global Menu) plugin for vala-panel"
  depends=('gtk3' 'bamf>=0.5.0' 'vala-panel' 'libwnck3')
  optdepends=('gtk2-ubuntu: for hiding gtk2 menus'
            'unity-gtk-module: for gtk2/gtk3 menus'
            'vala-panel-appmenu-registrar: for DBusMenu registrar' 
            'appmenu-qt: for qt4 menus'
            'appmenu-qt5: for qt5 menus')
  cd "${srcdir}/${_pkgbase}"
  make -C "lib" DESTDIR="${pkgdir}" install
  make -C "data" DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/lib/xfce4"
  rm -rf "${pkgdir}/usr/share"
  rm -rf "${pkgdir}/usr/lib/mate-panel"
  rm -rf "${pkgdir}/usr/share/dbus-1"
  rm -rf "${pkgdir}/usr/lib/budgie-desktop"
}

package_vala-panel-appmenu-mate-git() {
  pkgdesc="AppMenu (Global Menu) plugin for mate-panel"
  depends=('gtk3' 'bamf>=0.5.0' 'mate-panel' 'libwnck3')
  optdepends=('gtk2-ubuntu: for hiding gtk2 menus'
            'unity-gtk-module: for gtk2/gtk3 menus'
            'vala-panel-appmenu-registrar: for DBusMenu registrar' 
            'appmenu-qt: for qt4 menus'
            'appmenu-qt5: for qt5 menus')
  cd "${srcdir}/${_pkgbase}"
  make -C "lib" DESTDIR="${pkgdir}" install
  make -C "data" DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/lib/vala-panel"
  rm -rf "${pkgdir}/usr/lib/xfce4"
  rm -rf "${pkgdir}/usr/share/xfce4"
  rm -rf "${pkgdir}/usr/lib/budgie-desktop"
}

package_vala-panel-appmenu-budgie-git() {
  pkgdesc="AppMenu (Global Menu) plugin for budgie-panel"
  depends=('gtk3' 'bamf>=0.5.0' 'budgie-desktop' 'libwnck3')
  optdepends=('gtk2-ubuntu: for hiding gtk2 menus'
            'unity-gtk-module: for gtk2/gtk3 menus'
            'vala-panel-appmenu-registrar: for DBusMenu registrar' 
            'appmenu-qt: for qt4 menus'
            'appmenu-qt5: for qt5 menus')
  cd "${srcdir}/${_pkgbase}"
  make -C "lib" DESTDIR="${pkgdir}" install
  make -C "data" DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/lib/xfce4"
  rm -rf "${pkgdir}/usr/share"
  rm -rf "${pkgdir}/usr/lib/vala-panel"
  rm -rf "${pkgdir}/usr/lib/mate-panel"
  rm -rf "${pkgdir}/usr/share/dbus-1"
}

package_vala-panel-appmenu-translations-git() {
  pkgdesc="Translations for Global Menu"
  optdepends=('vala-panel-appmenu-xfce-git'
              'vala-panel-appmenu-valapanel-git'
              'vala-panel-appmenu-mate-git'
              'vala-panel-appmenu-budgie-git')
  arch=('any')
  cd "${srcdir}/${_pkgbase}"
  make -C "po" DESTDIR="${pkgdir}" install
}

package_appmenu-gtk-module-git()
{
  pkgdesc="Gtk module for exporting menus"
  depends=('gtk3' 'gtk2')
  provides=(unity-gtk-module)
  cd "${srcdir}/${_pkgbase}"
  make -C "unity-gtk-module" DESTDIR="${pkgdir}" install
  install -dm755 "${pkgdir}/etc/X11/xinit/xinitrc.d/"
  install -m755  "${srcdir}/80appmenu-gtk-module" "${pkgdir}/etc/X11/xinit/xinitrc.d/"
}

package_vala-panel-appmenu-registrar-git()
{
  pkgdesc="Gtk module for exporting menus"
  provides=(vala-panel-appmenu-registrar)
  depends=('gtk3')
  cd "${srcdir}/${_pkgbase}"
  make -C "registrar" DESTDIR="${pkgdir}" install
}
