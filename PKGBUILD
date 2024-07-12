# Maintainer : Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>
# Contributor: David Runge <dvzrv@archlinux.org>

pkgname=mingw-w64-libopenmpt
_pkgname=libopenmpt
pkgver=0.7.8
pkgrel=1
pkgdesc="A library to render tracker music to a PCM audio stream (mingw-w64)"
arch=(any)
url="https://lib.openmpt.org/libopenmpt/"
license=(BSD-3-Clause)
depends=(
  mingw-w64-flac
  mingw-w64-crt
  mingw-w64-libogg
  mingw-w64-libsndfile
  mingw-w64-libvorbis
  mingw-w64-mpg123
  mingw-w64-portaudio
  mingw-w64-zlib
)
options=(!strip !buildflags staticlibs)
makedepends=(autoconf-archive mingw-w64-configure mingw-w64-gcc)
source=($_pkgname-$pkgver.tar.gz::https://lib.openmpt.org/files/libopenmpt/src/$_pkgname-$pkgver+release.autotools.tar.gz
        sf_wchar_open.patch)
sha512sums=('ebfb2b87df46d3567130d4e4f477dbc1baa5e9dc4ae8af8add619771f71b3686332da3c22f7947403aa7078f38fae00a50a0381ef895fb0e7610120b5330f0d2'
            '3db33e13e383420ae09e189462ac1b57fe8f49d3a6bdd365bda7ae47f549567b86cc25e497935ec516a919ab4447db3b76ab21fc943b51cd9bcf9da247601c7e')
b2sums=('f765c2ce9d82adff6fa3a78c3b346cb71662460b8e4ab1f77547a87e3b034146ec0c9e0ad9c38e0edbf9c2abfa3b0ee9e412c094ec494875fe58f86bc7b36dda'
        '24c7f85efd34243c6730d563a0f4910e9fd5b26ff44700ba56df90a054ffaea932829986f96a75e2a67244829fb46526c36eb0959b047e6430f063fd3032399a')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd $_pkgname-$pkgver+release.autotools
  autoreconf -fiv

  patch -Np1 -i "${srcdir}/sf_wchar_open.patch"
}

build() {
  cd $_pkgname-$pkgver+release.autotools
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
      CFLAGS="-lssp" CXXFLAGS="-lssp" ${_arch}-configure
      # prevent excessive overlinking due to libtool
      sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
      make
    popd
  done
}

check() {
  cd $_pkgname-$pkgver+release.autotools
  for _arch in ${_architectures}; do
      pushd build-${_arch}
      make -k check
      popd
  done
}

package() {
  cd $_pkgname-$pkgver+release.autotools
  for _arch in ${_architectures}; do
      pushd build-${_arch}
      make DESTDIR="$pkgdir" install
      popd

      rm -r "$pkgdir/usr/${_arch}/share/"
  done

  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
