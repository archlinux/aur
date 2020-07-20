# Maintainer: Milkii Brewster <milkii on Freenode IRC>
maintaner="Milkii Brewster <milkii on Freenode IRC>"
pkgname=x42-sisco-cv-git
pkgdesc="Oscilloscope, varient of sisco.lv2 but with CV ports"
pkgver=r228.ce8139f
pkgrel=1
epoch=
arch=(x86_64)
url="https://github.com/x42/sisco.lv2"
license=(GPL)
groups=()
depends=('lv2' 'pango' 'cairo' 'mesa')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=($pkgname::git+https://github.com/x42/sisco.lv2)
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
	cd "$pkgname"
  make submodules
}

build() {
	cd "$pkgname"
  sed -i 's#sisco.lv2#sisco-cv.lv2#' Makefile
  sed -i 's#LV2NAME=sisco#LV2NAME=sisco-cv#' Makefile
  sed -i 's#http://gareus.org/oss/lv2/sisco#http://gareus.org/oss/lv2/sisco-cv#' src/uris.h
  mv lv2ttl/sisco.ttl.in lv2ttl/sisco-cv.ttl.in
  mv lv2ttl/sisco.lv2.ttl.in lv2ttl/sisco-cv.lv2.ttl.in
  mv lv2ttl/sisco.gui.ttl.in lv2ttl/sisco-cv.gui.ttl.in
	make
}

package()  {
	cd "$pkgname"
  sed -i 's#AudioPort#CVPort#' build/sisco-cv.ttl
  sed -i 's#http://gareus.org/oss/lv2/sisco#http://gareus.org/oss/lv2/sisco-cv#' build/sisco-cv.ttl
  sed -i 's#Simple Scope #Simple Scope CV #' build/sisco-cv.ttl
  # sed -i 's#http://gareus.org/oss/lv2/sisco#http://gareus.org/oss/lv2/sisco-cv#' build/manifest.ttl
	make DESTDIR="$pkgdir/" PREFIX="/usr" install-lv2
}
