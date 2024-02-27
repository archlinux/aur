# Maintainer: rilian-la-te <ria.freelander@gmail.com>

makedepends=('meson' 'gtk3' 'gtk2' 'git')

_pkgbase=vala-panel-appmenu
pkgname=appmenu-gtk-module-git
_path=subprojects/appmenu-gtk-module
pkgver=24.02
pkgrel=2
pkgdesc="Gtk module for exporting menus"
depends=('gtk3' 'gtk2')
provides=(appmenu-gtk-module)
conflicts=(appmenu-gtk-module)
url="https://gitlab.com/vala-panel-project/vala-panel-appmenu"
arch=('i686' 'x86_64')
license=('LGPL3')

source=("git+https://gitlab.com/vala-panel-project/${_pkgbase}.git"
		80-appmenu-gtk-module.sh)
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
  meson build "${srcdir}/${_pkgbase}/${_path}" --prefix=/usr --libexecdir=lib
  meson compile -C build
}

package()
{
  DESTDIR="$pkgdir" meson install -C build --no-rebuild
  install -Dm755 80-appmenu-gtk-module.sh -t "$pkgdir"/etc/X11/xinit/xinitrc.d/
}
