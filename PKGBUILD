# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Philipp Überbacher <murks at lavabit dot com>

_pkgname=calf
pkgname="${_pkgname}-git"
pkgver=0.90.0.r2499.bc104350
pkgrel=2
pkgdesc="LV2/JACK audio plug-ins for musicians (git version)"
arch=('i686' 'x86_64')
url="http://calf-studio-gear.org/"
license=('GPL' 'LGPL')
depends=('fluidsynth' 'gtk2' 'lv2')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/calf-studio-gear/calf")
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
    --enable-sse \
    --without-lash
  make
}

package(){
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="$pkgdir/" install
}
