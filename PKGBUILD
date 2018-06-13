# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Michał Szymański <smiszym at gmail dot com>

pkgname=mingw-w64-libao
pkgver=1.2.2
pkgrel=1
pkgdesc="Cross-platform audio output library and plugins (mingw-w64)"
arch=(any)
url="https://www.xiph.org/ao/"
license=("GPL")
makedepends=('mingw-w64-configure' 'autogen' 'git')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=("git+https://git.xiph.org/libao.git#commit=3f4b02f046550aca54d7f11a5d9c56ac421f0b66")
md5sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/libao"
  ./autogen.sh
}

build() {
  cd "${srcdir}/libao"
  for _arch in ${_architectures}; do
    mkdir -p "build-${_arch}" && pushd "build-${_arch}"
    LIBS+=" -lksuser -lwinmm" ${_arch}-configure \
      --disable-pulse \
      --enable-wmm
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libao/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/bin/"*.dll
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
    rm -r "$pkgdir/usr/${_arch}/share"
  done
}
