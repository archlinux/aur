# Maintainer: rilian-la-te <ria.freelander@gmail.com>

_disable_mate=0
_disable_xfce=0
_disable_vala=0
_disable_budgie=0

_opts=(
	--prefix=/usr
	--libdir=lib
	--libexecdir=lib
	-Dauto_features=disabled
)

pkgname=(
'vala-panel-appmenu-common-git'
)

makedepends=('meson' 'vala' 'gtk3' 'libwnck3' 'bamf>=0.5.0' 'git')

if (("${_disable_mate}" == 0));then
	_opts+=(-Dmate=enabled)
	pkgname+=('vala-panel-appmenu-mate-git')
	makedepends+=('mate-panel')
#	msg "Mate applet enabled"
fi

if (("${_disable_xfce}" == 0));then
	_opts+=(-Dxfce=enabled)
	pkgname+=('vala-panel-appmenu-xfce-git')
	makedepends+=('xfce4-panel>=4.11.2' 'xfconf')
#	msg "Xfce applet enabled"
fi

if (("${_disable_vala}" == 0));then
	_opts+=(-Dvalapanel=enabled)
	pkgname+=('vala-panel-appmenu-valapanel-git')
	makedepends+=('vala-panel>=0.4.50')
#	msg "Vala Panel applet enabled"
fi

if (("${_disable_budgie}" == 0));then
	_opts+=(-Dbudgie=enabled)
	pkgname+=('vala-panel-appmenu-budgie-git')
	makedepends+=('budgie-desktop' 'gobject-introspection')
#	msg "Budgie applet enabled"
fi


#msg "If you want to disable an applet, edit pkgbuild variables _disable_[applet]"

_pkgbase=vala-panel-appmenu
pkgbase=${_pkgbase}-xfce-git
pkgver=0.7.4
pkgrel=2
pkgdesc="AppMenu (Global Menu) plugin"
url="https://gitlab.com/vala-panel-project/vala-panel-appmenu"
arch=('i686' 'x86_64')
license=('LGPL3')

source=("git+https://gitlab.com/vala-panel-project/${_pkgbase}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgbase}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}


build() {
  meson "${_opts[@]}" build "${srcdir}/${_pkgbase}"
  meson compile -C build
}

package_vala-panel-appmenu-xfce-git() {
  pkgdesc="AppMenu (Global Menu) plugin for xfce4-panel"
  depends=('gtk3' 'bamf>=0.5.0' 'xfce4-panel>=4.11.2' 'xfconf' 'libwnck3' 'vala-panel-appmenu-common-git')
  optdepends=('gtk2-ubuntu: for hiding gtk2 menus'
            'unity-gtk-module: for gtk2/gtk3 menus'
            'vala-panel-appmenu-registrar: for DBusMenu registrar' 
			'jayatana: for Java applications support'
            'appmenu-qt: for qt4 menus'
            'appmenu-qt5: for qt5 menus')
  DESTDIR="${pkgdir}" meson install -C build
  rm -rf ${pkgdir}/usr/share/{vala-panel,glib-2.0,locale,mate-panel,vala-panel-appmenu,doc,licenses}
  rm -rf ${pkgdir}/usr/lib/{mate-panel,vala-panel,budgie-desktop}
}

package_vala-panel-appmenu-valapanel-git() {
  pkgdesc="AppMenu (Global Menu) plugin for vala-panel"
  depends=('gtk3' 'bamf>=0.5.0' 'vala-panel' 'libwnck3' 'vala-panel-appmenu-common-git')
  optdepends=('gtk2-ubuntu: for hiding gtk2 menus'
            'unity-gtk-module: for gtk2/gtk3 menus'
            'vala-panel-appmenu-registrar: for DBusMenu registrar' 
			'jayatana: for Java applications support'
            'appmenu-qt: for qt4 menus'
            'appmenu-qt5: for qt5 menus')
  
  DESTDIR="${pkgdir}" meson install -C build
  rm -rf ${pkgdir}/usr/share/{xfce4,glib-2.0,locale,mate-panel,vala-panel-appmenu,doc,licenses}
  rm -rf ${pkgdir}/usr/lib/{mate-panel,xfce4,budgie-desktop}
}

package_vala-panel-appmenu-mate-git() {
  pkgdesc="AppMenu (Global Menu) plugin for mate-panel"
  depends=('gtk3' 'bamf>=0.5.0' 'mate-panel' 'libwnck3' 'vala-panel-appmenu-common-git')
  optdepends=('gtk2-ubuntu: for hiding gtk2 menus'
            'unity-gtk-module: for gtk2/gtk3 menus'
            'vala-panel-appmenu-registrar: for DBusMenu registrar' 
			'jayatana: for Java applications support'
            'appmenu-qt: for qt4 menus'
            'appmenu-qt5: for qt5 menus')
  DESTDIR="${pkgdir}" meson install -C build
  rm -rf ${pkgdir}/usr/share/{vala-panel,glib-2.0,locale,xfce4,vala-panel-appmenu,doc,licenses}
  rm -rf ${pkgdir}/usr/lib/{xfce4,vala-panel,budgie-desktop}
}

package_vala-panel-appmenu-budgie-git() {
  pkgdesc="AppMenu (Global Menu) plugin for budgie-panel"
  depends=('gtk3' 'bamf>=0.5.0' 'budgie-desktop' 'libwnck3' 'vala-panel-appmenu-common-git')
  optdepends=('gtk2-ubuntu: for hiding gtk2 menus'
            'unity-gtk-module: for gtk2/gtk3 menus'
            'vala-panel-appmenu-registrar: for DBusMenu registrar' 
			'jayatana: for Java applications support'
            'appmenu-qt4: for qt4 menus')
  DESTDIR="${pkgdir}" meson install -C build
  rm -rf "${pkgdir}/usr/share/"
  rm -rf ${pkgdir}/usr/lib/{mate-panel,vala-panel,xfce4}
}

package_vala-panel-appmenu-common-git() {
  pkgdesc="Translations and common files for Global Menu"
  replaces=('vala-panel-appmenu-translations-git')
  optdepends=('vala-panel-appmenu-xfce-git'
              'vala-panel-appmenu-valapanel-git'
              'vala-panel-appmenu-mate-git'
              'vala-panel-appmenu-budgie-git')
  arch=('any')
  DESTDIR="${pkgdir}" meson install -C build
  rm -rf ${pkgdir}/usr/share/{vala-panel,xfce4,mate-panel}
  rm -rf ${pkgdir}/usr/lib
}
