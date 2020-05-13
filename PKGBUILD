# Maintainer: Stephen Gregoratto <dev@sgregoratto.me>
pkgname=wdisplays-git
pkgver=r46.dd7e1e2
pkgrel=1
pkgdesc='GUI display configurator for wlroots compositors'
url='https://github.com/cyclopsian/wdisplays'
license=('GPL')
provides=('wdisplays')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('gtk3')
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
}
