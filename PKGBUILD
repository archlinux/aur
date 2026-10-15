# Maintainer: Yangtse Su <yangtsesu at gmail dot com>

pkgname=papers-ofd
pkgver=51.1.1
pkgrel=1
pkgdesc='OFD (GB/T 33190-2016) document backend for GNOME Papers, on the rofd-ffi C ABI'
arch=('x86_64' 'aarch64')
url='https://github.com/YangtseSu/papers-ofd'
license=('GPL-2.0-or-later')
depends=(
  'cairo'
  'gcc-libs'
  'glib2'
  'glibc'
  'librofd-ffi>=0.4.3'
  'papers>=51'
  'papers<52'
)
# shared-mime-info and desktop-file-utils are not listed: their pacman hooks index
# our MIME xml and desktop file, and both arrive through `papers` (whose own
# desktop/thumbnailer entries rely on the same hooks); namcap agrees they are
# unneeded here.
makedepends=(
  'gtk4'
  'librofd-ffi>=0.4.3-6'  # check(): ofd-text compares the selection region with the ink rofd renders and requires the metrics band
  'meson'
  'poppler-glib'
)
# The space-bar preview in GNOME Files is Sushi's; our plugin only takes effect
# where Sushi is installed (and gjs + Sushi make tests/test-sushi-plugin.js run).
optdepends=('sushi: space-bar previews in GNOME Files')
# The source is the release tag. Upstream versions the module by the Papers line
# rather than by its own feature count (papers-ofd plan D13): 51.1.1 is the
# Papers 51 line, verified against Papers 51.1, its first release for that
# baseline. A release means a new tag plus a pkgver and checksum update here, and
# a published tag is never moved because this URL and its checksum pin it. This
# file is the canonical recipe — the upstream project repository carries no
# PKGBUILD copy.
source=("$pkgname-$pkgver.tar.gz::https://github.com/YangtseSu/papers-ofd/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d9c94f4e3804210bce1ec2cb2acfaa0774e9a8b18e71f59ee438314c29618d08')
_dirname="papers-ofd-$pkgver"

build() {
  cd "$_dirname"
  # The rofd ABI header and its rofd-ffi.pc come from the librofd-ffi package, so
  # no rofd checkout is involved. Plain build type: the module is built with the
  # makepkg CFLAGS/LDFLAGS (meson.build defaults to release for hand builds).
  meson setup build --prefix=/usr --buildtype=plain
  meson compile -C build
}

check() {
  cd "$_dirname"
  # The tests stage their own backend directory and MIME database; ofd-print-file
  # skips itself when GTK cannot open a display.
  meson test -C build --print-errorlogs
}

package() {
  cd "$_dirname"
  # Installs the module and its descriptor into the Papers backend directory and
  # the MIME xml, thumbnailer entry and association desktop file into /usr/share.
  meson install -C build --destdir "$pkgdir"
  # No .install script: update-mime-database and update-desktop-database run from
  # the pacman hooks of shared-mime-info and desktop-file-utils (depends above).
}
