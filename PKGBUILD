pkgname=mingw-w64-boost
pkgver=1.91.0
_boostver=${pkgver//./_}
pkgrel=1
pkgdesc="Free peer-reviewed portable C++ source libraries (mingw-w64)"
arch=('any')
url="http://www.boost.org/"
license=('BSL-1.0')
depends=('mingw-w64-zstd' 'mingw-w64-bzip2' 'mingw-w64-dlfcn')
makedepends=('mingw-w64-gcc' 'mingw-w64-wine' 'mingw-w64-environment')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://archives.boost.io/release/${pkgver}/source/boost_${_boostver}.tar.bz2")
sha256sums=('de5e6b0e4913395c6bdfa90537febd9028ea4c0735d2cdb0cd9b45d5f51264f5')

_architectures="32:i686-w64-mingw32 64:x86_64-w64-mingw32"

prepare() {
  for _arch in ${_architectures}; do
    source mingw-env "${_arch:3}"

    rm -rf build-${_arch:3}
    cp -r boost_${_boostver} build-${_arch:3}
    pushd build-${_arch:3}

    cat > user-config.jam << EOF
using gcc : mingw64 : ${CXX}
        :
        <rc>${_arch:3}-windres
        <archiver>${_arch:3}-ar
;
EOF
    ./bootstrap.sh --with-toolset=gcc
    popd
  done
}

package() {
  cd "${srcdir}"
  for _arch in ${_architectures}; do
    source mingw-env "${_arch:3}"
    pushd "build-${_arch:3}"
    LD_PRELOAD="" ./b2 -d2 -q ${MAKEFLAGS} \
      target-os=windows \
      variant=release \
      threading=multi \
      threadapi=win32 \
      link=shared,static \
      runtime-link=shared \
      --prefix=${pkgdir}/usr/${_arch:3} \
      --user-config=user-config.jam \
      --without-python --without-mpi --without-graph_parallel \
      cxxflags="${CXXFLAGS}" \
      linkflags="${LDFLAGS}" \
      address-model=${_arch:0:2} \
      architecture=x86 \
      binary-format=pe \
      abi=ms \
      -l0 ${MAKEFLAGS} \
      --layout=system install
    install -d $pkgdir/usr/${_arch:3}/bin
    mv "$pkgdir"/usr/${_arch:3}/lib/*.dll "$pkgdir"/usr/${_arch:3}/bin
    ${_arch:3}-strip --strip-unneeded "$pkgdir"/usr/${_arch:3}/bin/*.dll
    ${_arch:3}-strip -g "$pkgdir"/usr/${_arch:3}/lib/*.a
    popd
  done
}
