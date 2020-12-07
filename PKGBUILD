# Maintainer: Felipe Contreras <felipe.contreras@gmail.com>

pkgname=vte3-nohang
pkgver=0.62.1
pkgrel=1
pkgdesc="Virtual Terminal Emulator widget (plus no-hang patch)"
url="https://wiki.gnome.org/Apps/Terminal/VTE"
arch=(x86_64)
license=(LGPL)
depends=(gtk3 pcre2 gnutls fribidi systemd-libs)
makedepends=(gobject-introspection vala git gtk-doc gperf meson)
_commit=62c4908953e3fea8e0771fa82212462157d46d4f # tags/0.62.1^0
source=("git+https://gitlab.gnome.org/GNOME/vte.git#commit=$_commit")
sha256sums=('SKIP')

depends+=(vte-common)
provides=("vte3=$pkgver" libvte-2.91.so)
conflicts=(vte3)

pkgver() {
  git -C vte describe --tags | sed 's/-/+/g'
}

prepare() {
  cd vte
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
