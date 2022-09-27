# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Daniel Isenmann <daniel@archlinux.org>

pkgname=lib32-babl
_pkgbase=babl
pkgver=0.1.96
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
sha512sums=('cae5f7567b77a6c8bd91c4e5beacc13a8af8cd537b291c2029a93a68a0c29b26cd63ac1716dc08738987d28b5dc16e87374964cb8e6cda8c1e1bf0ab833de44d'
            'd95c6d11faea9e58f799555cb3652654f7035b46ccb430557d99f6ffc988c9e01985212c43d535f7b55ad7ec7126a30377167268e8c962abd558fdd01e77b6b8'
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
  rm -r "$pkgdir/usr/include"
}

