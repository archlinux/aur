# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Philipp Überbacher <murks at lavabit dot com>

_pkgname=calf
pkgname="${_pkgname}-git"
pkgver=0.0.60.r2236.f1f85c0
pkgrel=1
pkgdesc="LV2/JACK audio plug-ins for musicians"
arch=('i686' 'x86_64')
url="http://calf.sourceforge.net/"
license=('GPL' 'LGPL')
depends=('desktop-file-utils' 'fluidsynth' 'gtk-update-icon-cache' 'lash'
         'lv2')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install="$pkgname.install"
source=("${_pkgname}::git+git://repo.or.cz/calf.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  version=$(awk -F '[][]' '/AC_INIT/{print $4}' configure.ac)
  revision=$(git rev-list --count HEAD)
  hash=$(git rev-parse --short HEAD)
  echo $version.r$revision.$hash
}

build() {
  cd "${srcdir}/${_pkgname}"
  ./autogen.sh \
    --prefix="/usr" \
    --enable-static=no \
    --enable-experimental \
    --enable-sse
  make
}

package(){
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="$pkgdir/" install
}
