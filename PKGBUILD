# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from Qwen3.8 Flash Next.

pkgname=zxc-full
pkgver=1.0.0
pkgrel=1
pkgdesc="Asymmetric lossless compression library for ultra-fast decode (development: CLI + C library + headers + CMake — source build)"
arch=('x86_64' 'aarch64')
url="https://github.com/hellobertrand/zxc"
license=('BSD-3-Clause')
depends=('glibc' 'bash')
provides=('zxc')
conflicts=('zxc')
makedepends=('cmake' 'gcc')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hellobertrand/zxc/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cec96f983f6ba41e2c95723d27d44698f54e67828a97bfaf1569f5fcdf18180d')

# makepkg's `lto` option appends -flto=auto to CFLAGS and its safe_strip_lto pass
# then runs `strip -R .gnu.lto_*` over installed .a files. Upstream only emits fat
# LTO objects for its own ZXC_ENABLE_LTO switch, so thin objects would lose every
# symbol after stripping. Build without LTO so the archive keeps its symbols.
_common_cmake=(
  -DCMAKE_BUILD_TYPE=Release
  -DCMAKE_C_FLAGS="$CFLAGS -fno-lto"
  -DCMAKE_C_FLAGS_RELEASE="-O3 -DNDEBUG"
  -DZXC_BUILD_TESTS=OFF
  -DZXC_NATIVE_ARCH=OFF
  -DZXC_ENABLE_LTO=OFF
  -Wno-dev
)

build() {
  cmake -S "zxc-${pkgver}" -B build \
    "${_common_cmake[@]}" \
    -DZXC_BUILD_CLI=ON \
    -DZXC_INSTALL=ON
  cmake --build build --parallel
}

check() {
  # link against the built archive: thin-LTO objects would yield a lib without symbols
  printf '#include <zxc.h>\nint main(void){ return zxc_version_codename()[0] ? 0 : 1; }\n' > "$srcdir/link-test.c"
  gcc -I"$srcdir/zxc-$pkgver/include" "$srcdir/link-test.c" \
      -L"$srcdir/build" -lzxc -pthread -o "$srcdir/link-test"
  "$srcdir/link-test"
}

package() {
  cd "zxc-${pkgver}"
  DESTDIR="${pkgdir}" cmake --install "${srcdir}/build" --prefix /usr

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 THIRD_PARTY_NOTICES "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_NOTICES"
}
