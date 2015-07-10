# Maintainer: Patrick Wozniak <hello@patwoz.de>

pkgname=pi-blaster-git
_gitname=${pkgname%-*}
pkgver=20150610.r130.2cd6659
pkgrel=1
pkgdesc="Daemon for Raspberry Pi which provides an interface to drive multiple PWM via the GPIO pins"

arch=('any')
url="https://github.com/sarfata/pi-blaster/"
license=('MIT')

makedepends=('autoconf' 'git')
source=("git+https://github.com/sarfata/${_gitname}")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "%s.r%s.%s" "$(date +%Y%m%d)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$_gitname"
  ./autogen.sh
}

build() {
  cd "$_gitname"
  ./configure --sbindir=/usr/bin
  make
}

package() {
  cd "$_gitname"
  make DESTDIR="$pkgdir/" install
}
