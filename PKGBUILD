# Maintainer: Vicente G. Serrano <vstyler96 at gmail dot com>

pkgname=qthash-git
_pkgname=qthash
pkgver=1.0.0.r0.3f82beb
pkgrel=1
pkgdesc="A Qt6 utility for computing message digests or checksums (fork of GtkHash)"
arch=('x86_64')
url="https://github.com/vstyler96/qthash"
license=('GPL-2.0-or-later')
depends=(
    'glib2'
    'hicolor-icon-theme'
    'libb2'
    'libblake3'
    'libgcrypt'
    'qt6-base'
    'xxhash'
    'zlib'
)
makedepends=(
    'git'
    'meson'
)
checkdepends=('desktop-file-utils')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

_make() {
  # Same flags arch-meson would pass, fed through the project Makefile.
  make -C "$_pkgname" BUILDDIR="$srcdir/build" PREFIX=/usr \
    MESON_ARGS="--libexecdir=lib --sbindir=bin --buildtype=plain --auto-features=enabled --wrap-mode=nodownload -Db_pie=true" \
    "$@"
}

build() {
  _make build
}

check() {
  _make test
}

package() {
  DESTDIR="$pkgdir" _make install
}
