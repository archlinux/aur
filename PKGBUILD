# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=workbench
pkgver=50.0
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
  "git+https://github.com/workbenchdev/Workbench.git#tag=v$pkgver"
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
  workbench-no-flatpak-info.patch
)
b2sums=(
  41aae1cbe3e822f92de3a6fcb412a864a7695190809760b01a467989821e0335f6df188beb6b92d209310d08c54d0c353aee09a5d5d0e5633453ccece4b9f761
  SKIP
  SKIP
  SKIP
  42096b884c16998f3f3908ac459c7cec87f8f0fa1249621a80742eb21e80cdf67f842826f756455b3f9a8a35ddbba1b87e0743e10ffbb10b4ca2917d219ca9aa
  82d1bc9f78177af90ab88f3b3a99e634d822c08bd322a93363ac97fad248046fe0f42946773aace6854315cc762e39571e73b71b2bf7b5fc2b5861b9c6af50df
  18c641662cbf47a66ee1a148378d87e8efde3d7241985a29e62ebf5e14fe1f60ef9797212d1c93688b68bac4639fb3e9ee777fab4321fadd4bd9701bebdc55d8
  caf748805312f1684295a7b5d4e5569a05daea6a5018b51f825c382bdf09ddae41b6e4e1324559bca01d2ed71c01c0c9070ad49fc4f5d9ab6cd407bc038d7c40
  7b5add3787140cb9c462da3fcd7b0a78548119c1c41c314a1f0bc8aaa7511df3da01f2dc325e0223217d9f1184db2f380ad0ff021c57de7cb62045901b0f009a
  5860d14ae40b742ab2b57912950353fd8c025c16466b743dd97ae4224b242585192fa7b9d12619ddcaf37a1f24b330c64555243bf745fb93982ad7bcc7fc6116
  513989ad0dc7d161ab4af8896dd628b9f57d4297f14b72112e3155e161b2dcab2d0cdce9fbb98c6a057295850b73425a402004a1cb89d85fa4be0c45e157bfa6
  172ff6fc054990c96e34c3d61e0c4ca01722e2263d306e63fb0d8270c8bf5f3dfd2ae9b193965f9f5eb00f25d121b58052f3845e36192bcb914045df928a976d
)

prepare() {
  cd Workbench

  git submodule init
  git submodule set-url troll "$srcdir/troll"
  git submodule set-url demos "$srcdir/workbench-demos"
  git submodule set-url gi-types "$srcdir/gi-typescript-definitions"
  git -c protocol.file.allow=always submodule update

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

  # Don't try to read from flatpak-info
  git apply -3 ../workbench-no-flatpak-info.patch

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
