# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Michael Kanis <mkanis@gmx.de>

pkgname=libchamplain
pkgver=0.12.22.r2160.ad9de28
pkgrel=2
pkgdesc='Map widget for GTK 3'
url=https://wiki.gnome.org/Projects/libchamplain
license=(LGPL-2.1)
arch=(x86_64)
depends=(cairo clutter-gtk libsoup3 sqlite)
makedepends=(git glib2-devel gobject-introspection gtk-doc meson vala)
_commit=ad9de2896b8a2b0e91e6a9e3da86af9c961f000a # HEAD, version bumped at 84ce376d81f1316c9796bf84a6ded7a767c4c361
#source=("$pkgname-$pkgver::git+https://gitlab.gnome.org/GNOME/libchamplain.git#commit=$_commit")
source=("$pkgname-$pkgver::git+https://github.com/GNOME/libchamplain.git#commit=$_commit")
sha256sums=('60ff41c1c602e8eff71ae5348c01ccfc574cc4a178ca5ffd7e850460de7ff6a3')

pkgver() {
  #git -C $pkgname-$pkgver describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'

  cd $pkgname-$pkgver
  printf "%s.r%s.%s" "$(sed -n "/version:/{s/.*version: '\([^']*\)'.*/\1/p;q}" meson.build)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson $pkgname-$pkgver build -D gtk_doc=true
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
