# Maintainer: Manuel Stoeckl <com dоt mstoeckl аt wppkgb>
# Contributor: Stephen Gregoratto <dev@sgregoratto.me>
# Contributor: gilbus <aur@tinkershell.eu>
pkgname=swaylock-plugin-git
pkgver=1.5.r61.g44d6234
pkgrel=1
pkgdesc='Screen locker for Wayland -- Fork with background plugin support '
url='https://github.com/mstoeckl/swaylock-plugin'
license=('MIT')
provides=('swaylock')
conflicts=('swaylock')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('wayland' 'libxkbcommon' 'pam' 'cairo' 'gdk-pixbuf2' 'swaybg')
makedepends=('meson' 'git' 'scdoc' 'wayland-protocols')
optdepends=('mpvpaper')
source=("${pkgname%-git}::git+$url")
sha1sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${pkgname%-git}"
  # Fix ticket FS#31544, sed line taken from gentoo
  sed -i -e 's:login:system-auth:' "pam/swaylock"
}

build() {
  mkdir -p build
  # makepkg is unable to strip the binary, so we tell meson to do it.
  arch-meson build "${pkgname%-git}" -Dwerror=false --strip
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 "${pkgname%-git}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et
