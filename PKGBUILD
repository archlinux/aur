# Maintainer: Felipe Contreras <felipe.contreras@gmail.com>

# shellcheck disable=SC2034,SC2115

pkgname=vte3-nohang
pkgver=0.66.2
pkgrel=2
pkgdesc="Virtual Terminal Emulator widget (plus no-hang patch)"
url="https://wiki.gnome.org/Apps/Terminal/VTE"
arch=(x86_64)
license=(LGPL)
depends=(gtk3 pcre2 gnutls fribidi systemd)
makedepends=(gobject-introspection vala git gtk-doc gperf meson)
source=("git+https://gitlab.gnome.org/GNOME/vte.git#tag=$pkgver"
  fix-exit-regression.patch)
sha256sums=('SKIP'
  '269072f4f65f42ac0338039c69bd03cb767fc08f837a78d12c11c9487397a195')

depends+=(vte-common)
provides=("vte3=$pkgver" libvte-2.91.so)
conflicts=(vte3)

prepare() {
  cd vte || exit 1
  patch -p1 -i "$srcdir/fix-exit-regression.patch"
}

build() {
  arch-meson vte build -D docs=true -D b_lto=false
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
}

# vim: ts=2 et
