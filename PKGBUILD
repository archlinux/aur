# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=seahorse-nautilus
pkgver=3.11.92+66+g02c81f1
pkgrel=1
pkgdesc="PGP encryption and signing for nautilus"
arch=(x86_64)
url="https://gitlab.gnome.org/GNOME/seahorse-nautilus.git/"
license=(GPL)
depends=(libcryptui nautilus libgnome-keyring)
makedepends=(meson git)
_commit=02c81f1dda64571f837fc2cc9180fe2a86d8d8b6  # master
source=("git+https://gitlab.gnome.org/GNOME/seahorse-nautilus.git#commit=$_commit"
        1.patch)
sha256sums=('SKIP'
            '7e27ab3bc132bc3c3039da1490c1a972297469b97caeb7236a01779933251a47')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname

  # https://bugs.archlinux.org/task/61061
  # https://gitlab.gnome.org/GNOME/seahorse-nautilus/merge_requests/1
  git apply -3 ../1.patch
}

build() {
  arch-meson $pkgname build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
