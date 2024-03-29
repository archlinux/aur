# Maintainer: Angelo Verlain SHEMA (https://vixalien.com)

pkgname=decibels
pkgver=46.0
pkgrel=1
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
source=("git+https://gitlab.gnome.org/GNOME/Incubator/decibels#tag=$pkgver"
        'git+https://gitlab.gnome.org/BrainBlasted/gi-typescript-definitions.git')
sha256sums=('SKIP'
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

  # Fix build:
  sed -i "s/tsc, '--outDir'/tsc, '--project', files('..\/tsconfig.json'), '--outDir'/g" src/meson.build

  # Replace service exec with `decibels`
  sed -i "s/Exec=@application_id@/Exec=$pkgname/g" data/org.gnome.Decibels.service.in
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

  install -Dm644 LICENCE -t "$pkgdir/usr/share/licenses/$pkgname/"

  ln -s "/usr/bin/org.gnome.Decibels" "$pkgdir/usr/bin/$pkgname"
}
