# Maintainer: Isaiah Bierbrauer <isaiah@isaiahbierbrauer.com>
pkgname=wsbg-git
pkgver=r132.de5e2aa
pkgrel=1
pkgdesc="Workspace wallpaper tool for Sway"
arch=("i686" "x86_64")
url="https://isaiahbierbrauer.com/wsbg"
license=("MIT")
depends=(
  "wayland"
  "pixman"
  "gdk-pixbuf2"
)
makedepends=(
  "meson"
  "git"
  "scdoc"
  "wayland-protocols"
)
provides=("wsbg")
conflicts=("wsbg")
source=("${pkgname}::git+https://github.com/saibier/wsbg.git#branch=main")
sha1sums=("SKIP")

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson "${pkgname}" build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dm644 "${pkgname}/LICENSE" -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
  install -Dm644 "${pkgname}/README.md" -t "$pkgdir/usr/share/doc/${pkgname%-git}"
}
