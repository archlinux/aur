# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Andrew Sun <adsun701 at gmail dot com>

pkgname=mingw-w64-libgpg-error
pkgver=1.56
pkgrel=1
pkgdesc="Support library for libgcrypt (mingw-w64)"
arch=(any)
url="http://www.gnupg.org"
license=(LGPL-2.1-or-later
         'BSD-3-Clause OR LGPL-2.1-or-later'
         FSFULLR
         GPL-2.0-or-later)
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt')
options=(staticlibs !strip !buildflags)
source=("https://www.gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-${pkgver}.tar.bz2" # {,.sig}
        "02-fix-symbollist-on.mingw.patch"
        "05-w32-gen.all.patch"
        "07-windows-build.patch")
sha256sums=('82c3d2deb4ad96ad3925d6f9f124fe7205716055ab50e291116ef27975d169c0'
            '364da17febff3f6eeffee5a5f1e3ed1b644adeb5ca48a972c5c4675c10238a91'
            '9ccdc567810d58526888fd11c5f7d01101627011840b7b75a91e96aa9e71f49d'
            'f62a8464414a65b1aac20820d4f4eeb0aa25e5c865aa4ba5914f1f10a41d336d')
validpgpkeys=('6DAA6E64A76D2840571B4902528897B826403ADA'  # Werner Koch (dist signing 2020)
              'AC8E115BF73E2D8D47FA9908E98E9B2D19C6C8BD')  # Niibe Yutaka (GnuPG Release Key)
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/libgpg-error-${pkgver}"
  patch -p1 -i ${srcdir}/02-fix-symbollist-on.mingw.patch
  patch -p1 -i ${srcdir}/05-w32-gen.all.patch
  patch -p1 -i ${srcdir}/07-windows-build.patch
  autoreconf -fiv
}

build() {
  cd "${srcdir}/libgpg-error-${pkgver}"
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libgpg-error-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    find "${pkgdir}/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
    rm -rf "${pkgdir}/usr/${_arch}/share/info/dir"
  done
}
