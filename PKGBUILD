# Maintainer: Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=mingw-w64-libdvdread
_pkgname=libdvdread
pkgver=6.1.3
pkgrel=3
pkgdesc='Library for reading DVD video disks (mingw-w64)'
arch=('any')
url='https://www.videolan.org/developers/libdvdnav.html'
license=('GPL-2.0-or-later')
depends=('mingw-w64-crt' 'mingw-w64-dlfcn')
options=(!strip !buildflags !libtool staticlibs)
makedepends=('git' 'mingw-w64-configure' 'mingw-w64-gcc')
optdepends=('mingw-w64-libdvdcss: Decoding encrypted DVDs')
source=("git+https://code.videolan.org/videolan/libdvdread.git#tag=$pkgver"
        "autotools.patch")
b2sums=('bdc0a6fcbc75dfe000f618cab1e2c736762a1d54c68851207c471a7177080c48964d2b7e4dc96dbdbacdadb42f022a2d3c6e097e83b612b9bbe2641240c5f38d'
        '90f064b0bf210847cdbd80e2093fa073d020224fbe0036c976f0f6a8c7cab308ed13ed01f5aeea71942da16a8d01ed3e669b26da80e7ce991b3766253bf0bfb9')
validpgpkeys=('65F7C6B4206BD057A7EB73787180713BE58D1ADC') # VideoLAN Release Signing Key (2015)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd $_pkgname
  autoreconf -fi

  patch -Np1 -i "$srcdir/autotools.patch"
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p ${srcdir}/$_pkgname/build-${_arch} && cd ${srcdir}/$_pkgname/build-${_arch}
    LIBS="-ldl" ${_arch}-configure
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/$_pkgname/build-${_arch}
    make DESTDIR="$pkgdir" install
  done
}
