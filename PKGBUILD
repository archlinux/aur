# Maintainer: Emil Velikov <emil.l.velikov@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=zenity
pkgname+="-light"
pkgver=3.44.0
pkgrel=1
pkgdesc="Display graphical dialog boxes from shell scripts"
pkgdesc+=" - light version without WekKit2"
url="https://gitlab.gnome.org/GNOME/zenity"
arch=(x86_64)
license=(LGPL)
depends=(gtk3 libnotify)
makedepends=(yelp-tools meson git)
conflicts=("${pkgname%-light}")
provides=("${pkgname%-light}")
_commit=7bf8c8910d34bfb2b883b32118b93b68d44dd77b  # tags/3.44.0^0
source=("git+https://gitlab.gnome.org/GNOME/zenity.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd zenity
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd zenity
}

build() {
  local meson_options=(
    -D libnotify=true
    -D webkitgtk=false
  )

  arch-meson zenity build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
