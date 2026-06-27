pkgname=rdopng-git
pkgver=1.0.9.11.gdb77a33
pkgrel=1
pkgdesc="Rate-Distortion Optimized Lossy PNG/QOI Encoding Tool"
arch=('x86_64')
url="https://github.com/richgel999/rdopng"
license=('Apache-2.0')
makedepends=('git' 'cmake' 'make')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/rdopng"
  git describe --tags --long 2>/dev/null | sed 's/^v//;s/-/./g' || \
    printf "0.0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/rdopng"

  local _cflags="-O3 -march=native -mtune=native \
    -funroll-loops -falign-functions=32 -falign-loops=32 \
    -fno-math-errno -fno-trapping-math \
    -fno-semantic-interposition -Wall -pipe \
    -fomit-frame-pointer -fno-plt -flto"

  local _cxxflags="-O3 -march=native -mtune=native \
    -funroll-loops -falign-functions=32 -falign-loops=32 \
    -fno-math-errno -fno-trapping-math \
    -fno-semantic-interposition -Wall -pipe \
    -fomit-frame-pointer -fno-plt -flto"

  local _ldflags="-fno-plt -flto"

  cmake . \
    -DCMAKE_C_FLAGS="${_cflags}" \
    -DCMAKE_CXX_FLAGS="${_cxxflags}" \
    -DCMAKE_EXE_LINKER_FLAGS="${_ldflags}"

  make -j"$(nproc)"
}

package() {
  cd "${srcdir}/rdopng"

  install -Dm755 "bin/rdopng" "${pkgdir}/usr/bin/rdopng"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
