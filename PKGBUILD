# Maintainer: Stephen Gregoratto <dev@sgregoratto.me>
pkgname=wdisplays-git
_pkgname="wdisplays"
pkgver=1.1.r0.ga9aa747
pkgrel=1
pkgdesc='GUI display configurator for wlroots compositors'
url='https://github.com/artizirk/wdisplays'
license=('GPL3')
provides=("$_pkgname")
conflicts=("$_pkgname")
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('gtk3')
makedepends=('git' 'meson')
source=("${pkgname%-git}::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$_pkgname"
  arch-meson "$srcdir/build"
  ninja -C "$srcdir/build"
}

package() {
  DESTDIR="$pkgdir" ninja -C "$srcdir/build" install
  install -D -m 644 "$srcdir/wdisplays/resources/wdisplays.svg" "$pkgdir"/usr/share/pixmaps/wdisplays.svg
  install -d -m 755 "$pkgdir"/usr/share/licenses/"$_pkgname"
  install -D -m 644 "$_pkgname"/LICENSES/* "$pkgdir"/usr/share/licenses/"$_pkgname"/
}
