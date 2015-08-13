# Contributor: Daniel Kirchner <daniel@ekpyron.org>

pkgname=mingw-w64-boost
pkgver=1.59.0
_boostver=${pkgver//./_}
pkgrel=1
pkgdesc="Free peer-reviewed portable C++ source libraries (mingw-w64)"
arch=('any')
url="http://www.boost.org/"
license=('custom')
depends=('mingw-w64-crt' 'mingw-w64-zlib' 'mingw-w64-bzip2')
makedepends=('mingw-w64-gcc' 'bzip2' 'zlib' 'python2')
options=(!strip !buildflags staticlibs)
source=("http://downloads.sourceforge.net/boost/boost/${pkgver}/boost_${_boostver}.tar.bz2" boost-mingw.patch)
md5sums=('6aa9a5c6a4ca1016edd0ed1178e3cb87'
         '01f5f0d6b915d3b04dbabfd6db40f1e9')

_architectures="32:i686-w64-mingw32 64:x86_64-w64-mingw32"


prepare() {
  cd "${srcdir}/boost_${_boostver}"

  # https://svn.boost.org/trac/boost/ticket/7262
  patch -Np0 -i "${srcdir}"/boost-mingw.patch

  # disabled context, coroutine: https://github.com/boostorg/context/issues/16

  # disabled serialization: http://lists.boost.org/Archives/boost/2015/07/224242.php

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
      --without-python \
      --without-mpi --without-graph_parallel \
      --without-context --without-coroutine --without-coroutine2 \
      --without-serialization \
      cxxflags="-std=c++11 -O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4" \
      address-model=${_arch:0:2} \
      architecture=x86 \
      binary-format=pe \
      ${MAKEFLAGS} \
      --layout=tagged install
    install -d $pkgdir/usr/${_arch:3}/bin
    mv "$pkgdir"/usr/${_arch:3}/lib/*.dll "$pkgdir"/usr/${_arch:3}/bin
    ${_arch:3}-strip --strip-unneeded "$pkgdir"/usr/${_arch:3}/bin/*.dll
    ${_arch:3}-strip -g "$pkgdir"/usr/${_arch:3}/lib/*.a
    popd
  done
  install -Dm644 "${srcdir}"/boost_${_boostver}/LICENSE_1_0.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE_1_0.txt
}

