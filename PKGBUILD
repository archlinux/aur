# Maintainer: Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Arjan <arjan@archlinux.org>
# contributor Sarah Hay <sarahhay@mb.sympatico.ca>

pkgname=mingw-w64-libdvdnav
_pkgname=libdvdnav
pkgver=7.0.0
pkgrel=1
pkgdesc='Library to navigate DVD video disks (mingw-w64)'
arch=('any')
url='https://www.videolan.org/developers/libdvdnav.html'
license=('GPL-2.0-or-later')
depends=(
  'mingw-w64-crt'
  'mingw-w64-libdvdread'
)
options=(!strip !buildflags !libtool staticlibs !debug)
makedepends=(
  'git'
  'mingw-w64-meson'
  'mingw-w64-gcc'
)
source=("git+https://code.videolan.org/videolan/libdvdnav.git#tag=$pkgver")
b2sums=('64a37fb6c68aed46b2cbf2bd98e499bf9ed8694d9f358d07a2e630bba385bb48b909eea04097da86d0bc4f8958c987895fd98a7ba4d82119d8a8a4a9e6743583')
validpgpkeys=('65F7C6B4206BD057A7EB73787180713BE58D1ADC') # VideoLAN Release Signing Key

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    ${_arch}-meson $_pkgname build-${_arch}
    meson compile -C build-${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    meson install -C build-${_arch} --destdir "$pkgdir"

    rm -f "$pkgdir/usr/${_arch}/share/doc/libdvdnav/"*
    rmdir "$pkgdir/usr/${_arch}/share/doc/libdvdnav/"
    rmdir "$pkgdir/usr/${_arch}/share/doc/"
    rmdir "$pkgdir/usr/${_arch}/share/"
  done
}
