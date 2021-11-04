# Maintainer: Trizen
# Removes limitation introduced in: https://gitlab.gnome.org/GNOME/vte/-/commit/caf8a6a7a17a3f70fa5fc611c71ffb27a5cfee75

pkgname=vte3-selectall
pkgver=0.66.0
pkgrel=1
pkgdesc="Virtual Terminal Emulator widget (plus select-all patch)"
url="https://wiki.gnome.org/Apps/Terminal/VTE"
arch=(x86_64)
license=(LGPL)
depends=(gtk3 pcre2 gnutls fribidi systemd-libs)
makedepends=(gobject-introspection vala git gtk-doc gperf meson)
source=("git+https://gitlab.gnome.org/GNOME/vte.git#tag=$pkgver"
  select-all.diff)
sha512sums=('SKIP'
            'f0d0581802a49e635e23778d2d4a6b154c2ff0fa15188260218783d09b556520b08c46d1912003b0a73429fde5eb10089db28292751d67f7f6dc0b7c688db4f1')

depends+=(vte-common)
provides=("vte3=$pkgver" libvte-2.91.so)
conflicts=(vte3)

prepare() {
  cd vte
  patch -p1 -i "$srcdir/select-all.diff"
}

build() {
  arch-meson vte build -D docs=true -D b_lto=false
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build

  # remove vte-common
  rm -r "$pkgdir"/etc
  rm -r "$pkgdir"/usr/lib/{systemd,vte-urlencode-cwd}
}

# vim: ts=2 et
