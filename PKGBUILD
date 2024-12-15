# Maintainer: Joshua Barrett <jbarrett186@gmail.com>

pkgname=bpf-unknown-none-gcc
pkgver=14.2.0
pkgrel=1
pkgdesc="Cross GCC for Linux eBPF"
arch=('x86_64')
url="https://gcc.gnu.org"
license=(GPL-3.0-with-GCC-exception GFDL-1.3-or-later)
depends=(
  bash
  gcc-libs
  glibc
  gmp
  libisl
  libmpc
  mpfr
  python
  zlib
  zstd
)
options=('!strip' 'staticlibs' '!emptydirs' '!buildflags')
source=(https://ftp.gnu.org/gnu/gcc/gcc-$pkgver/gcc-$pkgver.tar.xz{,.sig})
validpgpkeys=(D3A93CAD751C2AF4F8C7AD516C35B99309B5FA62  # Jakub Jelinek <jakub@redhat.com>
              13975A70E63C361C73AE69EF6EEB81F8981C74C7) # richard.guenther@gmail.com
sha512sums=('932bdef0cda94bacedf452ab17f103c0cb511ff2cec55e9112fc0328cbf1d803b42595728ea7b200e0a057c03e85626f937012e49a7515bc5dd256b2bf4bc396'
            'SKIP')

_architectures="bpf-unknown-none"

prepare() {
  ln -sf gcc-${pkgver/+/-} gcc
  cd gcc
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p "$srcdir"/build-${_arch} && cd "$srcdir"/build-${_arch}
    "$srcdir"/gcc/configure --prefix=/usr --libexecdir=/usr/lib \
        --target=${_arch} \
        --with-system-zlib --enable-cloog-backend=isl \
        --enable-lto \
        --disable-multilib --enable-checking=release \
        --disable-sjlj-exceptions --with-dwarf2
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/build-${_arch}
    make DESTDIR="$pkgdir" install
    strip "$pkgdir"/usr/bin/${_arch}-*
    strip "$pkgdir"/usr/lib/gcc/${_arch}/${pkgver}/cc1*
    ln -s ${_arch}-gcc "$pkgdir"/usr/bin/${_arch}-cc
  done
  strip "$pkgdir"/usr/bin/*
  # remove unnecessary files
  rm -r "$pkgdir"/usr/share
  rm "$pkgdir"/usr/lib/libcc1.*
}
