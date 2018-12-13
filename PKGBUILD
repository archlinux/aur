# Contributor: Daniel Kirchner <daniel@ekpyron.org>

pkgname=mingw-w64-boost
pkgver=1.69.0
_boostver=${pkgver//./_}
pkgrel=1
pkgdesc="Free peer-reviewed portable C++ source libraries (mingw-w64)"
arch=('any')
url="http://www.boost.org/"
license=('custom')
depends=('mingw-w64-crt' 'mingw-w64-zlib' 'mingw-w64-bzip2')
makedepends=('mingw-w64-gcc' 'bzip2' 'zlib' 'python2')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://dl.bintray.com/boostorg/release/${pkgver}/source/boost_${_boostver}.tar.bz2"
        "boost-mingw.patch")
sha256sums=('8f32d4617390d1c2d16f26a27ab60d97807b35440d45891fa340fc2648b04406'
            '11a5c39852e0513d871a0f74c2f1224efc602a0404db7cd83190712e49a6d3bc')

_architectures="32:i686-w64-mingw32 64:x86_64-w64-mingw32"


prepare() {
  cd "${srcdir}/boost_${_boostver}"

  # https://svn.boost.org/trac/boost/ticket/7262
  patch -Np0 -i "${srcdir}"/boost-mingw.patch

  cd "${srcdir}"
  for _arch in ${_architectures}; do
    rm -rf build-${_arch:3}
    cp -r boost_${_boostver} build-${_arch:3}
     pushd build-${_arch:3}

    cat > user-config.jam << EOF
using gcc : mingw64 : ${_arch:3}-g++
        :
        <rc>${_arch:3}-windres
        <archiver>${_arch:3}-ar
;
EOF
    ./bootstrap.sh --with-toolset=gcc --with-python=/usr/bin/python2
    popd
  done
}

package() {
  cd "${srcdir}"
  for _arch in ${_architectures}; do
    pushd "build-${_arch:3}"
    ./b2 -d+2 -q ${MAKEFLAGS} \
      target-os=windows \
      variant=release \
      threading=multi \
      threadapi=win32 \
      link=shared,static \
      runtime-link=shared \
      --prefix=${pkgdir}/usr/${_arch:3} \
      --user-config=user-config.jam \
      --without-python --without-mpi --without-graph_parallel \
      cxxflags="-std=c++14 -O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4" \
      address-model=${_arch:0:2} \
      architecture=x86 \
      binary-format=pe \
      ${MAKEFLAGS} \
      --layout=system install
    install -d $pkgdir/usr/${_arch:3}/bin
    mv "$pkgdir"/usr/${_arch:3}/lib/*.dll "$pkgdir"/usr/${_arch:3}/bin
    ${_arch:3}-strip --strip-unneeded "$pkgdir"/usr/${_arch:3}/bin/*.dll
    ${_arch:3}-strip -g "$pkgdir"/usr/${_arch:3}/lib/*.a
    popd
  done
}

