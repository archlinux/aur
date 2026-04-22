# Maintainer: ponies <ponies@ponies.top>

pkgname=fex-emu-wine-git
_tag=FEX-2603
pkgver=2603.r0.g9eb639e89
pkgrel=1
pkgdesc="FEX DLLs for enabling Wine's ARM64EC support (Version 2603)"
arch=('aarch64')
url="https://fex-emu.com"
license=('MIT')
makedepends=('git' 'cmake' 'clang' 'lld' 'ninja' 'python')
provides=('fex-emu-wine')
conflicts=('fex-emu-wine')

source=(
  "FEX::git+https://github.com/FEX-Emu/FEX.git#tag=${_tag}"
  "https://github.com/bylaws/llvm-mingw/releases/download/20250920/llvm-mingw-20250920-ucrt-ubuntu-22.04-aarch64.tar.xz"
)

sha256sums=(
  'SKIP'
  'bce5cc755c613515fd44e1ee9523123d854103abae147571adb645450036274d'
)

pkgver() {
  cd FEX
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^FEX\.//'
}

prepare() {
  cd FEX
  git submodule update --init --recursive
}

build() {

  local mingw_bin="${srcdir}/llvm-mingw-20250920-ucrt-ubuntu-22.04-aarch64/bin"
  export PATH="${mingw_bin}:$PATH"

  export CFLAGS="-O3 -g -pipe -Wall -Wextra"
  export CXXFLAGS="$CFLAGS"
  export LDFLAGS="-Wl,--gc-sections -static"

  echo "Building ARM64EC variant..."

  mkdir -p "${srcdir}/build-arm64ec"
  cd "${srcdir}/build-arm64ec"

  cmake -GNinja "${srcdir}/FEX" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib/wine/aarch64-windows \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_TOOLCHAIN_FILE="${srcdir}/FEX/Data/CMake/toolchain_mingw.cmake" \
    -DMINGW_TRIPLE=arm64ec-w64-mingw32 \
    -DENABLE_LTO=OFF \
    -DBUILD_TESTING=OFF \
    -DENABLE_ASSERTIONS=OFF \
    -DCMAKE_DISABLE_FIND_PACKAGE_fmt=ON

  sed -i 's/arm64ec-w64-mingw32-dlltool/llvm-dlltool -m arm64ec/g' build.ninja
  ninja

  echo "Building WOW64 variant..."

  mkdir -p "${srcdir}/build-wow64"
  cd "${srcdir}/build-wow64"

  cmake -GNinja "${srcdir}/FEX" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib/wine/aarch64-windows \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_TOOLCHAIN_FILE="${srcdir}/FEX/Data/CMake/toolchain_mingw.cmake" \
    -DMINGW_TRIPLE=aarch64-w64-mingw32 \
    -DENABLE_LTO=OFF \
    -DBUILD_TESTING=OFF \
    -DCMAKE_DISABLE_FIND_PACKAGE_fmt=ON

  sed -i 's/aarch64-w64-mingw32-dlltool/llvm-dlltool -m arm64/g' build.ninja
  ninja
}

package() {

  cd "${srcdir}/build-arm64ec"
  DESTDIR="$pkgdir" ninja install

  cd "${srcdir}/build-wow64"
  DESTDIR="$pkgdir" ninja install

  # We only want the DLLs for the Wine bridge, not the headers or extra data
  rm -rf "$pkgdir/usr/include"
  rm -rf "$pkgdir/usr/share/fex-emu"
  rm -rf "$pkgdir/usr/share/man"

  # Install license
  install -Dm644 "$srcdir/FEX/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
