# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
pkgname=valent-git
pkgver=1.0.0.alpha.47.r0.g84a75b4
pkgrel=1
pkgdesc="Connect, control and sync devices"
arch=('x86_64')
url="https://valent.andyholmes.ca"
license=('CC0-1.0 AND CC-BY-SA-3.0 AND GPL-2.0-or-later AND GPL-3.0-or-later AND LGPL-2.1-or-later')
depends=(
  'evolution-data-server'
  'gnutls'
  'gstreamer'
  'json-glib'
  'libadwaita'
  'libpeas-2'
  'libpipewire'
  'libportal-gtk4'
  'libpulse'
)
makedepends=(
#  'gi-docgen'  ## -Ddocumentation=true
  'git'
  'glib2-devel'
  'gobject-introspection'
  'meson'
  'vala'
)
checkdepends=(
#  'walbottle'  ## -Dtests=true (for JSON tests)
)
provides=("${pkgname%-git}" 'libvalent-1.so=0')
conflicts=("${pkgname%-git}")
source=('git+https://github.com/andyholmes/valent.git'
        'git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  git submodule init
  git config submodule.subprojects/gvc.url "$srcdir/libgnome-volume-control"
  git -c protocol.file.allow=always submodule update
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
