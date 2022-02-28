# Maintainer: Shengyu Zhang <la@archlinuxcn.org>

pkgname=vte4-git
pkgver=0.61.90+r273+gf4b915ae
pkgrel=1
pkgdesc="Virtual Terminal Emulator widget"
url="https://wiki.gnome.org/Apps/Terminal/VTE"
arch=(x86_64)
license=(LGPL)
depends=(gtk3 pcre2 gnutls fribidi systemd vte-common)
makedepends=(gobject-introspection vala git gtk-doc gperf meson)
source=("git+https://gitlab.gnome.org/GNOME/vte.git")
sha256sums=('SKIP')
provides+=(libvte-2.91.so)

pkgver() {
  cd vte
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd vte
}

build() {
  arch-meson vte build \
    -D b_lto=false \
    -D docs=true \
    -D gtk3=false \
    -D gtk4=true
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"

  # Conflict with vte-common
  rm -rf "$pkgdir"/etc/profile.d
  rm -rf "$pkgdir"/usr/lib/{systemd,vte-urlencode-cwd}

  # Conflict with vte3
  rm -rf "$pkgdir/usr/share/locale/"
}

# vim:set sw=2 et:
