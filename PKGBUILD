# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=purism-stream-git
_pkgname=Stream
pkgver=0.1.6.r0.g36db6ed
pkgrel=1
pkgdesc="YouTube client for GNOME, built for the Librem 5"
arch=('x86_64')
url="https://source.puri.sm/todd/Stream"
license=('GPL3')
depends=('gtk3' 'libhandy' 'pulseaudio')
makedepends=('meson' 'python')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  arch-meson "$_pkgname" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
