# Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=mingw-w64-libgcrypt
pkgver=1.10.1
pkgrel=1
pkgdesc="General purpose cryptographic library based on the code from GnuPG (mingw-w64)"
arch=("any")
url="https://www.gnupg.org"
license=("LGPL")
depends=('mingw-w64-libgpg-error')
makedepends=('mingw-w64-configure')
options=(staticlibs !buildflags !strip !emptydirs)
source=("https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-${pkgver}.tar.bz2"{,.sig}
        "libgcrypt-use-correct-def-file.patch"
        "Smarter-fig2dev-detection.all.patch")
sha1sums=('de2cc32e7538efa376de7bf5d3eafa85626fb95f'
          'SKIP'
          '0f03d59dee4b967dfa80621ef4b1efea61772c16'
          '3613a5454aeaef8d264011f2bc9f2303248fb933')
validpgpkeys=('6DAA6E64A76D2840571B4902528897B826403ADA') # Werner Koch
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/libgcrypt-${pkgver}"
  patch -p1 -i "$srcdir"/libgcrypt-use-correct-def-file.patch
  patch -p1 -i "${srcdir}"/Smarter-fig2dev-detection.all.patch
  autoreconf -fi
}

build() {
  cd "${srcdir}/libgcrypt-${pkgver}"
  unset LDFLAGS
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --with-gpg-error-prefix=/usr/${_arch}
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/libgcrypt-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install -j1 
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
    rm "$pkgdir/usr/${_arch}/share/info/dir"
  done
}
