# Maintainer: KingofToasters <dev@sgregoratto.me>
pkgname=wdisplays-git
pkgver=r14.ff536e1
pkgrel=1
pkgdesc='GUI display configurator for wlroots compositors'
url='https://github.com/cyclopsian/wdisplays'
license=('MIT')
provides=('wdisplays')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('gtk3' 'libepoxy' 'wayland' 'wayland-protocols')
makedepends=('git' 'meson')
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
  arch-meson "$srcdir/build"
  ninja -C "$srcdir/build"
}

package() {
  DESTDIR="$pkgdir" ninja -C "$srcdir/build" install
  install -Dm644 "${pkgname%-git}/LICENSE" \
    "$pkgdir/usr/share/licenses/${pkgname}/LICENCE"
}
