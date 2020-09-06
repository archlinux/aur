# Maintainer: rilian-la-te <ria.freelander@gmail.com>

makedepends=('meson' 'glib2' 'git')

_pkgbase=vala-panel-appmenu
pkgname=vala-panel-appmenu-registrar-git
_path=subprojects/registrar
pkgver=0.7.3
pkgrel=1
pkgdesc="Small utility to hold DBusMenu menus"
provides=(vala-panel-appmenu-registrar)
depends=('glib2')
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
