# Maintainer: Tony Houghton <h@realh.co.uk>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgbase=vte3-kinetic
pkgname=(vte3-kinetic vte-kinetic-common)
pkgver=0.63.0+1+0.61.90+150+g8d4204f3
pkgrel=1
pkgdesc="vte3 patched to enable kinetic scrolling with libinput"
url="https://wiki.gnome.org/Apps/Terminal/VTE"
arch=(x86_64)
license=(LGPL)
depends=(gtk3 pcre2 gnutls fribidi systemd-libs)
makedepends=(gobject-introspection vala git gtk-doc gperf meson)
source=("git+https://gitlab.gnome.org/GNOME/vte.git")
sha256sums=('SKIP')

pkgver() {
  cd vte
  printf 0.63.0+1+
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd vte
}

build() {
  arch-meson vte build -D docs=true -D b_lto=false
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_vte3-kinetic() {
  depends+=(vte-kinetic-common)
  provides+=(vte3=${pkgver} libvte-2.91.so)
  conflicts=(vte3)

  DESTDIR="$pkgdir" meson install -C build

### Split vte-kinetic-common
  _pick vte-kinetic-common "$pkgdir"/etc/profile.d
  _pick vte-kinetic-common "$pkgdir"/usr/lib/{systemd,vte-urlencode-cwd}
}

package_vte-kinetic-common() {
  pkgdesc="Files shared by VTE libraries"
  depends=(sh)
  provides+=(vte-common=${pkgver})
  conflicts=(vte-common)
  mv vte-kinetic-common/* "$pkgdir"
}

# vim:set sw=2 et:
