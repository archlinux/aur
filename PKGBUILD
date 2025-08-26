#Maintainer: Dråfølin <derg@drafolin.ch>

pkgname=high-tide-git
pkgver=1.1.0.r1.ga2095c9
pkgrel=1
pkgdesc="Linux client for TIDAL streaming service"
url="https://github.com/Nokse22/high-tide"
arch=(any)
license=(GPL-3.0-or-later)
conflicts=('high-tide')
provides=("high-tide=${pkgver}")
depends=(
  dconf
  glib2
  gstreamer
  gst-plugins-base
  gst-plugins-good
  gtk4
  hicolor-icon-theme
  libadwaita
  libportal
  libsecret
  org.freedesktop.secrets
  python
  python-gobject
  'python-tidalapi>=0.8.6'
  xdg-desktop-portal
)
optdepends=(
  'alsa-utils: Advanced details in ALSA device picker'
  'python-pypresence>=4.3.0.r27.gd6709d3: Discord Rich Presence support'
)
makedepends=(
  blueprint-compiler
  git
  meson
)

source=("${pkgname}::git+https://github.com/Nokse22/high-tide.git")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --tags --long --abbrev=7 2>/dev/null | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  )
}

prepare() {
  cd $pkgname
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs ||:
}

package() {
  meson install -C build --destdir "$pkgdir"
}
