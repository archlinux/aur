# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Shengyu Zhang <la@archlinuxcn.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=vte4-git
pkgver=0.69.90+r35+g8ef3f6b2
pkgrel=1
pkgdesc="Virtual Terminal Emulator widget"
url="https://wiki.gnome.org/Apps/Terminal/VTE"
arch=(x86_64)
license=(LGPL)
depends=(gtk4 pcre2 gnutls fribidi systemd vte-common)
makedepends=(gobject-introspection vala git gi-docgen gperf meson)
provides=(vte4 libvte-2.91-gtk4.so=0-64)
conflicts=(vte4)
source=('git+https://gitlab.gnome.org/GNOME/vte.git')
sha256sums=('SKIP')

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
    -D docs=false \
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
  rm -rf "$pkgdir"/etc/
  rm -rf "$pkgdir"/usr/lib/{systemd,vte-urlencode-cwd}

  # Conflict with vte3
  rm -rf "$pkgdir/usr/share/locale/"
}

# vim:set sw=2 et:
