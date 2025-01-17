# Maintainer: Yuki Sireneva <yuki dot utk8g at gmail dot com>
pkgname=refine-git
pkgver=0.4.0.r0.g4f6ec44
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
  git describe --tags --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
