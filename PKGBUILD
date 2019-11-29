# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-libgpg-error
pkgver=1.36
pkgrel=2
pkgdesc="Support library for libgcrypt (mingw-w64)"
arch=(any)
url="http://www.gnupg.org"
license=("LGPL")
makedepends=('mingw-w64-configure')
depends=('mingw-w64-gettext')
options=(staticlibs !strip !buildflags)
source=("ftp://ftp.gnupg.org/gcrypt/libgpg-error/libgpg-error-${pkgver}.tar.bz2"{,.sig}
        "01-mingw32-fix-potomo.mingw.patch"
        "02-fix-symbollist-on.mingw.patch"
        "05-w32-gen.all.patch"
        "07-windows-build.patch"
        'gawk5.diff')
sha256sums=('babd98437208c163175c29453f8681094bcaf92968a15cafb1a276076b33c97c'
            'SKIP'
            '252349e58d418adfec5621af1e09753db52b1bf39983aa3bc398d636afb9b495'
            '364da17febff3f6eeffee5a5f1e3ed1b644adeb5ca48a972c5c4675c10238a91'
            '9ccdc567810d58526888fd11c5f7d01101627011840b7b75a91e96aa9e71f49d'
            'ff73e4bde792f5c84c99810b83467d20247856076a92e5940f9fd64a8815187d'
            'b3f12474986a0fe7340013e3dbe963acf303d76f53c440ef38e8233f4cb7928f')
validpgpkeys=('D8692123C4065DEA5E0F3AB5249B39D24F25E3B6'  # Werner Koch
              '031EC2536E580D8EA286A9F22071B08A33BD3F06') # NIIBE Yutaka (GnuPG Release Key) <gniibe@fsij.org>
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/libgpg-error-${pkgver}"
  patch -p1 -i ${srcdir}/01-mingw32-fix-potomo.mingw.patch
  patch -p1 -i ${srcdir}/02-fix-symbollist-on.mingw.patch
  patch -p1 -i ${srcdir}/05-w32-gen.all.patch
  patch -p1 -i ${srcdir}/07-windows-build.patch
  # upstream fix to allow build with gawk 5.x
  patch -Np1 -i ${srcdir}/gawk5.diff
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
