# Maintainer: Yangtse Su <yangtsesu at gmail dot com>

pkgname=papers-ofd
pkgver=0.1.0
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
  'meson'
  'poppler-glib'
)
# 0.1.0 is not tagged yet, so the package pins the commit that finished plan §5
# phase 3 (fd loading, i.e. the previewer path). Bump _commit with pkgver when a
# release tag exists; keep it identical to the AUR copy in the AUR repository.
_commit=6936c96a22571a999aa5a9d725609584a11df8e3
source=("$pkgname-$pkgver.tar.gz::https://github.com/YangtseSu/papers-ofd/archive/$_commit.tar.gz")
sha256sums=('64c1797d6bcc5fb4baa66400f8e2f3cd0d6de6ab22ef8a595fbaac259b28853b')
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
