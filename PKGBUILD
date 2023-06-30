# Maintainer: Felipe Contreras <felipe.contreras@gmail.com>

# shellcheck disable=SC2034,SC2154,SC2115

pkgname=vte3-nohang
pkgver=0.72.2
pkgrel=1
pkgdesc='Virtual Terminal Emulator widget (GTK3) (plus no-hang patch)'
url='https://wiki.gnome.org/Apps/Terminal/VTE'
arch=(x86_64)
license=(LGPL)
depends=(fribidi gnutls gtk3 pcre2 systemd-libs vte-common)
makedepends=(gobject-introspection gperf meson vala)
options=('!lto')
source=("https://gitlab.gnome.org/GNOME/vte/-/archive/$pkgver/vte-$pkgver.tar.bz2"
  fix-exit-regression.patch
  desktop-notification.patch)
sha256sums=('5c8f789aaf76154de9d58205fda3b90790092d93791a5229c8b67c50d3f01068'
  'f43611e7f8ffdc5f1fe52a6e1fe274cc0b2d421d88abb7c2b0d073cfea61f6eb'
  '905672bd0e2b5685aeddd035e502a7062c4ada16f8a8eae9813cca1974ea0f77')

provides=("vte3=$pkgver" "vte3-notification=$pkgver" 'libvte-2.91.so')
conflicts=('vte3')

prepare() {
  cd "vte-$pkgver" || exit 1
  patch -p1 -i "$srcdir/fix-exit-regression.patch"
  patch -p1 -i "$srcdir/desktop-notification.patch"
}

build() {
  arch-meson "vte-$pkgver" build -D docs=false -D b_lto=false -D gtk4=false
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"

  # remove vte-common
  rm -r "$pkgdir"/etc
  rm -r "$pkgdir"/usr/lib/{systemd,vte-urlencode-cwd}
  rm -r "$pkgdir"/usr/share/locale/
}

# vim: ts=2 et
