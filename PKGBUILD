# Maintainer: Khing <alampayk@gmail.com>
# Contributor: Soon
pkgname=hdisplays
_pkgname="hdisplays"
pkgver=r72.515c2b0
pkgrel=1
pkgdesc='GUI display configurator for wlroots compositors **Maintained for Hyprland ***'
url='https://github.com/kRHYME7/Hypr-Display'
license=('GPL3')
provides=("$_pkgname")
conflicts=("$_pkgname")
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('gtk3')
makedepends=('git' 'meson' 'libepoxy' 'wayland' 'wayland-protocols' 'hyprland')
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
  install -D -m 644 "$srcdir/hdisplays/resources/hdisplays.svg" "$pkgdir"/usr/share/pixmaps/hdisplays.svg
  install -d -m 755 "$pkgdir"/usr/share/licenses/"$_pkgname"
  install -D -m 644 "$_pkgname"/LICENSES/* "$pkgdir"/usr/share/licenses/"$_pkgname"/
}

