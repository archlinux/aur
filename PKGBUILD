# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=seahorse-nautilus
pkgver=3.11.92+r88+g86214b8
pkgrel=1
epoch=1
pkgdesc="PGP encryption and signing for nautilus"
url="https://gitlab.gnome.org/GNOME/seahorse-nautilus"
arch=(x86_64)
license=(GPL)
depends=(libcryptui nautilus libgnome-keyring)
makedepends=(meson git)
options=(debug)
_commit=86214b89bc6f605e28025df896a3a306bf3c5f52  # master
source=("git+$url.git#commit=$_commit"
        1.patch)
sha256sums=('SKIP'
            '7e27ab3bc132bc3c3039da1490c1a972297469b97caeb7236a01779933251a47')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $pkgname

  # https://bugs.archlinux.org/task/61061
  # https://gitlab.gnome.org/GNOME/seahorse-nautilus/merge_requests/1
  git apply -3 ../1.patch
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
