# Maintainer: rilian-la-te <ria.freelander@gmail.com>

_disable_mate=0
_disable_xfce=0
_disable_vala=0
_disable_budgie=0

pkgname=(
'genmon-plugin-common-git'
)

_opts=(
	-DCMAKE_INSTALL_PREFIX=/usr 
	-DCMAKE_INSTALL_LIBDIR=lib
	-DCMAKE_INSTALL_LIBEXECDIR=lib
)

makedepends=('cmake' 'vala' 'gtk3' 'libpeas')

if (("${_disable_mate}" == 0));then
	_opts+=(-DENABLE_MATE=ON)
	pkgname+=('mate-panel-genmon-git')
	makedepends+=('mate-panel')
#	msg "Mate applet enabled"
else
	_opts+=(-DENABLE_MATE=OFF)
fi

if (("${_disable_xfce}" == 0));then
	_opts+=(-DENABLE_XFCE=ON)
	pkgname+=('xfce4-panel-genmon-ng-git')
	makedepends+=('xfce4-panel>=4.11.2')
#	msg "Xfce applet enabled"
else
	_opts+=(-DENABLE_XFCE=OFF)
fi

if (("${_disable_vala}" == 0));then
	_opts+=(-DENABLE_VALAPANEL=ON)
	pkgname+=('vala-panel-genmon-git')
	makedepends+=('vala-panel>=0.4.60')
#	msg "Vala Panel applet enabled"
else
	_opts+=(-DENABLE_VALAPANEL=OFF)
fi

if (("${_disable_budgie}" == 0));then
	_opts+=(-DENABLE_BUDGIE=ON)
	pkgname+=('budgie-genmon-git')
	makedepends+=('budgie-desktop')
#	msg "Budgie applet enabled"
else
	_opts+=(-DENABLE_BUDGIE=OFF)
fi


#msg "If you want to disable an applet, edit pkgbuild variables _disable_[applet]"

pkgbase=generic-monitor-plugin-git
_pkgbase=xfce4-genmon-plugin
_cmakename=cmake-vala
_dbusmenuname=vala-dbusmenu
pkgver=5.0.0
pkgrel=3
pkgdesc="Cyclically spawns a script/program, captures its output and displays the resulting string in the panel"
url="https://gitlab.com/vala-panel-project/xfce4-genmon-plugin"
arch=('i686' 'x86_64')
license=('LGPL')
source=("git+https://gitlab.com/vala-panel-project/${_pkgbase}.git"
        "git+https://gitlab.com/vala-panel-project/${_cmakename}.git")
sha256sums=('SKIP'
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
}

build(){
	cd "${srcdir}/${_pkgbase}"
	cmake ./ "${_opts[@]}"
	make
}

package_xfce4-panel-genmon-ng-git(){
	pkgdesc="Cyclically spawns a script/program, captures its output and displays the resulting string in the panel"
	depends=('gtk3' 'xfce4-panel>=4.11.2' 'genmon-plugin-common-git')
	cd "${srcdir}/${_pkgbase}"
	make -C "src" DESTDIR="${pkgdir}" install
	make -C "data" DESTDIR="${pkgdir}" install
	rm -rf "${pkgdir}/usr/lib/genmon-scripts"
	rm -rf "${pkgdir}/usr/lib/vala-panel"
	rm -rf "${pkgdir}/usr/share/mate-panel"
	rm -rf "${pkgdir}/usr/share/vala-panel"
	rm -rf "${pkgdir}/usr/lib/mate-panel"
	rm -rf "${pkgdir}/usr/lib/budgie-desktop"
	rm -rf "${pkgdir}/usr/share/glib-2.0"
	rm -rf "${pkgdir}/usr/share/dbus-1"
}

package_mate-panel-genmon-git(){
	pkgdesc="Cyclically spawns a script/program, captures its output and displays the resulting string in the panel"
	depends=('gtk3' 'mate-panel' 'genmon-plugin-common-git')
	cd "${srcdir}/${_pkgbase}"
	make -C "src" DESTDIR="${pkgdir}" install
	make -C "data" DESTDIR="${pkgdir}" install
	rm -rf "${pkgdir}/usr/lib/genmon-scripts"
	rm -rf "${pkgdir}/usr/lib/vala-panel"
	rm -rf "${pkgdir}/usr/lib/xfce4"
	rm -rf "${pkgdir}/usr/share/xfce4"
	rm -rf "${pkgdir}/usr/share/vala-panel"
	rm -rf "${pkgdir}/usr/lib/budgie-desktop"
	rm -rf "${pkgdir}/usr/share/glib-2.0"
}

package_vala-panel-genmon-git(){
	pkgdesc="Cyclically spawns a script/program, captures its output and displays the resulting string in the panel"
	depends=('gtk3' 'vala-panel>=0.4.60' 'genmon-plugin-common-git')
	cd "${srcdir}/${_pkgbase}"
	make -C "src" DESTDIR="${pkgdir}" install
	make -C "data" DESTDIR="${pkgdir}" install
	rm -rf "${pkgdir}/usr/lib/genmon-scripts"
	rm -rf "${pkgdir}/usr/lib/xfce4"
	rm -rf "${pkgdir}/usr/share/xfce4"
	rm -rf "${pkgdir}/usr/share/mate-panel"
	rm -rf "${pkgdir}/usr/lib/mate-panel"
	rm -rf "${pkgdir}/usr/lib/budgie-desktop"
	rm -rf "${pkgdir}/usr/share/glib-2.0"
	rm -rf "${pkgdir}/usr/share/dbus-1"
}

package_budgie-genmon-git(){
	pkgdesc="Cyclically spawns a script/program, captures its output and displays the resulting string in the panel"
	depends=('budgie-desktop' 'gtk3' 'libpeas' 'genmon-plugin-common-git')
  	cd "${srcdir}/${_pkgbase}"
  	make -C "src" DESTDIR="${pkgdir}" install
  	make -C "data" DESTDIR="${pkgdir}" install
	rm -rf "${pkgdir}/usr/lib/genmon-scripts"
	rm -rf "${pkgdir}/usr/lib/xfce4"
	rm -rf "${pkgdir}/usr/share/xfce4"
	rm -rf "${pkgdir}/usr/share/mate-panel"
	rm -rf "${pkgdir}/usr/share/vala-panel"
	rm -rf "${pkgdir}/usr/lib/mate-panel"
	rm -rf "${pkgdir}/usr/lib/vala-panel"
	rm -rf "${pkgdir}/usr/share/glib-2.0"
	rm -rf "${pkgdir}/usr/share/dbus-1"
}

package_genmon-plugin-common-git(){
	pkgdesc="Translations and script examples for GenMon"
	depends=('bash' 'perl')	
	optdepends=('xfce4-panel-genmon-git' 'mate-panel-genmon-git' 'vala-panel-genmon-git' 'budgie-genmon-git')
	arch=('any')
	cd "${srcdir}/${_pkgbase}"
	make -C "po" DESTDIR="${pkgdir}" install
	make -C "data" DESTDIR="${pkgdir}" install
	rm -rf "${pkgdir}/usr/share/xfce4"
	rm -rf "${pkgdir}/usr/share/mate-panel"
	rm -rf "${pkgdir}/usr/share/vala-panel"
	rm -rf "${pkgdir}/usr/share/dbus-1"
	rm -rf "${pkgdir}/usr/lib/mate-panel"
	rm -rf "${pkgdir}/usr/lib/vala-panel"
	rm -rf "${pkgdir}/usr/lib/budgie-desktop"
	rm -rf "${pkgdir}/usr/lib/xfce4"
}
