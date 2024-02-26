# Maintainer: rilian-la-te <ria.freelander@gmail.com>

_disable_mate=0
_disable_xfce=0
_disable_vala=0
_disable_budgie=0

pkgname=(
'genmon-plugin-common-git'
)

_opts=(
	--prefix=/usr
	--libdir=lib
	--libexecdir=lib
	-Dauto_features=disabled
)

makedepends=('meson' 'vala' 'gtk3')

if (("${_disable_mate}" == 0));then
	_opts+=(-Dmate=enabled)
	pkgname+=('mate-panel-genmon-git')
	makedepends+=('mate-panel')
#	msg "Mate applet enabled"
fi

if (("${_disable_xfce}" == 0));then
	_opts+=(-Dxfce=enabled)
	pkgname+=('xfce4-panel-genmon-ng-git')
	makedepends+=('xfce4-panel>=4.11.2')
#	msg "Xfce applet enabled"
fi

if (("${_disable_vala}" == 0));then
	_opts+=(-Dvalapanel=enabled)
	pkgname+=('vala-panel-genmon-git')
	makedepends+=('vala-panel>=0.4.60')
#	msg "Vala Panel applet enabled"
fi

if (("${_disable_budgie}" == 0));then
	_opts+=(-Dbudgie=enabled)
	pkgname+=('budgie-genmon-git')
	makedepends+=('budgie-desktop' 'gobject-introspection' 'libpeas')
#	msg "Budgie applet enabled"
fi


#msg "If you want to disable an applet, edit pkgbuild variables _disable_[applet]"

pkgbase=generic-monitor-plugin-git
_pkgbase=xfce4-genmon-plugin
pkgver=5.1.0.r41.gd8f2540
pkgrel=1
pkgdesc="Cyclically spawns a script/program, captures its output and displays the resulting string in the panel"
url="https://gitlab.com/vala-panel-project/xfce4-genmon-plugin"
arch=('i686' 'x86_64')
license=('LGPL')
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

package_xfce4-panel-genmon-ng-git(){
	pkgdesc="Cyclically spawns a script/program, captures its output and displays the resulting string in the panel"
	depends=('gtk3' 'xfce4-panel>=4.11.2' 'genmon-plugin-common-git')
	DESTDIR="${pkgdir}" meson install -C build
	rm -rf ${pkgdir}/usr/share/{genmon,vala-panel,glib-2.0,locale,mate-panel,vala-panel-appmenu,doc,licenses}
	rm -rf ${pkgdir}/usr/lib/{mate-panel,vala-panel,budgie-desktop}
}

package_mate-panel-genmon-git(){
	pkgdesc="Cyclically spawns a script/program, captures its output and displays the resulting string in the panel"
	depends=('gtk3' 'mate-panel' 'genmon-plugin-common-git')
	DESTDIR="${pkgdir}" meson install -C build
	rm -rf ${pkgdir}/usr/share/{genmon,vala-panel,glib-2.0,locale,xfce4,vala-panel-appmenu,doc,licenses}
	rm -rf ${pkgdir}/usr/lib/{xfce4,vala-panel,budgie-desktop}
}

package_vala-panel-genmon-git(){
	pkgdesc="Cyclically spawns a script/program, captures its output and displays the resulting string in the panel"
	depends=('gtk3' 'vala-panel>=0.4.60' 'genmon-plugin-common-git')
	DESTDIR="${pkgdir}" meson install -C build
	rm -rf ${pkgdir}/usr/share/{genmon,xfce4,glib-2.0,locale,mate-panel,vala-panel-appmenu,doc,licenses}
	rm -rf ${pkgdir}/usr/lib/{mate-panel,xfce4,budgie-desktop}
}

package_budgie-genmon-git(){
	pkgdesc="Cyclically spawns a script/program, captures its output and displays the resulting string in the panel"
	depends=('budgie-desktop' 'gtk3' 'libpeas' 'genmon-plugin-common-git')
  	cd "${srcdir}/${_pkgbase}"
	DESTDIR="${pkgdir}" meson install -C build
	rm -rf "${pkgdir}/usr/share/"
	rm -rf ${pkgdir}/usr/lib/{mate-panel,vala-panel,xfce4}
}

package_genmon-plugin-common-git(){
	pkgdesc="Translations and script examples for GenMon"
	depends=('bash' 'perl')	
	optdepends=('xfce4-panel-genmon-git' 'mate-panel-genmon-git' 'vala-panel-genmon-git' 'budgie-genmon-git')
	arch=('any')
	DESTDIR="${pkgdir}" meson install -C build
	rm -rf ${pkgdir}/usr/share/{vala-panel,xfce4,mate-panel}
	rm -rf ${pkgdir}/usr/lib
}
