# Maintainer: rilian-la-te <ria.freelander@gmail.com>
makedepends=('meson' 'gobject-introspection' 'vala' 'glib2' 'git')

_pkgbase=vala-panel-appmenu
pkgname=appmenu-glib-translator-git
_path=subprojects/appmenu-glib-translator
pkgver=24.02.r0.g469739b
pkgrel=1
pkgdesc="Gtk module for exporting menus"
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
