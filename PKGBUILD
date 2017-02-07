# Maintainer: Alexander Görtz <aur@nyloc.de>

pkgname=qtcreator-ros-git
pkgver=0.1.alpha.r68.g2bd6745
pkgrel=1
pkgdesc="ROS related plugins for Qt Creator"
url="https://github.com/ros-industrial/ros_qtc_plugin"
arch=('i686' 'x86_64')
license=('Apache')
depends=('qtcreator' 'qtermwidget' 'yaml-cpp')
makedepends=('qt5-tools' 'qtcreator-src')
source=("${pkgname}"::"git+https://github.com/ros-industrial/ros_qtc_plugin.git"
        "0000-floor-include-math.patch")
sha256sums=('SKIP'
            '0668aacb960563aaad8d5b93a160ab8043ec39eec5772cfd4ce93b38d86ac448')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  # Patch missing include
  cd "${srcdir}/${pkgname}"
  git apply "../0000-floor-include-math.patch"
}

build() {
  # Build the plugins
  mkdir ${srcdir}/${pkgname}-build
  cd ${srcdir}/${pkgname}-build
  qmake \
      "QTC_SOURCE=/usr/src/qtcreator" \
      "LIBS+=-L/usr/lib/qtcreator/ -L/usr/lib/qtcreator/plugins" \
      ../${pkgname}/ros_qtc_plugin.pro -r
  make
}

package() {
  cd ${srcdir}/qt-creator-build
  install -m755 -d "${pkgdir}/usr/share/qtcreator/styles/"
  install -m644 share/qtcreator/styles/*.xml "${pkgdir}/usr/share/qtcreator/styles/"
  install -m755 -d "${pkgdir}/usr/share/qtcreator/templates/"
  cp -r share/qtcreator/templates "${pkgdir}/usr/share/qtcreator/templates/"
  install -m755 -d "${pkgdir}/usr/lib/qtcreator/plugins/"
  install -m644 lib/qtcreator/plugins/libROSProjectManager.so "${pkgdir}/usr/lib/qtcreator/plugins/"
}
