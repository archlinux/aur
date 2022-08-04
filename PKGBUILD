# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Daniel Isenmann <daniel@archlinux.org>

pkgname=lib32-babl
_pkgbase=babl
pkgver=0.1.92
_commit=befaba5cf1509d46fe27ccf609bd576db2bfebdc  # tags/BABL_0_1_92
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
sha512sums=('946d640fd338244b59b1257effa585b9a5cc61daa9729301e94dcf2547b37478704dfde78f23bb73e267f0bb493f1e6934f977819bac966be4bba9ded7f151a9'
            'd95c6d11faea9e58f799555cb3652654f7035b46ccb430557d99f6ffc988c9e01985212c43d535f7b55ad7ec7126a30377167268e8c962abd558fdd01e77b6b8'
            'a6c604e01307e7f94b7449151c36f989aedc45aa355d3cdc3308830a4b6f0e15413a6c8e95189068716065c1ef1e97ed04dd63829690598cee54e2e7d48611ff')

prepare() {
  cp "git-version.h" "${_pkgbase}-$_commit/babl/"
  # To fix https://gitlab.gnome.org/GNOME/babl/-/merge_requests/45
  sed -i s/Description/description/ "${_pkgbase}-$_commit"/meson.build
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

