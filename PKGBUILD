# Maintainer: nightuser <nightuser.android@gmail.com>

pkgname=glib2-static
pkgver=2.62.5
pkgrel=1
pkgdesc="Low level core library: Static library"
url="https://wiki.gnome.org/Projects/GLib"
license=(LGPL2.1)
arch=(x86_64)
depends=()
makedepends=(gettext zlib libffi shared-mime-info python libelf git util-linux meson dbus)
checkdepends=(desktop-file-utils)
options=('!docs' '!libtool' '!emptydirs' '!strip' 'staticlibs')
source=(https://gitlab.gnome.org/GNOME/glib/-/archive/$pkgver/glib-$pkgver.tar.gz)
sha256sums=('8f877a0455e5446cdf2453c107c398583193a5a3f2132b9aa26279f5a0549797')

#prepare() {
#  cd "glib-$pkgver"
#}

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
