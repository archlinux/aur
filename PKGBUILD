# Maintainer: nightuser <nightuser.android at gmail dot com>

pkgname=glib2-static
pkgver=2.62.2
pkgrel=2
pkgdesc="Low level core library: Static library"
url="https://wiki.gnome.org/Projects/GLib"
license=(LGPL2.1)
arch=(x86_64)
depends=(pcre libffi)
makedepends=(zlib libffi shared-mime-info python libelf git util-linux meson dbus)
checkdepends=(desktop-file-utils dbus)
options=('!docs' '!libtool' '!emptydirs' '!strip' 'staticlibs')
_commit=ca9f51b82f57e05f6b3c82b98c235623afa47573  # tags/2.62.2^0
source=("git+https://gitlab.gnome.org/GNOME/glib.git#commit=$_commit"
        utf8-pointer-test-disable-optimisations.patch)
sha256sums=(SKIP
            1accbea014625913f8727139f6072d3be615af19d77953b250a56d97238ecdf6)

pkgver() {
  cd glib
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd glib
  patch -Np1 -i "$srcdir"/utf8-pointer-test-disable-optimisations.patch
}

build() {
  arch-meson glib _build \
    --default-library static \
    --buildtype release \
    -Dselinux=disabled \
    -Dman=false \
    -Dgtk_doc=false \
    -Dinternal_pcre=false
  ninja -C _build
}

check() {
  # meson test -C build
  meson test -C _build --no-suite flaky --timeout-multiplier 2 --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C _build

  # Only install static library
  rm -rf "$pkgdir"/usr/{bin,include,share,lib/glib-2.0,lib/pkgconfig}
}
