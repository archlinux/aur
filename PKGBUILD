# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgbase=libportal-inputcapture
pkgname=(
  libportal-inputcapture
  libportal-inputcapture-gtk3
  libportal-inputcapture-gtk4
  libportal-inputcapture-qt5
  libportal-inputcapture-docs
)
pkgver=0.6+r58+g3e6c1bf
pkgrel=1
pkgdesc="GIO-style async APIs for most Flatpak portals with patches to support input capture for input-leap"
url="https://github.com/whot/libportal"
arch=(x86_64)
license=(LGPL3)
makedepends=(
  gi-docgen
  git
  gjs
  gobject-introspection
  gtk3
  gtk4
  meson
  qt5-base
  qt5-x11extras
  vala
  xdg-desktop-portal
)
checkdepends=(
  python-dbusmock
  python-pytest
  xorg-server-xvfb
)
_commit=3e6c1bf9b34e73729ddeda9d58f050ab1bcc633c
source=("git+https://github.com/whot/libportal#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd libportal
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd libportal
  git cherry-pick -n 3e6c1bf9b34e73729ddeda9d58f050ab1bcc633c
}

build() {
  arch-meson libportal build
  meson compile -C build
}

#check() {
#  xvfb-run -s '-nolisten local' \
#    meson test -C build --print-errorlogs
#}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_libportal-inputcapture() {
  depends=(
    libg{lib,object,io}-2.0.so
    xdg-desktop-portal
  )
  provides=('libportal.so' 'libportal')
  conflicts=('libportal')
  replaces=('libportal')

  meson install -C build --destdir "$pkgdir"

  cd "$pkgdir"

  _pick gtk3 usr/include/libportal-gtk3
  _pick gtk3 usr/lib{,/pkgconfig}/libportal-gtk3.*
  _pick gtk3 {usr/lib/girepository-1.0,usr/share/gir-1.0}/XdpGtk3-1.0.*
  _pick gtk3 usr/share/vala/vapi/libportal-gtk3.*

  _pick gtk4 usr/include/libportal-gtk4
  _pick gtk4 usr/lib{,/pkgconfig}/libportal-gtk4.*
  _pick gtk4 {usr/lib/girepository-1.0,usr/share/gir-1.0}/XdpGtk4-1.0.*
  _pick gtk4 usr/share/vala/vapi/libportal-gtk4.*

  _pick qt5 usr/include/libportal-qt5
  _pick qt5 usr/lib{,/pkgconfig}/libportal-qt5.*

  _pick docs usr/share/doc
}

package_libportal-inputcapture-gtk3() {
  pkgdesc+=" - GTK 3 backend"
  depends=(
    libg{d,t}k-3.so
    libportal
  )
  provides=('libportal-gtk3.so' 'libportal-gtk3')
  conflicts=('libportal-gtk3')
  replaces=('libportal-gtk3')

  mv gtk3/* "$pkgdir"
}

package_libportal-inputcapture-gtk4() {
  pkgdesc+=" - GTK 4 backend"
  depends=(
    libgtk-4.so
    libportal
  )
  provides=('libportal-gtk4.so' 'libportal-gtk4')
  conflicts=('libportal-gtk4')
  replaces=('libportal-gtk4')

  mv gtk4/* "$pkgdir"
}

package_libportal-inputcapture-qt5() {
  pkgdesc+=" - Qt 5 backend"
  depends=(
    libportal
    qt5-base
    qt5-x11extras
  )
  provides=('libportal-qt5.so' 'libportal-qt5')
  conflicts=('libportal-qt5')
  replaces=('libportal-qt5')

  mv qt5/* "$pkgdir"
}

package_libportal-inputcapture-docs() {
  pkgdesc+=" - documentation"
  provides=('libportal-docs')
  conflicts=('libportal-docs')
  replaces=('libportal-docs')
  mv docs/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
