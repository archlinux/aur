# Maintainer: rilian-la-te <ria.freelander@gmail.com>

_opts=(
	-DCMAKE_INSTALL_PREFIX=/usr
	-DCMAKE_INSTALL_LIBDIR=lib
	-DCMAKE_INSTALL_LIBEXECDIR=lib
)

makedepends=('cmake' 'gtk3' 'gtk2' 'git')

_pkgbase=vala-panel-appmenu
pkgname=appmenu-gtk-module-git
_path=subprojects/appmenu-gtk-module
pkgver=0.6.94
pkgrel=2
pkgdesc="Gtk module for exporting menus"
depends=('gtk3' 'gtk2')
provides=(unity-gtk-module)
url="https://gitlab.com/vala-panel-project/vala-panel-appmenu"
arch=('i686' 'x86_64')
license=('LGPL3')

source=("git+https://gitlab.com/vala-panel-project/${_pkgbase}.git"
		80appmenu-gtk-module)
sha256sums=('SKIP'
			'4c006c4ea7b8556070ad6d35529d3a9e23da8033429e34d1824c25942d969fbc')

pkgver() {
  cd "${srcdir}/${_pkgbase}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${_pkgbase}/${_path}"
  cmake ./ "${_opts[@]}"
  make
}

package()
{
  cd "${srcdir}/${_pkgbase}/${_path}"
  make DESTDIR="${pkgdir}" install
  install -dm755 "${pkgdir}/etc/X11/xinit/xinitrc.d/"
  install -m755  "${srcdir}/80appmenu-gtk-module" "${pkgdir}/etc/X11/xinit/xinitrc.d/"
}
