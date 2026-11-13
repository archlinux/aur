# Maintainer: Andrew Kozik <andrewkoz at live dot com>

pkgname=mingw-w64-uvwasi
_pkgname=uvwasi
pkgver=0.0.23
pkgrel=1
pkgdesc="WASI syscall API built atop libuv (mingw-w64)"
arch=('any')
url="https://github.com/nodejs/uvwasi"
license=('MIT')
makedepends=('mingw-w64-cmake')
depends=('mingw-w64-crt' 'mingw-w64-libuv')
options=('!strip' '!buildflags' '!debug' 'staticlibs')
source=("https://github.com/nodejs/uvwasi/archive/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('15d0ccd9d23a754285b78191c79f026cdad48af86be862ececd230e526db4aa24c6f7d2940d71aca677c3c703c70c251e366baf6bf3b3269850f8e5d2b38c64e')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -B . -S .. \
	    -DBUILD_TESTING=OFF
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${_pkgname}-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
