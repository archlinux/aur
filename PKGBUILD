# Maintainer: Fabien JUIF <fabien.juif@gmail.com>
application=shellshape
pkgname=gnome-shell-extension-${application}-git
pkgrel=1
pkgver=r306.839fe66
license=('GPL3')
pkgdesc="Tiling window manager extension for gnome-shell."
url="http://gfxmonk.net/shellshape"
arch=('x86_64' 'i686')
depends=('gnome-shell')
makedepends=('git' 'npm')
install=${pkgname}.install
source=(
  "git+https://github.com/timbertson/${application}"
)
sha256sums=(
  'SKIP'
)

build() {
  cd ${srcdir}/${application}
  build_dir=${srcdir}/${application}/${application}

  # build it
  make
}

package() {
  build_dir=${srcdir}/${application}/${application}

  # directories architecture
  mkdir -p ${pkgdir}/usr/share/gnome-shell/extensions/shellshape@gfxmonk.net
  mkdir -p ${pkgdir}/usr/share/icons
  mkdir -p ${pkgdir}/usr/share/glib-2.0/schemas

  # copies
  # - extension
  dest_dir="${pkgdir}/usr/share/gnome-shell/extensions/shellshape@gfxmonk.net"
  cp ${srcdir}/${application}/build/gjs/*.js ${dest_dir}/
  cp ${build_dir}/metadata.json ${dest_dir}/
  cp ${build_dir}/shellshape.pot ${dest_dir}/
  cp -R ${build_dir}/lib ${dest_dir}/

  # Locales
  cp -R ${build_dir}/locale ${pkgdir}/usr/share/locale

  # Glib-2.0
  cp ${srcdir}/${application}/schemas/*.xml ${pkgdir}/usr/share/glib-2.0/schemas/

  # Icons
  cp -R ${srcdir}/${application}/icons ${pkgdir}/usr/share/icons

}

pkgver() {
  cd ${application}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:
