# Maintainer: Felipe Contreras <felipe.contreras@gmail.com>

# shellcheck disable=SC2034,SC2115

pkgname=vte3-nohang
pkgver=0.70.1
pkgrel=1
pkgdesc="Virtual Terminal Emulator widget (GTK3) (plus no-hang patch)"
url="https://wiki.gnome.org/Apps/Terminal/VTE"
arch=(x86_64)
license=(LGPL)
depends=(fribidi gnutls gtk3 pcre2 systemd vte-common)
makedepends=(gobject-introspection gperf meson vala)
options=(!lto)
source=("https://gitlab.gnome.org/GNOME/vte/-/archive/$pkgver/vte-$pkgver.tar.bz2"
  fix-exit-regression.patch)
sha256sums=('04caaa84a9f2741d81623fd77a544dc53ccc67940cd47a9b41520e18355c7b01'
  'b7175b365c87b4014725a690448db716e22c27636fc03c08c5a4bc516798871e')

provides=("vte3=$pkgver" libvte-2.91.so)
conflicts=(vte3)

prepare() {
  cd "vte-$pkgver" || exit 1
  patch -p1 -i "$srcdir/fix-exit-regression.patch"
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
