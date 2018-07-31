# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Aleksey Filippov <sarum9in@gmail.com>
# Contributor: xantares <xantares09 at hotmail dot com>

pkgname=mingw-w64-gdbm
pkgver=1.16
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
sha256sums=('c8a18bc6259da0c3eefefb018f8aa298fddc6f86c6fc0f0dec73270896ab512f'
            'SKIP'
            '2632CC3BB7B6FD5A1CAC352E99858A5397895ED1180DA33142BC39675F1E5397')

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
