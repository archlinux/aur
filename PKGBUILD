# Maintainer: ilovemikael <itsmeguys2247 at gmail dot com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Philipp Überbacher <murks at lavabit dot com>
_pkgname=calf
pkgname="${_pkgname}-git"
pkgver=0.90.8.r1.gd4fb554
pkgrel=1
pkgdesc="LV2/JACK audio plug-ins for musicians (git version)"
arch=('i686' 'x86_64')
url="http://calf-studio-gear.org/"
license=('GPL' 'LGPL')
depends=('fluidsynth' 'gtk2' 'lv2')
makedepends=('git' 'cmake')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/calf-studio-gear/calf")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local cmake_options=(
    -B build
    -GNinja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/usr
    -DWANT_EXPERIMENTAL=ON
    -DWANT_SSE=ON
    -DWANT_LASH=OFF
    -S "$_pkgname"
    -W no-dev
  )

  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $_pkgname/{AUTHORS,ChangeLog,README.md} -t "$pkgdir/usr/share/doc/$_pkgname"
}
