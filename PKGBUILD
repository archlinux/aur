# Maintainer: XOX (milklikecomputer) <0c2c5a81-0f19-4c94-bf0b-a693e3ced027[at]slmails[dot]me>

# modified from [valent-git](https://aur.archlinux.org/packages/valent-git)
pkgname=valent
pkgver=1.0.0.alpha.46
pkgrel=1
pkgdesc="A file sharing software, slogan 'Connect, control and sync devices'"
arch=('aarch64' 'x86_64')
url='https://valent.andyholmes.ca'
license=('GPL-3.0-or-later')
depends=(
  'evolution-data-server'
  'gcc-libs'
  'gdk-pixbuf2'
  'gnutls'
  'gstreamer'
  'json-glib'
  'libadwaita'
  'libpeas-2'
  'libpipewire'
  'libportal-gtk4'
  'libpulse'
  'libportal'
)
makedepends=(
#  'gi-docgen'  ## -Ddocumentation=true
  'glib2-devel'
  'gobject-introspection'
  'meson'
  'vala'
  'cmake'
)
checkdepends=(
  'appstream'
#  'walbottle'  ## -Dtests=true (for JSON tests)
)
optdepends=(
  'dconf'
  'glib2'
  'graphene'
  'gtk4'
  'hicolor-icon-theme'
  'pango'
  'tinysparql'
)
provides=("${pkgname}" 'libvalent-1.so=1.0.0')
conflicts=("${pkgname}")
source=(
        "https://github.com/andyholmes/valent/releases/download/v$pkgver/valent-$pkgver.tar.xz"
        '1-solving-dependency-problem.patch'
)
sha256sums=(
            'c7d822230b5559762c90e046226ef3329f144c6885005473f72cd1a81146166e'
            '5f1671609c01b3c4181fd28362c97b030fba94096c8a60cf3f4e30e4e014dc0d'
)

# fix require "libportal<= 0.7.1" problem
prepare() {
  patch -p0 < 1-solving-dependency-problem.patch
}

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
