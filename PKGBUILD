# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=workbench
pkgver=49.0
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
  04fd3c6dad645b6668e600541482300a0c9efaeffd948cc3ab580282a3dddd4aaa110b25e879caa987febf2aeb5ff9dcd53895ce6321f6cdad871409f73a00dd
  SKIP
  SKIP
  SKIP
  42096b884c16998f3f3908ac459c7cec87f8f0fa1249621a80742eb21e80cdf67f842826f756455b3f9a8a35ddbba1b87e0743e10ffbb10b4ca2917d219ca9aa
  82d1bc9f78177af90ab88f3b3a99e634d822c08bd322a93363ac97fad248046fe0f42946773aace6854315cc762e39571e73b71b2bf7b5fc2b5861b9c6af50df
  e78d3a961c8ca7d050bff284c69dffeec99df335ed7b5967a551dc9be3fcb0655f8351600cc5dfd7ac199d24bd8f6cb37a52d4e39ff2c6c15832271842164fcd
  caf748805312f1684295a7b5d4e5569a05daea6a5018b51f825c382bdf09ddae41b6e4e1324559bca01d2ed71c01c0c9070ad49fc4f5d9ab6cd407bc038d7c40
  7b5add3787140cb9c462da3fcd7b0a78548119c1c41c314a1f0bc8aaa7511df3da01f2dc325e0223217d9f1184db2f380ad0ff021c57de7cb62045901b0f009a
  5860d14ae40b742ab2b57912950353fd8c025c16466b743dd97ae4224b242585192fa7b9d12619ddcaf37a1f24b330c64555243bf745fb93982ad7bcc7fc6116
  2102e7e73c40d47087a12a6ace0c3abc46d6c184ab967d46ba61c2b7041c16662a88c11b2d8c02297ff197051f22f79626bed7ca22a8e4713fddab9870aaef7a
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
