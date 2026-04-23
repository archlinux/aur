# Maintainer: Eslam Allam <eslamallam73@gmail.com>

pkgname=nwg-look-flatpak-git
_pkgname=nwg-look
pkgver=r198.78159d1
pkgrel=1
pkgdesc="GTK settings editor adapted to work on wlroots-based compositors (With added flatpak support)"
url="https://github.com/eslam-allam/nwg-look"
arch=('x86_64')
license=('MIT')
depends=(
  'glibc'
  'gtk3'
  'libatk-1.0.so'
  'libcairo-gobject.so'
  'libcairo.so'
  'libfontconfig.so'
  'libgdk-3.so'
  'libgdk_pixbuf-2.0.so'
  'libgio-2.0.so'
  'libglib-2.0.so'
  'libgmodule-2.0.so'
  'libgobject-2.0.so'
  'libgtk-3.so'
  'libharfbuzz.so'
  'libpango-1.0.so'
  'libpangocairo-1.0.so'
  'libz.so'
  'xcur2png'
)
makedepends=(
  'go'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
  cd ${pkgname}
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -o bin/nwg-look \
    .
}

package() {
  make DESTDIR="${pkgdir}" install -C "${pkgname}"
}

# vim: ts=2 sw=2 et:
