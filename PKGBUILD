# Maintainer: nightuser <nightuser.android@gmail.com>

pkgname=glib2-static
pkgver=2.64.0
pkgrel=3
pkgdesc="Low level core library: Static library"
url="https://wiki.gnome.org/Projects/GLib"
license=(LGPL2.1)
arch=(x86_64)
depends=()
makedepends=(gettext zlib libffi shared-mime-info python libelf git util-linux meson dbus)
checkdepends=(desktop-file-utils)
options=('!docs' '!libtool' '!emptydirs' '!strip' 'staticlibs')
source=("http://ftp.gnome.org/pub/gnome/sources/glib/${pkgver%.*}/glib-$pkgver.tar.xz"
        'disable_mem_overflow_warnings.patch'
        '0001-tests-Move-memory_monitor_tests-under-installed_test.patch')
sha256sums=('e5e514e47d169cdb4111c3ea4af0300e1b1a5f428a474d2d7ddadf38dd061280'
            'e2342457c9b59406e8aee14af0e2d267a43c62c12ba851d452d2916cbb94cdf6'
            '3f7f20c817ef970f9d1bc6606023eca44df5c31dd2334847bc8df2dbcf8e0e43')

prepare() {
  cd "glib-$pkgver"

  patch -Np1 -i "$srcdir/disable_mem_overflow_warnings.patch"

  patch -Np1 -i "$srcdir/0001-tests-Move-memory_monitor_tests-under-installed_test.patch"
}

build() {
  CFLAGS+=' -Wno-unused-result'
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
  LC_ALL=C meson test -C _build --no-suite flaky --timeout-multiplier 2 --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C _build

  # Only install static library
  rm -rf "$pkgdir"/usr/{bin,include,share,lib/glib-2.0,lib/pkgconfig}
}
