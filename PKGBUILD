# Maintainer: Yuki Sireneva <yuki dot utk8g at gmail dot com>
pkgname=refine-git
pkgver=r91.371932b
pkgrel=1
pkgdesc="Tweak various aspects of GNOME"
arch=('any')
url="https://gitlab.gnome.org/TheEvilSkeleton/Refine"
license=('GPL3')
depends=('libadwaita' 'python' 'python-gobject')
makedepends=('blueprint-compiler' 'git' 'meson')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.gnome.org/TheEvilSkeleton/refine.git')
b2sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  cd "${pkgname%-git}"
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
  install -Dm644 "${pkgname%-git}/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
