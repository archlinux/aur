# Maintainer: 0xMRTT < 0xMRTT at proton dot me >


pkgname=gnome-shell-extension-valent-git
pkgver=r41.dcfebec
pkgrel=1
pkgdesc=" GNOME Shell integration for Valent "
arch=('any')
url="https://github.com/andyholmes/gnome-shell-extension-valent"
license=('GPL3')
makedepends=('git' 'meson' 'gnome-common')
optdepends=('valent')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}

