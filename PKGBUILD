# Maintainer: Fabien JUIF <fabien.juif@gmail.com>
_application=shellshape
pkgname=gnome-shell-extension-${_application}-git
pkgrel=1
pkgver=r308.481d6d8
license=('GPL3')
pkgdesc="Tiling window manager extension for gnome-shell."
url="http://gfxmonk.net/shellshape"
arch=('x86_64' 'i686')
depends=('gnome-shell')
makedepends=('git' 'npm')
install=${pkgname}.install
source=(
  "git+https://github.com/timbertson/${_application}"
)
sha256sums=(
  'SKIP'
)

build() {
  cd ${srcdir}/${_application}
  make
}

package() {
  _builddir=${srcdir}/${_application}/${_application}

  # directories architecture
  mkdir -p ${pkgdir}/usr/share/gnome-shell/extensions/shellshape@gfxmonk.net
  mkdir -p ${pkgdir}/usr/share/icons/hicolor/scalable
  mkdir -p ${pkgdir}/usr/share/glib-2.0/schemas

  # copies
  # - extension
  _destdir="${pkgdir}/usr/share/gnome-shell/extensions/shellshape@gfxmonk.net"
  cp ${srcdir}/${_application}/build/gjs/*.js ${_destdir}
  cp ${_builddir}/metadata.json ${_destdir}
  cp ${_builddir}/shellshape.pot ${_destdir}
  cp -R ${_builddir}/lib ${_destdir}

  # - locales
  cp -R ${_builddir}/locale ${pkgdir}/usr/share/locale

  # - glib-2.0
  cp ${srcdir}/${_application}/schemas/*.xml ${pkgdir}/usr/share/glib-2.0/schemas/

  # - icons
  cp -R ${srcdir}/${_application}/icons/status ${pkgdir}/usr/share/icons/hicolor/scalable

}

pkgver() {
  cd ${_application}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:
