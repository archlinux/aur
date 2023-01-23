pkgname=mingw-w64-boost
pkgver=1.81.0
_boostver=${pkgver//./_}
pkgrel=1
pkgdesc="Free peer-reviewed portable C++ source libraries (mingw-w64)"
arch=('any')
url="http://www.boost.org/"
license=('custom')
depends=('mingw-w64-zstd' 'mingw-w64-bzip2' 'mingw-w64-libbacktrace-git')
makedepends=('mingw-w64-gcc' 'mingw-w64-wine')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://boostorg.jfrog.io/artifactory/main/release/${pkgver}/source/boost_${_boostver}.tar.bz2"
        "context-cross.patch" "stacktrace-cross.patch")
sha256sums=('71feeed900fbccca04a3b4f2f84a7c217186f28a940ed8b7ed4725986baf99fa'
            '844e163845ea6e7ae1f8d26cb52f72c6e4645cdade1be081bc1d2cff5db0a918'
            '333791abd17ea192e0aa90185bfb8938e8e3dc102b284db316b061b2067e2fc2')

_architectures="32:i686-w64-mingw32 64:x86_64-w64-mingw32"


prepare() {
  cd "${srcdir}/boost_${_boostver}"

  # https://svn.boost.org/trac/boost/ticket/7262
  patch -p1 -d libs/context -i "${srcdir}"/context-cross.patch

  # bypass libbacktrace detection
  patch -p1 -d libs/stacktrace -i "${srcdir}"/stacktrace-cross.patch

  # sys/mman.h
  curl -L https://github.com/boostorg/context/pull/217.patch | patch -p2

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
      cxxflags="-D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -O2 -pipe -fno-plt -fexceptions --param=ssp-buffer-size=4 -Wformat -Werror=format-security -fcf-protection" \
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

