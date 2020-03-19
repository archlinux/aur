# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-wavpack
pkgver=5.2.0
pkgrel=1
pkgdesc="Audio compression format with lossless, lossy and hybrid compression modes (mingw-w64)"
arch=('any')
url="http://www.wavpack.com/"
license=('BSD')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=(http://www.wavpack.com/wavpack-${pkgver}.tar.bz2)
sha512sums=('456da78fb5d01b33a8ed71b43cb6809a25ca0d54e53858b93bbb3eb26923bfa6de4c6a3c01caca947c0852aea74d1b14667205dae344148a01619e67eb2c7e71')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/wavpack-$pkgver/"
  LDFLAGS="-lssp"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure --disable-apps ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/wavpack-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm -rf "$pkgdir"/usr/${_arch}/share/man
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

# vim: ts=2 sw=2 et:
