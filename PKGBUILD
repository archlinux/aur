# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Daniel Isenmann <daniel@archlinux.org>

pkgname=lib32-babl
_pkgbase=babl
pkgver=0.1.90
_commit=de43b8c7bfb494e1505b78b7170b4df94894850d  # tags/BABL_0_1_90
pkgrel=1
pkgdesc="Dynamic, any to any, pixel format conversion library (32-bit)"
arch=(x86_64)
url="https://gegl.org/babl/"
license=('LGPL3')
depends=("babl>=$pkgver" 'lib32-glibc' 'lib32-lcms2')
makedepends=(meson gobject-introspection)
options=(!libtool)
source=("https://gitlab.gnome.org/GNOME/$_pkgbase/-/archive/$_commit/$_pkgbase-$_commit.tar.gz"
        "git-version.h"
        "x86-linux-gnu")
sha512sums=('1fe89ce1002d8219b820849499ad0707b01da49d18308e268525161ad930ff5c8e79479ca57b1270a464507782e9f32909ef5d9467396efd18d11492b35b8692'
            'd95c6d11faea9e58f799555cb3652654f7035b46ccb430557d99f6ffc988c9e01985212c43d535f7b55ad7ec7126a30377167268e8c962abd558fdd01e77b6b8'
            'a6c604e01307e7f94b7449151c36f989aedc45aa355d3cdc3308830a4b6f0e15413a6c8e95189068716065c1ef1e97ed04dd63829690598cee54e2e7d48611ff')

prepare() {
  cp "git-version.h" "${_pkgbase}-$_commit/babl/"
}

build() {
  mkdir -p "build"
  arch-meson "${_pkgbase}-$_commit" "build" --cross-file x86-linux-gnu --libdir=/usr/lib32 --buildtype release -Dwith-docs=false
  ninja -C "build"
}

package() {
  DESTDIR="$pkgdir" ninja -C "build" install
  rm -r "$pkgdir/usr/include"
}

