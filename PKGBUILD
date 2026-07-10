# Maintainer: Empyrealm <realminc.depravity737@passinbox.com>
pkgname=oa-sdk-git
pkgver=0.7.1
pkgrel=1
pkgdesc="OA SDK — Development headers, CMake configs, and shader sources (git version)"
arch=('x86_64')
url="https://github.com/realminc/oa"
license=('BUSL-1.1')
depends=('oa-git')
# NOTE: `slangc` comes from shader-slang, NOT Arch's `slang` (the S-Lang interpreter).
# Fetch the pinned upstream release, matching OA's CI.
makedepends=('git' 'cmake' 'ninja' 'clang')
_slangver=2026.4.2
source=("git+ssh://git@github.com/realminc/oa.git"
        "slang-${_slangver}-linux-x86_64.tar.gz::https://github.com/shader-slang/slang/releases/download/v${_slangver}/slang-${_slangver}-linux-x86_64.tar.gz")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd oa
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  if [ ! -d "$HOME/.vcpkg/vcpkg" ]; then
    git clone https://github.com/microsoft/vcpkg.git "$HOME/.vcpkg/vcpkg"
    "$HOME/.vcpkg/vcpkg/bootstrap-vcpkg.sh" -disableMetrics
  fi
}

build() {
  cd oa
  cmake -B build -G Ninja \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_CXX_COMPILER=clang++ \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_TOOLCHAIN_FILE="$HOME/.vcpkg/vcpkg/scripts/buildsystems/vcpkg.cmake" \
    -DVCPKG_INSTALLED_DIR="$HOME/.vcpkg/installed" \
    -DSLANGC="$srcdir/bin/slangc" \
    -DOA_EMBED_SHADERS=ON \
    -DOA_BUILD_CRYPTO=ON \
    -DOA_BUILD_SHARED=ON \
    -DOA_BUILD_TESTS=OFF
  ninja -C build -j$(nproc)
}

package() {
  cd oa
  DESTDIR="$pkgdir" cmake --install build --component oa_sdk
}
