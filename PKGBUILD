# Maintainer : Yamada Hayao <hayao@fascode.net>
# Contributer: rilian-la-te <ria.freelander@gmail.com>

_disable_mate=false
_disable_xfce=false
_disable_vala=false
_disable_budgie=true

_opts=(
	--prefix=/usr
	--libdir=lib
	--libexecdir=lib
	-Dauto_features=disabled
)

pkgname=('vala-panel-appmenu-common')

makedepends=('meson' 'vala' 'gtk3' 'libwnck3' 'bamf>=0.5.0' 'git')

if [[ "${_disable_mate}" = false ]];then
    _opts+=(-Dmate=enabled)
    pkgname+=('vala-panel-appmenu-mate')
    makedepends+=('mate-panel')
    #msg "Mate applet enabled"
fi

if [[ "${_disable_xfce}" = false ]];then
    _opts+=(-Dxfce=enabled)
    pkgname+=('vala-panel-appmenu-xfce')
    makedepends+=('xfce4-panel>=4.11.2' 'xfconf')
    # msg "Xfce applet enabled"
fi

if [[ "${_disable_vala}" = false ]]; then
    _opts+=(-Dvalapanel=enabled)
    pkgname+=('vala-panel-appmenu-valapanel')
    makedepends+=('vala-panel>=0.4.50')
    # msg "Vala Panel applet enabled"
fi

if [[ "${_disable_budgie}" = false ]]; then
    _opts+=(-Dbudgie=enabled)
    pkgname+=('vala-panel-appmenu-budgie')
    # msg "Budgie applet enabled"
fi


#msg "If you want to disable an applet, edit pkgbuild variables _disable_[applet]"

_pkgbase="vala-panel-appmenu"
pkgbase="${_pkgbase}"
pkgver="0.7.6"
pkgrel="3"
pkgdesc="AppMenu (Global Menu) plugin"
url="https://gitlab.com/vala-panel-project/vala-panel-appmenu"
arch=('i686' 'x86_64')
license=('LGPL3')

source=("git+https://gitlab.com/vala-panel-project/${_pkgbase}.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
    sed -i 's/nb //' "${srcdir}/vala-panel-appmenu/po/LINGUAS"
    meson "${_opts[@]}" build "${srcdir}/${_pkgbase}"
    meson compile -C build
}

package_vala-panel-appmenu-xfce() {
    pkgdesc="AppMenu (Global Menu) plugin for xfce4-panel"
    depends=('gtk3' 'bamf>=0.5.0' 'xfce4-panel>=4.11.2' 'xfconf' 'libwnck3' 'vala-panel-appmenu-common')
    optdepends=(
        'gtk2-ubuntu: for hiding gtk2 menus'
        'unity-gtk-module: for gtk2/gtk3 menus'
        'vala-panel-appmenu-registrar: for DBusMenu registrar' 
        'jayatana: for Java applications support'
        'appmenu-qt4: for qt4 menus'
        'appmenu-qt5: for qt5 menus'
    )
    conflicts=("vala-panel-appmenu-xfce-git")

    DESTDIR="${pkgdir}" meson install -C build
    rm -rf ${pkgdir}/usr/share/{vala-panel,glib-2.0,locale,mate-panel,vala-panel-appmenu}
    rm -rf ${pkgdir}/usr/lib/{mate-panel,vala-panel,budgie-desktop}
}

package_vala-panel-appmenu-valapanel() {
    pkgdesc="AppMenu (Global Menu) plugin for vala-panel"
    depends=('gtk3' 'bamf>=0.5.0' 'vala-panel' 'libwnck3' 'vala-panel-appmenu-common')
    optdepends=(
        'gtk2-ubuntu: for hiding gtk2 menus'
        'unity-gtk-module: for gtk2/gtk3 menus'
        'vala-panel-appmenu-registrar: for DBusMenu registrar' 
        'jayatana: for Java applications support'
        'appmenu-qt4: for qt4 menus'
        'appmenu-qt5: for qt5 menus'
    )
    conflicts=("vala-panel-appmenu-valapanel-git")

    DESTDIR="${pkgdir}" meson install -C build
    rm -rf ${pkgdir}/usr/share/{xfce4,glib-2.0,locale,mate-panel,vala-panel-appmenu}
    rm -rf ${pkgdir}/usr/lib/{mate-panel,xfce4,budgie-desktop}
}

package_vala-panel-appmenu-mate() {
    pkgdesc="AppMenu (Global Menu) plugin for mate-panel"
    depends=('gtk3' 'bamf>=0.5.0' 'mate-panel' 'libwnck3' 'vala-panel-appmenu-common')
    optdepends=(
        'gtk2-ubuntu: for hiding gtk2 menus'
        'unity-gtk-module: for gtk2/gtk3 menus'
        'vala-panel-appmenu-registrar: for DBusMenu registrar' 
        'jayatana: for Java applications support'
        'appmenu-qt4: for qt4 menus'
        'appmenu-qt5: for qt5 menus'
    )
    conflicts=("vala-panel-appmenu-mate-git")

    DESTDIR="${pkgdir}" meson install -C build
    rm -rf ${pkgdir}/usr/share/{vala-panel,glib-2.0,locale,xfce4,vala-panel-appmenu}
    rm -rf ${pkgdir}/usr/lib/{xfce4,vala-panel,budgie-desktop}
}

package_vala-panel-appmenu-budgie() {
    pkgdesc="AppMenu (Global Menu) plugin for budgie-panel"
    depends=('gtk3' 'bamf>=0.5.0' 'budgie-desktop' 'libwnck3' 'vala-panel-appmenu-common')
    optdepends=(
        'gtk2-ubuntu: for hiding gtk2 menus'
        'unity-gtk-module: for gtk2/gtk3 menus'
        'vala-panel-appmenu-registrar: for DBusMenu registrar' 
        'jayatana: for Java applications support'
        'appmenu-qt4: for qt4 menus'
        'appmenu-qt5: for qt5 menus'
    )
    conflicts=("vala-panel-appmenu-budgie-git")

    DESTDIR="${pkgdir}" meson install -C build
    rm -rf "${pkgdir}/usr/share/"
    rm -rf ${pkgdir}/usr/lib/{mate-panel,vala-panel,xfce4}
}

package_vala-panel-appmenu-common() {
    pkgdesc="Translations and common files for Global Menu"
    replaces=('vala-panel-appmenu-translations-git')
    optdepends=(
        'vala-panel-appmenu-xfce'
        'vala-panel-appmenu-valapanel'
        'vala-panel-appmenu-mate'
        'vala-panel-appmenu-budgie'
    )
    conflicts=("vala-panel-appmenu-common-git")
    arch=('any')

    DESTDIR="${pkgdir}" meson install -C build
    rm -rf ${pkgdir}/usr/share/{vala-panel,xfce4,mate-panel}
    rm -rf ${pkgdir}/usr/lib
}
