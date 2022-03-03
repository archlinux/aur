# -*- mode: Shell-script; eval: (setq indent-tabs-mode nil); eval: (setq tab-width 2) -*-
# Maintainer: Dominic Meiser <git at msrd0 dot de>
# Contributor: Martchus <martchus at gmx dot net>

pkgname=mingw-w64-pcre2-static
pkgver=10.39
pkgrel=1
pkgdesc='A library that implements Perl 5-style regular expressions. 2nd version (mingw-w64)'
arch=('any')
url='https://www.pcre.org/'
license=('BSD')
makedepends=(mingw-w64-configure mingw-w64-readline mingw-w64-bzip2 mingw-w64-zlib)
depends=(mingw-w64-crt)
options=(staticlibs !strip !buildflags)
optdepends=(mingw-w64-readline mingw-w64-bzip2 mingw-w64-zlib)
provides=("mingw-w64-pcre2=$pkgver")
conflicts=('mingw-w64-pcre2')
source=("https://github.com/PhilipHazel/pcre2/releases/download/pcre2-$pkgver/pcre2-$pkgver.tar.bz2"{,.sig})
sha512sums=('b3d898198f4b5ffc3453d2ba56fe2a7298c01c52e5f67d45f1e046fc0dee62e16a4024fcb65839ac9c367beedb531647affd6f8599fbeb102f19423c150d80d4'
            'SKIP')
validpgpkeys=('45F68D54BBE23FB3039B46E59766E084FB0F43D8')  # Philip Hazel

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/pcre2-$pkgver"
}

build() {
  cd "$srcdir/pcre2-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --enable-jit \
      --enable-pcre2-16 \
      --enable-pcre2-32 \
      --enable-pcre2grep-libz \
      --enable-pcre2grep-libbz2 \
      --enable-pcre2test-libreadline \
      --disable-shared
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/pcre2-$pkgver/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm -r "$pkgdir/usr/${_arch}/share/"{man,doc}
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' | xargs ${_arch}-strip -g
  done
}
