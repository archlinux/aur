# ---------------------------------------------------------------
# Maintainer: Romain Bazile <gromain.baz at gmail dot com>
# ---------------------------------------------------------------

pkgname=opencpn-plugin-climatology
pkgver=1.4.r69.g5c8e992
pkgrel=1
pkgdesc="Climatology plugin for OpenCPN"
arch=('x86_64')
license=("GPL3")
depends=('opencpn')
makedepends=('cmake' 'git')
url="https://opencpn.org/OpenCPN/plugins/climatology.html"
source=("$pkgname::git+https://github.com/seandepagnier/climatology_pi.git")
sha1sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare(){
  cd ${srcdir}/${pkgname}
  git submodule init
  git submodule sync
  git submodule update
  rm data/.git
}
          
build() {
  cd ${srcdir}/${pkgname}
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config-gtk3 ..
  make
}

package() {
  cd "${pkgname}/build"
  DESTDIR="$pkgdir" make install
}
