# Maintainer: Ilya Basin <basinilya at gmail dot com>
# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Aleksey Filippov <sarum9in at gmail dot com>
# Contributor: xantares <xantares09 at hotmail dot com>

pkgname=mingw-w64-gdbm
pkgver=1.19
pkgrel=1
pkgdesc="GNU database library (mingw-w64)"
url="http://www.gnu.org/software/gdbm/gdbm.html"
license=('GPL')
arch=('any')
depends=('mingw-w64-crt' 'mingw-w64-gettext' 'mingw-w64-libiconv')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!buildflags' '!strip')
source=("https://ftp.gnu.org/gnu/gdbm/gdbm-${pkgver}.tar.gz"{,.sig}
        'gdbm-1.15-win32.patch')
sha256sums=('37ed12214122b972e18a0d94995039e57748191939ef74115b1d41d8811364bc'
            'SKIP'
            '2c3f0ed37482fe874218f4464414b592ebffa8776cca3c20fb0660f0036f4324')
validpgpkeys=('325F650C4C2B6AD58807327A3602B07F55D0C732')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/gdbm-${pkgver}"

  patch -Np1 -i "${srcdir}/gdbm-1.15-win32.patch"

  autoreconf -vfi
}

build() {
  cd "${srcdir}/gdbm-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p "build-${_arch}" && pushd "build-${_arch}"
    ${_arch}-configure \
      --enable-libgdbm-compat
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/gdbm-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a

    # create symlinks for compatibility
    install -dm755 "${pkgdir}"/usr/${_arch}/include/gdbm
    ln -sf ../gdbm.h "${pkgdir}"/usr/${_arch}/include/gdbm/gdbm.h
  done
}
