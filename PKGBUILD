# Maintainer: pingplug <pingplug@foxmail.com>
# Contributor: Schala Zeal <schalaalexiazeal@gmail.com>
# Contributor: ant32 <antreimer@gmail.com>
# Contributor: Alexey Pavlov <Alexpux@gmail.com>
# Contributor: Ray Donnelly <mingw.android@gmail.com>

_realname=icu
pkgname=mingw-w64-${_realname}
pkgver=60.2
pkgrel=1
arch=(any)
pkgdesc="International Components for Unicode library (mingw-w64)"
url="http://site.icu-project.org"
license=("custom:icu")
depends=('mingw-w64-crt>=5.0.3.20170801')
makedepends=(mingw-w64-configure)
options=(!buildflags staticlibs !strip !emptydirs)
source=("http://download.icu-project.org/files/icu4c/${pkgver}/icu4c-${pkgver//./_}-src.tgz"
        "https://ssl.icu-project.org/files/icu4c/${pkgver}/icu4c-${pkgver//./_}-src.tgz.asc"
        "0008-data-install-dir.mingw.patch"
        "0010-msys-rules-for-makefiles.mingw.patch"
        "0012-libprefix.mingw.patch"
        "0014-mingwize-pkgdata.mingw.patch"
        "0015-debug.mingw.patch"
        "0016-icu-pkgconfig.patch"
        "0017-icu-config-versioning.patch")
sha256sums=('f073ea8f35b926d70bb33e6577508aa642a8b316a803f11be20af384811db418'
            'SKIP'
            '2038881890542797fe1fe9a384cf2bb6c5504b18fb26eab1368f5cb0e6f7f7af'
            '2adfd968379888d919f0dd4e0379cef7b744ba56d98216b82372ed4cd00a2592'
            '128c21c5dbe0364f82a88c2cefad08fb9020d940c022434ee978fb1d9e1a2fa0'
            'ac63e11e11fb7c849fbeff0a0008a49942a1e19ffe29385aa70248614c7ffd4d'
            'd1745b9d69729cb318cc329847160b50129621f98774a640726a7affd4b2bfd2'
            '8ff9d33de05e34906177ba1ae7ca44c4bab246353919c50f7b201548354602b2'
            'f9c6c5ad51a82b547ca34cbd7903c4f0db4c7f6d08867e7fd54c2bcf8ad8ae56')
validpgpkeys=("9731166CD8E23A83BEE7C6D3ACA5DBE1FD8FABF1")

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd icu
  patch -p1 -i ../0008-data-install-dir.mingw.patch
  patch -p1 -i ../0010-msys-rules-for-makefiles.mingw.patch
  patch -p1 -i ../0012-libprefix.mingw.patch
  patch -p1 -i ../0014-mingwize-pkgdata.mingw.patch
  patch -p1 -i ../0015-debug.mingw.patch
  patch -p1 -i ../0016-icu-pkgconfig.patch
  patch -p1 -i ../0017-icu-config-versioning.patch

  cd source
  autoreconf -fi
}

build() {
  cd icu/source
  mkdir -p nativebuild && pushd nativebuild
  CFLAGS=-fno-stack-protector
  CC=gcc CXX=g++ ../configure --enable-static --disable-shared
  make
  popd
  for _arch in ${_architectures}; do
    mkdir build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --with-cross-build=$PWD/../nativebuild \
      --with-data-packaging=library \
      --disable-rpath \
      --enable-release \
      --disable-tests \
      --disable-samples
    make
    popd
  done
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  for _arch in ${_architectures}; do
    cd "$srcdir/icu/source/build-${_arch}"
    make install DESTDIR="$pkgdir"
    mv "$pkgdir"/usr/${_arch}/lib/*.dll "$pkgdir"/usr/${_arch}/bin
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
    ln -s "/usr/${_arch}/bin/icu-config" "$pkgdir/usr/bin/${_arch}-icu-config"
  done
}
