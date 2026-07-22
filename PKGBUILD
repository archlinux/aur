# Maintainer: Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=mingw-w64-libdvdread
_pkgname=libdvdread
pkgver=7.1.1
pkgrel=1
pkgdesc='Library for reading DVD video disks (mingw-w64)'
arch=('any')
url='https://www.videolan.org/developers/libdvdnav.html'
license=('GPL-2.0-or-later')
depends=(
  'mingw-w64-crt'
  'mingw-w64-dlfcn'
)
options=(!strip !buildflags !libtool staticlibs !debug)
makedepends=(
  'git'
  'mingw-w64-meson'
  'mingw-w64-gcc'
)
optdepends=(
  'mingw-w64-libdvdcss: Decoding encrypted DVDs'
)
source=("git+https://code.videolan.org/videolan/libdvdread.git#tag=$pkgver")
b2sums=('6da11c869a7fef3e21c6df94201b9fef4cc9ff51077d405431fba1915c829900b2cea93023afd9c7dad1a80898dd0faaa55679419523126c47fec141a546ef9c')
validpgpkeys=('65F7C6B4206BD057A7EB73787180713BE58D1ADC') # VideoLAN Release Signing Key (2015)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd $_pkgname

  # Fix out of tree build
  sed -i "s|'git', 'log'|'git', '-C', meson.project_source_root(), 'log' |" meson.build
}

build() {
  for _arch in ${_architectures}; do
    ${_arch}-meson $_pkgname build-${_arch} \
      -D libdvdcss=disabled
    meson compile -C build-${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    meson install -C build-${_arch} --destdir "$pkgdir"

    rm -f "$pkgdir/usr/${_arch}/share/doc/libdvdread/"*
    rmdir "$pkgdir/usr/${_arch}/share/doc/libdvdread/"
    rmdir "$pkgdir/usr/${_arch}/share/doc/"
    rmdir "$pkgdir/usr/${_arch}/share/"
  done
}
