# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Angelo Verlain SHEMA (https://vixalien.com)
pkgname=decibels
pkgver=46.0
pkgrel=2
pkgdesc="Play audio files"
arch=('any')
url="https://gitlab.gnome.org/GNOME/Incubator/decibels"
license=(GPL-3.0)
depends=(
  gjs
  gst-plugins-bad-libs
  gst-plugins-base
  gst-plugins-good
  gtk4
  libadwaita
)
makedepends=(
  git
  gobject-introspection
  blueprint-compiler
  meson
  typescript
)
checkdepends=(
  appstream-glib
)
_commit=d3d85a7d6fac2af348789a05ece4ddea5e828150  # tags/46.0^0
source=("git+https://gitlab.gnome.org/GNOME/Incubator/decibels#commit=${_commit}"
        'git+https://gitlab.gnome.org/BrainBlasted/gi-typescript-definitions.git')
sha256sums=('136e9e604f4c2c8438cc4c9a0ae2a40c9986c772b7c9f2e908de2082f2b5e87e'
            'SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $pkgname
  git submodule init
  git config submodule.gi-types.url "$srcdir/gi-typescript-definitions"
  git -c protocol.file.allow=always submodule update
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"

  cd $pkgname
  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  ln -s /usr/bin/org.gnome.Decibels "$pkgdir/usr/bin/$pkgname"
}
