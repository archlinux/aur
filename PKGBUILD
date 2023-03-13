# Maintainer: Felipe Contreras <felipe.contreras@gmail.com>

# shellcheck disable=SC2034,SC2115

pkgname=vte3-nohang
pkgver=0.70.3
pkgrel=2
pkgdesc='Virtual Terminal Emulator widget (GTK3) (plus no-hang patch)'
url='https://wiki.gnome.org/Apps/Terminal/VTE'
arch=(x86_64)
license=(LGPL)
depends=(fribidi gnutls gtk3 pcre2 systemd-libs vte-common)
makedepends=(gobject-introspection gperf meson vala)
options=(!lto)
source=("https://gitlab.gnome.org/GNOME/vte/-/archive/$pkgver/vte-$pkgver.tar.bz2"
  fix-exit-regression.patch
  desktop-notification.patch)
sha256sums=('94d0b6776d55252bc1f15995c1ade7eb44b4a2c99531487eba9b8bded1a0fe2f'
  '5236764e262d92c78d8af99c2114e8dcf625d61f76c49acca061756785f525d4'
  '905672bd0e2b5685aeddd035e502a7062c4ada16f8a8eae9813cca1974ea0f77')

provides=("vte3=$pkgver" "vte3-notification=$pkgver" libvte-2.91.so)
conflicts=(vte3)

prepare() {
  cd "vte-$pkgver" || exit 1
  patch -p1 -i "$srcdir/fix-exit-regression.patch"
  patch -p1 -i "$srcdir/desktop-notification.patch"
}

build() {
  arch-meson "vte-$pkgver" build -D docs=false -D b_lto=false
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
