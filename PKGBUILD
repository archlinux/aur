# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=workbench
pkgver=47.0
pkgrel=1
pkgdesc='Tool for learning and prototyping with GNOME technologies'
arch=(x86_64)
url='https://apps.gnome.org/Workbench/'
license=(GPL-3.0-only)
depends=(
  biome
  blueprint-compiler
  dconf
  gcc-libs
  gjs
  glib2
  glibc
  gom
  graphene
  gst-plugin-gtk4
  gst-plugin-pipewire
  gst-plugins-base
  gstreamer
  gtk4
  gtkcsslanguageserver
  gtksourceview5
  hicolor-icon-theme
  libadwaita
  libgirepository
  libmanette
  libportal
  libportal-gtk4
  librsvg
  libshumate
  libsoup3
  libspelling
  pango
  python
  python-gobject
  python-lsp-server
  ruff
  rust
  rust-analyzer
  typescript
  typescript-language-server
  uncrustify
  vala
  vala-language-server
  vte4
  webkitgtk-6.0
)
makedepends=(
  appstream
  git
  glib2-devel
  gobject-introspection
  meson
)
source=(
  git+https://github.com/workbenchdev/Workbench.git
  git+https://github.com/sonnyp/troll.git
  workbench-demos::git+https://github.com/workbenchdev/demos.git
  git+https://gitlab.gnome.org/BrainBlasted/gi-typescript-definitions.git
  workbench-no-flatpak.patch
  workbench-demo-compatibility.patch
  workbench-flatpak-permissions.patch
  workbench-extensions-check.patch
  workbench-vapi-parameter.patch
  workbench-about-dialog.patch
  workbench-flatpak-id.patch
)
b2sums=(
  SKIP
  SKIP
  SKIP
  SKIP
  42096b884c16998f3f3908ac459c7cec87f8f0fa1249621a80742eb21e80cdf67f842826f756455b3f9a8a35ddbba1b87e0743e10ffbb10b4ca2917d219ca9aa
  82d1bc9f78177af90ab88f3b3a99e634d822c08bd322a93363ac97fad248046fe0f42946773aace6854315cc762e39571e73b71b2bf7b5fc2b5861b9c6af50df
  8758ae74ded3650000202f16a145a0555a8a9b10ccf78bd61004d361ae8e6892b26730c8a5c9d2dfc53c9bbd863d26c24ecbd734c625ec519dac218fdb278daf
  972b72e243cf072dc3448e7dace422d24d6b1746af892b85583685bf785d441b0f8acca948fd1d833227fc6dd74db79d94ee167ebb4d2ba3c2189ee5eac0405f
  7b5add3787140cb9c462da3fcd7b0a78548119c1c41c314a1f0bc8aaa7511df3da01f2dc325e0223217d9f1184db2f380ad0ff021c57de7cb62045901b0f009a
  5860d14ae40b742ab2b57912950353fd8c025c16466b743dd97ae4224b242585192fa7b9d12619ddcaf37a1f24b330c64555243bf745fb93982ad7bcc7fc6116
  403ec9b7c237fa2fb793422824171dfa86ac93dffb5dab8f0fd8e4adbb9c3a352fda29a90120973cd9bb6a90a7b6e55b511f8a58d29341d4e9099318b1a73c18
)

prepare() {
  cd Workbench

  git submodule init
  git submodule set-url troll "$srcdir/troll"
  git submodule set-url demos "$srcdir/workbench-demos"
  git submodule set-url gi-types "$srcdir/gi-typescript-definitions"
  git -c protocol.file.allow=always submodule update

  # Release 47
  git cherry-pick -n 0109ae8bed18f74b952440972fd6b5542767d7f7

  # Don't check if running under Flatpak
  git apply -3 ../workbench-no-flatpak.patch

  # Don't check demo compatibility with Flatpak runtime
  git apply -3 ../workbench-demo-compatibility.patch

  # Don't check for missing Flatpak permissions
  git apply -3 ../workbench-flatpak-permissions.patch

  # Fix detection of compilers
  git apply -3 ../workbench-extensions-check.patch

  # Don't set vapi parameter to /dev/null
  git apply -3 ../workbench-vapi-parameter.patch

  # Don't check Flatpak version
  git apply -3 ../workbench-about-dialog.patch

  # Set FLATPAK_ID
  git apply -3 ../workbench-flatpak-id.patch

  # Fix paths
  sed -i 's|/app/share/|/usr/share/|' src/Previewer/previewer.vala src/cli/{bin,main}.js src/langs/python/python-previewer.py
  sed -i -e 's|/app/bin/||' -e '/library.js/d' src/meson.build
}

build() {
  arch-meson Workbench build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  MESON_SOURCE_ROOT="$srcdir/Workbench" Workbench/build-aux/library.js "$pkgdir/usr/share/re.sonny.Workbench"
}
