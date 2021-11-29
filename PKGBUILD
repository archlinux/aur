# Maintainer: nightuser <nightuser.android@gmail.com>

pkgname=glib2-static
pkgver=2.70.1
pkgrel=1
pkgdesc="Low level core library: Static library"
url="https://wiki.gnome.org/Projects/GLib"
license=(LGPL2.1)
arch=(x86_64 aarch64)
depends=()
makedepends=(gettext zlib libffi shared-mime-info python libelf git util-linux meson dbus)
checkdepends=(desktop-file-utils)
options=('!docs' '!libtool' '!emptydirs' '!strip' 'staticlibs')
source=("https://download.gnome.org/sources/glib/${pkgver%.*}/glib-$pkgver.tar.xz")
sha256sums=('f9b7bce7f51753a1f43853bbcaca8bf09e15e994268e29cfd7a76f65636263c0')

#prepare() {
#  cd "glib-$pkgver"
#}

build() {
  LTO=""
  if check_option "lto" "n"; then
    LTO="-Db_lto=false"
  fi

  CFLAGS+=' -Wno-unused-result -Wno-stringop-overflow'
  arch-meson "glib-$pkgver" _build \
    --default-library static \
    --buildtype release \
    -Dselinux=disabled \
    -Dman=false \
    -Dgtk_doc=false \
    $LTO
  ninja -C _build
}

check() {
  meson test -C _build --no-suite flaky --timeout-multiplier 2 --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C _build

  # Only install static library
  rm -rf "$pkgdir"/usr/{bin,include,share,lib/glib-2.0,lib/pkgconfig}
}

# vim: et:sw=2:ts=8
