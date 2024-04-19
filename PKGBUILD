# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=seahorse-nautilus
pkgver=3.11.92+r96+g0fd324c
pkgrel=1
epoch=1
pkgdesc="PGP encryption and signing for nautilus"
url="https://gitlab.gnome.org/Archive/seahorse-nautilus"
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(libnautilus-extension gtk3 gcr libcryptui libnotify)
makedepends=(meson git)
_commit=0fd324c191565bff76ca45a01b2da14b4ab7b3bd  # master
source=("git+$url.git#commit=$_commit"
        meson_use_dependency_for_gpme.patch)
sha256sums=('e6b56bb84726e798143f8d55b3fe0cebc33460af3afac308a3a31c7f6e039b92'
            '1b2cb3b980a6ce49445b9b537cc0cb6db9139b364f216f1555ee9819b59d70a2')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $pkgname

  # https://gitlab.gnome.org/Archive/seahorse-nautilus/-/issues/9
  patch -Np1 -i ../meson_use_dependency_for_gpme.patch

  # Allow building with gnupg 2.4.x
  sed -i "s/'2.3.0'/'2.3.0', '2.4.0'/g" meson.build
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
