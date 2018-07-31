# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-crypto++
_pkgname=crypto++
pkgver=7.0.0
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
        cryptopp-5.6.5-cmake.patch
        fix-test-linking.patch)
sha256sums=('a4bc939910edd3d29fb819a6fc0dfdc293f686fa62326f61c56d72d0a366ceb0'
            'baea2372d9f490fa79d0431cd4f8eea515501b5553c6b4ed4a1cbbf3879ca5f3'
            '0486178005a7fe8a0659f59d3c4fafafa39d870f6e9f812bcf9131ce4758c914'
            '99e5bb3ba211c6155a19a170b7e498b904bf821f7d2aa46be06d08a87846fa17')
noextract=(cryptopp${pkgver//./}.zip)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"


prepare() {
  cd ${srcdir}
  unzip cryptopp${pkgver//./}.zip -d ${_pkgname}

  cd ${_pkgname}
  find . -type f -exec dos2unix {} \;
  sed -i -e 's/^CXXFLAGS/#CXXFLAGS/' GNUmakefile
  patch -p1 -i ${srcdir}/cryptopp-5.6.5-cmake.patch
  patch -p1 -i ${srcdir}/fix-test-linking.patch
}

build() { 
  cd "${srcdir}/${_pkgname}/"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DDISABLE_SSSE3=ON \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${_pkgname}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    
    # pkgconfig file
    mkdir -p "${pkgdir}/usr/${_arch}/lib/pkgconfig"
    install -m644 "${srcdir}/libcrypto++.pc" "${pkgdir}/usr/${_arch}/lib/pkgconfig/libcrypto++.pc"
    sed -s "s|/usr|/usr/${_arch}|g" -i "${pkgdir}/usr/${_arch}/lib/pkgconfig/libcrypto++.pc"
    
    # Remove cryptest.exe and test files, only needed for check() and bloats the package
    # because cryptest.exe is linked statically.
    rm "${pkgdir}/usr/${_arch}/bin/cryptest.exe"
    rm -rf "${pkgdir}/usr/${_arch}/share"
    
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
