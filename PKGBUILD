# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-crypto++
_pkgname=crypto++
pkgver=8.2.0
_srcver=${pkgver//./}
pkgrel=1
pkgdesc="A free C++ class library of cryptographic schemes (mingw-w64)"
arch=('any')
url="https://www.cryptopp.com/"
license=('custom')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake' 'unzip' 'dos2unix')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://www.cryptopp.com/cryptopp${pkgver//./}.zip"
        libcrypto++.pc
        cryptopp-5.6.5-cmake.patch)
sha256sums=('03f0e2242e11b9d19b28d0ec5a3fa8ed5cc7b27640e6bed365744f593e858058'
            '5d1ad79b050553cc1b2d5e2a9a4946e24afa4f4ced8d57aed74eadfdfb97d671'
            '2c588cb085749b76adc28be5075b4978c8822f1e0327ccc06d823a1d436f56e9')
noextract=(cryptopp${pkgver//./}.zip)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"


prepare() {
  [[ -d ${srcdir}/cryptopp ]] && rm -rf ${srcdir}/cryptopp
  unzip ${srcdir}/cryptopp${pkgver//./}.zip -d ${srcdir}/cryptopp

  cd ${srcdir}/cryptopp
  find . -type f -exec dos2unix {} \;
  sed -i -e 's/^CXXFLAGS/#CXXFLAGS/' GNUmakefile
  patch -p1 -i ${srcdir}/cryptopp-5.6.5-cmake.patch
}

build() { 
  cd "${srcdir}/cryptopp"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DDISABLE_SSSE3=ON \
      -DDISABLE_ASM=ON \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/cryptopp/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    
    # pkgconfig file
    mkdir -p "${pkgdir}/usr/${_arch}/lib/pkgconfig"
    install -m644 "${srcdir}/libcrypto++.pc" "${pkgdir}/usr/${_arch}/lib/pkgconfig/libcrypto++.pc"
    sed -s "s|@PREFIX@|/usr/${_arch}|g" -i "${pkgdir}/usr/${_arch}/lib/pkgconfig/libcrypto++.pc"
    sed -s "s|@VERSION@|${pkgver}|g" -i "${pkgdir}/usr/${_arch}/lib/pkgconfig/libcrypto++.pc"

    # Remove cryptest.exe and test files, only needed for check() and bloats the package
    # because cryptest.exe is linked statically.
    rm "${pkgdir}/usr/${_arch}/bin/cryptest.exe"
    rm -rf "${pkgdir}/usr/${_arch}/share"
    
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
