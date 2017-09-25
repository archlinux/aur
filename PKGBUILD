# Maintainer: Donald Carr<sirspudd at gmail dot com>

#_qmake_args="CONFIG+=debug"
_pkgname=qt-gtk-platform-plugin
pkgname=${_pkgname}-git
provides=($_pkgname)
pkgver=0.0.202
pkgrel=1
pkgdesc='GTK platform backend for Qt'
arch=('any')
url='https://github.com/CrimsonAS/gtkplatform'
license=('LGPL3')
source=("git://github.com/CrimsonAS/gtkplatform.git")
sha256sums=('SKIP')

pkgver () {
  cd "${srcdir}/gtkplatform"
  if git describe --tags --long; then
    git describe --tags --long | sed -r 's/^v//;s/-RC/RC/;s/([^-]*-g)/r\1/;s/-/./g'
  else
    echo "0.0.$(git rev-list --count HEAD)"
  fi
}

build() {
  cd "${srcdir}/gtkplatform"
  qmake DESTDIR=$srcdir
  make
}

package() {
  local env_dir=${pkgdir}/usr/share/gdm/env.d/
  local env_file=${startdir}/qt-force-gtk-platform.env

  mkdir -p $env_dir
  cp ${env_file} ${env_dir}

  cd "${srcdir}/gtkplatform"
  INSTALL_ROOT="$pkgdir" make install
}
