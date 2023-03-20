pkgname=mingw-w64-openimagedenoise
pkgver=1.2.4
pkgrel=1
epoch=
pkgdesc="Interl(R) Open Image Denoise library"
arch=("any")
url="https://openimagedenoise.github.io"
license=('Apache')
depends=("mingw-w64-onetbb")
makedepends=("mingw-w64-cmake")
options=('!strip' '!buildflags' 'staticlibs')
source=("https://github.com/OpenImageDenoise/oidn/releases/download/v${pkgver}/oidn-${pkgver}.src.tar.gz")
sha256sums=('948b070c780b5de0d983e7d5d37f6d9454932cc278913d9ee5b0bd047d23864a')

_architectures="x86_64-w64-mingw32"

prepare() {
  cd "oidn-${pkgver}"
}

build() {
  cd "oidn-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    MINGW_CPPFLAGS="-D_WIN32_WINNT=0x0600" ${_arch}-cmake -DTBB_ROOT=/usr/${_arch} ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/oidn-${pkgver}/build-${_arch}"
    make install DESTDIR="${pkgdir}"
    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/bin/"*.dll
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
  done
}
