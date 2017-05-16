# Maintainer: osfans <waxaca@163.com>
_pkgname=leveldb
pkgname=mingw-w64-${_pkgname}
pkgver=1.18
pkgrel=1
pkgdesc="A fast and lightweight key/value database library (mingw-w64)"
arch=(any)
url="https://github.com/google/leveldb"
license=('MPL')
makedepends=('git' 'mingw-w64-gcc' 'make')
options=(!strip !buildflags staticlibs)
source=("$_pkgname::git+https://github.com/GamerSg/leveldb-mingw.git")
md5sums=('SKIP')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

package() {
  cd "$_pkgname"
  chmod +x build_detect_platform
  sed -i 's/^PLATFORM_.*=$/#\0/' build_detect_platform
  sed -i 's/^PLATFORM_SHARED_.*$/#\0/' build_detect_platform

  for _arch in ${_architectures}; do
    env TARGET_OS=OS_WINDOWS_CROSSCOMPILE \
      CC=$_arch-gcc CXX=$_arch-g++ \
      AR=$_arch-ar LD=$_arch-ld \
      PLATFORM_SHARED_EXT=dll \
      PLATFORM_SHARED_LDFLAGS="-shared -Wl,--out-implib,libleveldb.dll.a -Wl,-soname -Wl," \
      make -j8
    mkdir -p $pkgdir/usr/${_arch}/{lib,bin}
    cp -r include $pkgdir/usr/${_arch}/include
    cp *.a $pkgdir/usr/${_arch}/lib/
    cp *.dll $pkgdir/usr/${_arch}/bin/
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
