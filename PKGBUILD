# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-libassuan
pkgver=2.5.2
pkgrel=1
pkgdesc="IPC library used by some GnuPG related software (mingw-w64)"
arch=('any')
url="http://www.gnupg.org/related_software/libassuan/"
license=('GPL')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-libgpg-error')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://gnupg.org/ftp/gcrypt/libassuan/libassuan-${pkgver}.tar.bz2"
        "0001-fix-def-files.mingw.patch"
        "0002-enable-silent-rules.mingw.patch"
        "0004-enable-gnu.mingw.patch"
        "0005-better-check-for-stpcpy.mingw.patch")
sha256sums=('986b1bf277e375f7a960450fbb8ffbd45294d06598916ad4ebf79aee0cb788e7'
            'b74089b88544da56bf4e6589516264b30757b9393fb8bdd916ff7c03cbba6e19'
            '14a46889fc0a9d3d8c0426983e9a467da46d95dfd77156fc343de8c598504d05'
            '4e2f030dbfd0d1069a1d1015ac725509f1a8ac136ff83453d7a9ce31103e8263'
            'f907e774b3a065b66e4bdfa67000e6bc30a9e49184b1260b64def03914eba56f')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/libassuan-${pkgver}"
  patch -p1 -i ${srcdir}/0001-fix-def-files.mingw.patch
  patch -p1 -i ${srcdir}/0002-enable-silent-rules.mingw.patch
  patch -p1 -i ${srcdir}/0004-enable-gnu.mingw.patch
  patch -p1 -i ${srcdir}/0005-better-check-for-stpcpy.mingw.patch

  autoreconf -fi
}

build() {
  cd "${srcdir}/libassuan-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    if [ ${_arch} = "x86_64-w64-mingw32" ]; then
      CFLAGS+=" -DHAVE_DOSISH_SYSTEM=1"
    fi
    ${_arch}-configure \
      --with-libgpg-error-prefix=/usr/${_arch} \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libassuan-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}
