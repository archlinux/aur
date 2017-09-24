# Maintainer: Donald Carr<sirspudd at gmail dot com>

#_qmake_args="CONFIG+=debug"
pkgname=qt-gtk-platform-plugin
pkgver=0.0.193
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
  local profiled_dir=${pkgdir}/etc/profile.d
  mkdir -p $profiled_dir
  cd "${srcdir}/gtkplatform"
  cp ${startdir}/qt-force-gtk-platform.sh ${profiled_dir}
  INSTALL_ROOT="$pkgdir" make install
}
