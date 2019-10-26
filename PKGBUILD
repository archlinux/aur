# Maintainer: nightuser <nightuser.android at gmail dot com>

pkgname=glib2-static
pkgver=2.62.2
pkgrel=1
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
        disable_utf8-pointer_test.patch)
sha256sums=(SKIP
            3142dc433504e0a7c6801c36bb2fd3e61bd294173bbfc401d2e88a47752fc30e)

pkgver() {
  cd glib
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd glib
  patch -Np1 -i "$srcdir"/disable_utf8-pointer_test.patch
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
