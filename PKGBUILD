# Maintainer: rilian-la-te <ria.freelander@gmail.com>

_pkgbase=vala-panel-appmenu
pkgbase=${_pkgbase}-xfce-git
pkgname=('vala-panel-appmenu-translations-git' 'vala-panel-appmenu-xfce-git' 'vala-panel-appmenu-valapanel-git')
_cmakename=cmake-vala
_dbusmenuname=vala-dbusmenu
pkgver=0.3.0
pkgrel=1
pkgdesc="AppMenu (Global Menu) plugin for xfce4-panel and vala-panel"
url="https://github.com/rilian-la-te/vala-panel-appmenu"
arch=('i686' 'x86_64')
license=('GPL3')
makedepends=('cmake' 'vala' 'gtk3' 'bamf>=0.5.0' 'xfce4-panel>=4.11.2' 'xfconf' 'libwnck3' 'vala-panel-git' 'mate-panel-gtk3')
source=("git://github.com/rilian-la-te/${_pkgbase}.git"
        "git://github.com/rilian-la-te/${_cmakename}.git"
        "git://github.com/rilian-la-te/${_dbusmenuname}.git")
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
  cp -r . "${srcdir}/${_pkgbase}/cmake"
  cd "${srcdir}/${_dbusmenuname}"
  cp -r . "${srcdir}/${_pkgbase}/dbusmenu"
  rm "${srcdir}/vala-panel-appmenu/vapi/glib-2.0.vapi"
}

build() {
  cd "${srcdir}/${_pkgbase}"
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_XFCE=ON -DENABLE_VALAPANEL=ON -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package_vala-panel-appmenu-xfce-git() {
  pkgdesc="AppMenu (Global Menu) plugin for xfce4-panel"
  depends=('gtk3' 'bamf>=0.5.0' 'xfce4-panel>=4.11.2' 'xfconf' 'libwnck3')
  optdepends=('gtk2-ubuntu: for hiding gtk2 menus'
            'unity-gtk-module: for gtk2/gtk3 menus'
            'gtk2-appmenu: for gtk2 menus, alternate way'
            'gtk3-appmenu: for gtk3 menus, alternate way'
            'appmenu-qt: for qt4 menus'
            'appmenu-qt5: for qt5 menus')
  cd "${srcdir}/${_pkgbase}"
  make -C "lib" DESTDIR="${pkgdir}" install
  make -C "data" DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/lib/vala-panel"
  rm -rf "${pkgdir}/usr/lib/mate-panel"
  rm -rf "${pkgdir}/usr/share/mate-panel"
}

package_vala-panel-appmenu-valapanel-git() {
  pkgdesc="AppMenu (Global Menu) plugin for vala-panel"
  depends=('gtk3' 'bamf>=0.5.0' 'vala-panel' 'libwnck3')
  optdepends=('gtk2-ubuntu: for hiding gtk2 menus'
            'unity-gtk-module: for gtk2/gtk3 menus'
            'gtk2-appmenu: for gtk2 menus, alternate way'
            'gtk3-appmenu: for gtk3 menus, alternate way'
            'appmenu-qt: for qt4 menus'
            'appmenu-qt5: for qt5 menus')
  cd "${srcdir}/${_pkgbase}"
  make -C "lib" DESTDIR="${pkgdir}" install
  make -C "data" DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/lib/xfce4"
  rm -rf "${pkgdir}/usr/share"
  rm -rf "${pkgdir}/usr/lib/mate-panel"
}

package_vala-panel-appmenu-mate-git() {
  pkgdesc="AppMenu (Global Menu) plugin for mate-panel"
  depends=('gtk3' 'bamf>=0.5.0' 'mate-panel-gtk3' 'libwnck3')
  optdepends=('gtk2-ubuntu: for hiding gtk2 menus'
            'unity-gtk-module: for gtk2/gtk3 menus'
            'gtk2-appmenu: for gtk2 menus, alternate way'
            'gtk3-appmenu: for gtk3 menus, alternate way'
            'appmenu-qt: for qt4 menus'
            'appmenu-qt5: for qt5 menus')
  cd "${srcdir}/${_pkgbase}"
  make -C "lib" DESTDIR="${pkgdir}" install
  make -C "data" DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/lib/xfce4"
  rm -rf "${pkgdir}/usr/share"
}

package_vala-panel-appmenu-translations-git() {
  pkgdesc="Translations for Global Menu"
  optdepends=('vala-panel-appmenu-xfce-git'
              'vala-panel-appmenu-valapanel-git'
              'vala-panel-appmenu-mate-git')
  arch=('any')
  cd "${srcdir}/${_pkgbase}"
  make -C "po" DESTDIR="${pkgdir}" install
}

