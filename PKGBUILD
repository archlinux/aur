# Maintainer: Trizen
# Removes limitation introduced in: https://gitlab.gnome.org/GNOME/vte/-/commit/caf8a6a7a17a3f70fa5fc611c71ffb27a5cfee75

pkgname=vte3-selectall
pkgver=0.72.1
pkgrel=1
pkgdesc="Virtual Terminal Emulator widget (plus select-all patch)"
url="https://wiki.gnome.org/Apps/Terminal/VTE"
arch=(x86_64)
license=(LGPL)
depends=(gtk3 pcre2 gnutls fribidi systemd  vte-common)
makedepends=(gobject-introspection vala git gtk-doc gperf meson gi-docgen)
source=("git+https://gitlab.gnome.org/GNOME/vte.git#tag=$pkgver"
  select-all.diff)
b2sums=('SKIP'
        '2024149d7f5b33d18aaba2f1984dfef7f42497a0917fecf0dfde4673246ad8fd8cfe3b1798a6cc9a3843dc5157157b02b7616350c62e9105c5485a9af68f1d14')

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
