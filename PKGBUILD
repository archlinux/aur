# Maintainer: Yangtse Su <yangtsesu at gmail dot com>

pkgname=papers-ofd
pkgver=0.1.0
pkgrel=6
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
# 0.1.0 is not tagged yet, so the package pins a commit. The phase-3 work plus the
# highlight-geometry tests compare the selection region with the ink rofd renders and
# require the font-metric band and its eighth-height margin, so `check()` needs
# librofd-ffi >= 0.4.3-6 (see makedepends); a builder with the older 0.4.3-5 library
# sees a failed test with an install hint. The module binary is unchanged from the
# phase-3 tree: the pins differ only in the tracked documentation. Bump _commit with
# pkgver when a release tag exists. This file is the canonical recipe — the upstream
# project repository carries no PKGBUILD copy.
_commit=7becd282db17859d73984754b195a625a03b6218
source=("$pkgname-$pkgver.tar.gz::https://github.com/YangtseSu/papers-ofd/archive/$_commit.tar.gz")
sha256sums=('9f492120e70c910c1ae0318ec153fdd4ffc0068d62e3f9af3da025b804227419')
_dirname="papers-ofd-$_commit"

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
