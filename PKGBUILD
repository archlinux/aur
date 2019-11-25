# Maintainer: nightuser <nightuser.android at gmail dot com>

pkgname=glib2-static
pkgver=2.62.3
pkgrel=1
pkgdesc="Low level core library: Static library"
url="https://wiki.gnome.org/Projects/GLib"
license=(LGPL2.1)
arch=(x86_64)
depends=(pcre libffi)
makedepends=(zlib libffi shared-mime-info python libelf git util-linux meson dbus)
checkdepends=(desktop-file-utils dbus)
options=('!docs' '!libtool' '!emptydirs' '!strip' 'staticlibs')
source=(https://gitlab.gnome.org/GNOME/glib/-/archive/$pkgver/glib-$pkgver.tar.gz)
sha256sums=(4cdd62797dcf112a6be53fe88a8343994691c37e7b65f1ec5b1a02b65ed3adc6)

build() {
  arch-meson "glib-$pkgver" _build \
    --default-library static \
    --buildtype release \
    -Dselinux=disabled \
    -Dman=false \
    -Dgtk_doc=false \
    -Dinternal_pcre=false
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
