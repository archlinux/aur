# Maintainer: KingofToasters <dev@sgregoratto.me>
pkgname=wev-git
pkgver=r3.47d1739
pkgrel=2
pkgdesc='Print wayland events, like xev(1)'
url='https://git.sr.ht/~sircmpwn/wev'
license=('MIT')
provides=('wev')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('wayland' 'wayland-protocols' 'libxkbcommon')
makedepends=('git' 'scdoc')
source=("${pkgname%-git}::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${pkgname%-git}"
  make
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir/" PREFIX="/usr" MANDIR="/usr/share/man" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENCE"
}
