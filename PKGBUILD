pkgname=mingw-w64-curl-http-only
pkgver=8.11.1
pkgrel=1
pkgdesc="cURL package for mingw-w64 with only HTTP support (minimal dependencies)"
arch=('any')
url="https://curl.haxx.se"
license=("MIT")
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
conflicts=('mingw-w64-curl')
options=('staticlibs' '!strip' '!buildflags')
source=("${url}/download/curl-${pkgver}.tar.xz")
sha256sums=('c7ca7db48b0909743eaef34250da02c19bc61d4f1dcedd6603f109409536ab56')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}"/curl-${pkgver}
  export CHOST=$(./config.guess)
  for _arch in ${_architectures}; do
    # Use the per-arch cmake wrapper installed by mingw-w64-cmake (e.g. i686-w64-mingw32-cmake)
    case "${_arch}" in
      i686-w64-mingw32)
        _host_triplet=i686-w64-mingw32
        ;;
      x86_64-w64-mingw32)
        _host_triplet=x86_64-w64-mingw32
        ;;
      *)
        _host_triplet=${_arch}
        ;;
    esac

    cmake_common_args=(
      -DCURL_BROTLI=OFF
      -DCURL_USE_LIBPSL=OFF
      -DCURL_USE_LIBSSH2=OFF
      -DCURL_ZLIB=OFF
      -DCURL_ZSTD=OFF
      -DHTTP_ONLY=ON
      -DUSE_NGHTTP2=OFF
      -DUSE_LIBIDN2=OFF
    )

    # Static build
    builddir=build-${_arch}
    mkdir -p "${builddir}" && pushd "${builddir}"
    "${_host_triplet}-cmake" ".." -DBUILD_SHARED_LIBS=ON -DBUILD_STATIC_LIBS=ON "${cmake_common_args[@]}"
    make -j$(nproc)
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/curl-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm -r "${pkgdir}/usr/${_arch}/share"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
