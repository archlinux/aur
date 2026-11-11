# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from Qwen3.8 Flash Next.

pkgname=zxc
pkgver=1.0.0
pkgrel=1
pkgdesc="Asymmetric lossless compression CLI — ultra-fast decode, 40%+ faster than LZ4 on ARM64 (source build)"
arch=('x86_64' 'aarch64')
url="https://github.com/hellobertrand/zxc"
license=('BSD-3-Clause')
depends=('glibc' 'bash')
makedepends=('cmake' 'gcc')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hellobertrand/zxc/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cec96f983f6ba41e2c95723d27d44698f54e67828a97bfaf1569f5fcdf18180d')

# makepkg's `lto` option appends -flto=auto to CFLAGS and its safe_strip_lto pass
# then runs `strip -R .gnu.lto_*` over installed .a files. Upstream only emits fat
# LTO objects for its own ZXC_ENABLE_LTO switch, so thin objects would lose every
# symbol after stripping in zxc-full. This package ships no .a, but both are built
# without LTO for consistency.
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
  cmake -S "${pkgname}-${pkgver}" -B build \
    "${_common_cmake[@]}" \
    -DZXC_BUILD_CLI=ON \
    -DZXC_INSTALL=OFF
  cmake --build build --parallel
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 "${srcdir}/build/zxc" "${pkgdir}/usr/bin/zxc"

  # unzxc (zxc -d) and zxccat (zxc -dcf): symlinks to zxc, as upstream installs them
  for _alias in unzxc zxccat; do
    ln -s zxc "${pkgdir}/usr/bin/${_alias}"
  done

  # less(1) and grep(1) frontends for .zxc files
  install -Dm755 src/cli/zxcgrep "${pkgdir}/usr/bin/zxcgrep"
  install -Dm755 src/cli/zxcless "${pkgdir}/usr/bin/zxcless"

  install -Dm644 src/cli/zxc.1 "${pkgdir}/usr/share/man/man1/zxc.1"
  for _alias in unzxc zxccat zxcgrep zxcless; do
    ln -s zxc.1 "${pkgdir}/usr/share/man/man1/${_alias}.1"
  done

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 THIRD_PARTY_NOTICES "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_NOTICES"
}
