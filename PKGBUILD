# Maintainer: rilian-la-te <ria.freelander@gmail.com>
makedepends=('meson' 'gobject-introspection' 'vala' 'glib2' 'git' 'glib2-devel')

_pkgbase=vala-panel-appmenu
pkgname=appmenu-glib-translator-git
_path=subprojects/appmenu-glib-translator
pkgver=24.05.r2.g7631683
pkgrel=1
pkgdesc="GLib-based library for translating DBusMenu-exported menus into GMenuModels. Used for vala-panel's system tray and all variants of vala-panel-appmenu. Can be used with GTK3 or GTK4."
depends=('glib2')
provides=(appmenu-glib-translator)
conflicts=(appmenu-glib-translator)
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
  meson build "${srcdir}/${_pkgbase}/${_path}" --prefix=/usr --libexecdir=lib
  meson compile -C build
}

package()
{
  DESTDIR="$pkgdir" meson install -C build --no-rebuild
}
