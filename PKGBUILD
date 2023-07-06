# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Alexander Fehr <pizzapunk gmail com>

_pkgname=tracker
pkgbase=tracker-git
pkgname=(
  tracker-git
  tracker-docs-git
)
pkgver=3.6.alpha+r8+gcd7814bb9
pkgrel=1
pkgdesc="Desktop-neutral user information store, search tool and indexer"
url="https://wiki.gnome.org/Projects/Tracker"
arch=(x86_64)
license=(GPL)
depends=(
  glib2
  icu
  json-glib
  libsoup3
  libstemmer
  libxml2
  sqlite
)
makedepends=(
  asciidoc
  bash-completion
  dbus
  gi-docgen
  git
  gobject-introspection
  libsoup
  meson
  python-dbus
  python-gobject
  python-tappy
  systemd
  vala
)
provides=('tracker3' 'libtracker-sparql-3.0.so')
conflicts=('tracker3')
source=(
  "git+https://gitlab.gnome.org/GNOME/tracker.git"
  "git+https://gitlab.gnome.org/GNOME/gvdb.git"
)
b2sums=('SKIP'
        'SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $_pkgname

  git submodule init
  git submodule set-url subprojects/gvdb "$srcdir/gvdb"
  git -c protocol.file.allow=always submodule update
}

build() {
  local meson_options=(
    -D tests_tap_protocol=true
  )

  arch-meson $_pkgname build "${meson_options[@]}"
  meson compile -C build
}

check() {
  dbus-run-session meson test -C build --print-errorlogs -t 3
}

package_tracker-git() {
  optdepends=('libsoup: Alternative remoting backend')
  provides=(libtracker-sparql-3.0.so)

  meson install -C build --destdir "$pkgdir"

  mkdir -p docs/usr/share
  mv {"$pkgdir",docs}/usr/share/doc
}

package_tracker-docs-git() {
  pkgdesc+=" (documentation)"
  depends=()
  mv docs/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
