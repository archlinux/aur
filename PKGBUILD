# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>

pkgname=high-tide
pkgver=r225.5770c6c
pkgrel=1
pkgdesc="Linux client for TIDAL streaming service"
url="https://github.com/Nokse22/high-tide"
arch=(any)
license=(GPL-3.0-or-later)
depends=(
  dconf
  glib2
  gstreamer
  gtk4
  hicolor-icon-theme
  libadwaita
  libsecret
  python
  python-gobject
  python-tidalapi
)
makedepends=(
  blueprint-compiler
  git
  meson
)

source=("git+https://github.com/Nokse22/high-tide.git"
        "0001-Set-better-permissions-HighTide.patch"
        "0002-Have-working-categories-in-the-desktop-file.patch")
b2sums=('SKIP'
        'bfc5123ba7ee360cde7a543c16461f912b5264a607fe238ad45b34d95b8e10116a1d887d486ece973e7084e432c17c423460fddf93eaa044ebbac71c5d8a2d6f'
        '8fcb070daab0bbe9d6ef8108188295f5b8a11fe85241d6fdd86aace4ec4062841089cc56678a423885ddfa42f906868eb0aa5cefca08b979aac2dc5785d08b89')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd $pkgname

  # Set better permissions for 'HighTide'
  ## https://github.com/Nokse22/high-tide/pull/19
  git apply -3 ../0001-Set-better-permissions-HighTide.patch

  # Have working categories in the desktop file
  ## https://github.com/Nokse22/high-tide/pull/20
  git apply -3 ../0002-Have-working-categories-in-the-desktop-file.patch
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
