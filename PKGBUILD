# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Daniel Isenmann <daniel@archlinux.org>

pkgname=lib32-babl
_pkgbase=babl
pkgver=0.1.106
_tag="BABL_${pkgver//./_}"
pkgrel=1
pkgdesc="Dynamic, any to any, pixel format conversion library (32-bit)"
arch=(x86_64)
url="https://gegl.org/babl/"
license=('LGPL3')
depends=("babl>=$pkgver" 'lib32-glibc' 'lib32-lcms2')
makedepends=(meson gobject-introspection)
options=(!libtool)
source=("https://gitlab.gnome.org/GNOME/$_pkgbase/-/archive/$_tag/$_pkgbase-$_tag.tar.gz"
        "git-version.h"
        "x86-linux-gnu")
sha512sums=('f3b69a3a85e993da007a83d9e35d311535a1bfe6d431a38d99adbf86a9976da087b04a7d076c1689f95962d9ddbf827d29e7b35ea7cd121846cf53f35f8004d1'
            'af215d12dee7c5b5b45956410735f5fa2b0bd0515d4a8804b03edc551064302fa27a737aad97fb5690d3d9070e4d8f0d467468eafe52a59d775d347809f4db16'
            'a6c604e01307e7f94b7449151c36f989aedc45aa355d3cdc3308830a4b6f0e15413a6c8e95189068716065c1ef1e97ed04dd63829690598cee54e2e7d48611ff')

prepare() {
  cp "git-version.h" "${_pkgbase}-$_tag/babl/"
}

build() {
  mkdir -p "build"
  arch-meson "${_pkgbase}-$_tag" "build" --cross-file x86-linux-gnu --libdir=/usr/lib32 --buildtype release -Dwith-docs=false
  ninja -C "build"
}

package() {
  DESTDIR="$pkgdir" ninja -C "build" install
  rm -rf "$pkgdir"/usr/{bin,include}
}

