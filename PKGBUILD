# Maintainer: Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Arjan <arjan@archlinux.org>
# contributor Sarah Hay <sarahhay@mb.sympatico.ca>

pkgname=mingw-w64-libdvdnav
_pkgname=libdvdnav
pkgver=6.1.1
pkgrel=1
pkgdesc='Library to navigate DVD video disks (mingw-w64)'
arch=('any')
url='https://www.videolan.org/developers/libdvdnav.html'
license=('GPL-2.0-or-later')
depends=('mingw-w64-crt' 'mingw-w64-libdvdread')
options=(!strip !buildflags !libtool staticlibs)
makedepends=('git' 'mingw-w64-configure' 'mingw-w64-gcc')
source=("git+https://code.videolan.org/videolan/libdvdnav.git#tag=$pkgver"
        "autotools.patch")
b2sums=('923e3171a7b5d488e77bbe8411827568c89cc85b2bb4d5434fc044b27274ef6c7e5987c4f2900f3a26371531603dcc66a7d40a7b4a9574fd8a4e677a482f7004'
        '687b6da6b4dfafd46e9792c7d78ab385e09b15cbcd6e96b110790f7418ba92069b8793473ce35264613c4a4df3bb0887765305135bb79b144ce5201e739dc18c')
validpgpkeys=('65F7C6B4206BD057A7EB73787180713BE58D1ADC') # VideoLAN Release Signing Key

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
