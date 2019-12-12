pkgname=mingw-w64-boost
pkgver=1.72.0
_boostver=${pkgver//./_}
pkgrel=1
pkgdesc="Free peer-reviewed portable C++ source libraries (mingw-w64)"
arch=('any')
url="http://www.boost.org/"
license=('custom')
depends=('mingw-w64-zstd' 'mingw-w64-bzip2' 'mingw-w64-libbacktrace-git')
makedepends=('mingw-w64-gcc' 'mingw-w64-wine')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://dl.bintray.com/boostorg/release/${pkgver}/source/boost_${_boostver}.tar.bz2"
        "boost-mingw.patch" "jam-wine.patch")
sha256sums=('59c9b274bc451cf91a9ba1dd2c7fdcaf5d60b1b3aa83f2c9fa143417cc660722'
            '11a5c39852e0513d871a0f74c2f1224efc602a0404db7cd83190712e49a6d3bc'
            '5ca770bf155dbed4f96b1fcd358d515ad77a1ca7ae5e6d6b180939beceff05af')

_architectures="32:i686-w64-mingw32 64:x86_64-w64-mingw32"


prepare() {
  cd "${srcdir}/boost_${_boostver}"

  # https://svn.boost.org/trac/boost/ticket/7262
  patch -Np0 -i "${srcdir}"/boost-mingw.patch

  # run jam exes through wine (eg for libbacktrace detection)
  patch -p1 -i "${srcdir}"/jam-wine.patch

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
    ./bootstrap.sh --with-toolset=gcc
    popd
  done
}

package() {
  cd "${srcdir}"
  for _arch in ${_architectures}; do
    pushd "build-${_arch:3}"
    export BOOST_CROSSCOMPILING_EMULATOR=/usr/bin/${_arch:3}-wine
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
      cxxflags="-std=c++14 -D_FORTIFY_SOURCE=2 -O2 -pipe -fno-plt -fexceptions --param=ssp-buffer-size=4" \
      linkflags="-Wl,-O1,--sort-common,--as-needed -fstack-protector" \
      address-model=${_arch:0:2} \
      architecture=x86 \
      binary-format=pe \
      -l0 ${MAKEFLAGS} \
      --layout=system install
    install -d $pkgdir/usr/${_arch:3}/bin
    mv "$pkgdir"/usr/${_arch:3}/lib/*.dll "$pkgdir"/usr/${_arch:3}/bin
    ${_arch:3}-strip --strip-unneeded "$pkgdir"/usr/${_arch:3}/bin/*.dll
    ${_arch:3}-strip -g "$pkgdir"/usr/${_arch:3}/lib/*.a
    popd
  done
}

