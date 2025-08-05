# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=seahorse-nautilus
pkgver=3.11.92+r99+gbd57374
pkgrel=2
epoch=1
pkgdesc="PGP encryption and signing for nautilus"
url="https://gitlab.gnome.org/Archive/seahorse-nautilus"
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(
  dbus-glib
  dconf
  gcr
  glib2
  glibc
  gpgme
  gtk3
  libcryptui
  libnautilus-extension
  libnotify
)
makedepends=(
  git
  glib2-devel
  meson
)
_commit=bd573742e4272e72cd2150ccb82a514c69f20f44  # master
source=(
  "git+$url.git#commit=$_commit"
  0001-meson-Use-dependency-for-gpme.patch
  0002-Fix-build-with-gpgme-2.0.patch
)
b2sums=('796132d3cbbb0b3b727a7c3283fbec81a22c4968fa1351b10e6a2072b8b1f6f40ca0d9ab9a0b114bcae6c7e2e9b52a24a334fa9a9bdac3cad932b506e7c23c03'
        '4b086138fd2ccff137767e6e915d8bdf708739b0a33bb2f8398f56b10d5d0fcca192969370394eb495daebeb132235fddeecd76c02bf71f5783d7f4be27f2470'
        'e793dda5f52588075b3ac4decd4aa15a19aa14f53c7e49e6be8a5e81ffb6d15cc9fcc0a044ca04ad6b80cdf97d8d7dddc45af95d07572910e56e432f29e0f235')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $pkgname

  # https://gitlab.gnome.org/Archive/seahorse-nautilus/-/issues/9
  git apply -3 ../0001-meson-Use-dependency-for-gpme.patch

  # Fix build with gpgme 2.0
  git apply -3 ../0002-Fix-build-with-gpgme-2.0.patch
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

package() {
  depends+=(libnautilus-extension.so)

  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
