# Maintainer: WindClan <monstertoast2@gmail.com>

_disable_mate=1
_disable_xfce=0
_disable_vala=1
_disable_budgie=1

_opts=(
	--prefix=/usr
	--libdir=lib
	--libexecdir=lib
	-Dauto_features=disabled
	-Dxfce=enabled
)

pkgname=('xfce4-appmenu-plugin-git')

makedepends=('meson' 'vala' 'gtk3' 'libwnck3' 'appmenu-glib-translator' 'git' 'glib2-devel' 'xfce4-panel>=4.11.2' 'xfconf')


pkgbase=xfce4-appmenu-plugin-git
pkgver=25.04.r8.gaea4ea3
pkgrel=1
pkgdesc="Application menu (global menu) plugin for Xfce4 [doesn't install 5 other DEs for build]"
url="https://gitlab.com/vala-panel-project/vala-panel-appmenu"
arch=('i686' 'x86_64' 'pentium4' 'powerpc64le' 'aarch64' 'arm' 'armv6h' 'armv7h' 'riscv64')
license=('LGPL3')

source=("git+https://gitlab.com/vala-panel-project/vala-panel-appmenu.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/vala-panel-appmenu"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}


build() {
  meson "${_opts[@]}" build "${srcdir}/vala-panel-appmenu"
  meson compile -C build
}

package() {
  pkgdesc="Application menu (global menu) plugin for Xfce4"
  conflicts=('vala-panel-appmenu-xfce' 'vala-panel-appmenu-xfce-git' 'vala-panel-appmenu-common' 'vala-panel-appmenu-common-git')
  provides=("xfce4-appmenu-plugin=${pkgver}")
  depends=('gtk3' 'xfce4-panel>=4.11.2' 'xfconf' 'libwnck3' 'appmenu-glib-translator')
  optdepends=('appmenu-gtk-module: for gtk2/gtk3 menus'
            'vala-panel-appmenu-registrar: for DBusMenu registrar' 
            'jayatana: for Java applications support'
            'appmenu-qt4: for qt4 menus')
  DESTDIR="${pkgdir}" meson install -C build
  rm -rf ${pkgdir}/usr/share/{vala-panel,mate-panel}
  rm -rf ${pkgdir}/usr/lib/{mate-panel,vala-panel,budgie-desktop}
}
