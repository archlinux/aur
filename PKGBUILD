# Maintainer: Donald Carr<sirspudd at gmail dot com>

#_qmake_args="CONFIG+=debug"
_pkgname=qt-gtk-platform-plugin
pkgname=${_pkgname}-git
provides=($_pkgname)
conflicts=($_pkgname)
pkgver=20200318.1149f4f
pkgrel=1
pkgdesc='GTK platform backend for Qt'
arch=('any')
url='https://github.com/CrimsonAS/gtkplatform'
license=('LGPL3')
source=("git://github.com/CrimsonAS/gtkplatform.git")
sha256sums=('SKIP')
install=${pkgname}.install

pkgver () {
  cd "${srcdir}/gtkplatform"
  echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git log -1 --format="%h")"
}

build() {
  cd "${srcdir}/gtkplatform"
  qmake DESTDIR=$srcdir
  make
}

package() {
  local env_dir=${pkgdir}/usr/share/qt-gtk-platform-plugin
  local pacman_hook_dir=${pkgdir}/etc/pacman.d/hooks
  local env_file=${startdir}/qt-force-gtk-platform.env
  local hook_file=${startdir}/100-qt-gtk-platform-plugin-git.hook

  mkdir -p ${env_dir} ${pacman_hook_dir}

  # FIXME: assumption riddled and does not permit input at present
  #cp ${hook_file} ${pacman_hook_dir}
  cp ${env_file} ${env_dir}

  cd "${srcdir}/gtkplatform"
  INSTALL_ROOT="$pkgdir" make install
}
