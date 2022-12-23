# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Daniel Isenmann <daniel@archlinux.org>

pkgname=lib32-babl
_pkgbase=babl
pkgver=0.1.98
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
sha512sums=('958513bf08cb51174b97e3d2d018eb32b72cce654b31f8e007bf2b3bcb40014400a71f8b574efd7cb68c6c676c0ba70e3b5019ebec6da6df014bdd6eb370d450'
            '5df9d09cc28e3c89de95c7fd4032ad7c3221b993b5788dad65d6a4e283ef78a557749a33af819dedfe11d4cdf33e63db5002f8aaaf07efc948215e27950ba582'
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

