# Maintainer:

_pkgname="tuba"
pkgname="$_pkgname-git"
pkgver=0.10.2.r0.g4ec7c8d
pkgrel=1
pkgdesc='Browse the Fediverse'
url="https://github.com/GeopJr/Tuba"
license=('GPL-3.0-only')
arch=(
  aarch64 #ALARM
  armv7h  #ALARM
  i686    #Arch Linux32
  x86_64  #Arch Linux
)

depends=(
  gtk4
  gtksourceview5
  libadwaita
  libclapper-gtk
  libgee
  libgexiv2
  libicuuc.so # icu
  libsecret
  libspelling
  webkitgtk-6.0
  webp-pixbuf-loader # gdk-pixbuf2
)
makedepends=(
  git
  meson
  vala
)

provides+=("$_pkgname=${pkgver%%.r*}")
conflicts+=("$_pkgname")

_pkgsrc="$_pkgname"
source+=("$_pkgsrc"::"git+$url.git")
sha256sums+=('SKIP')

pkgver() (
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
)

build() {
  arch-meson "$_pkgsrc" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  depends+=(
    hicolor-icon-theme
  )

  meson install -C build --destdir "$pkgdir"
  ln -sf "dev.geopjr.Tuba" "$pkgdir/usr/bin/tuba"
}
