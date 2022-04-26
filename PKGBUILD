# Maintainer: fossdd <fossdd@tutanota.com>
pkgname=muon-meson-git
_pkgname=${pkgname%-meson-git}
pkgver=r1502.d69f0cc93af60cb73ba7
pkgrel=1
pkgdesc='meson implementation in C'
url='https://sr.ht/~lattis/muon'
license=(GPL3)
arch=(x86_64)
depends=(pkgconf curl zlib)
makedepends=(git meson scdoc)
conflicts=()
provides=(muon)
source=("git+https://git.sr.ht/~lattis/muon")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$_pkgname"
  meson -D prefix=/usr build
  ninja -C build
}

package() {
  cd "$_pkgname/build"
  DESTDIR="$pkgdir" meson install
}
