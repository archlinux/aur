# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=wasm-micro-runtime-git
pkgver=r89.4456ff89d8
pkgrel=1
pkgdesc="Standalone WebAssembly (WASM) runtime with small footprint"
arch=(x86_64)
url="https://github.com/intel/wasm-micro-runtime"
license=(Apache)
depends=(gcc-libs lld)
source=("git+$url")
sha256sums=('SKIP')
provides=(wasm-micro-runtime)
conflicts=(wasm-micro-runtime)

pkgver() {
  cd wasm-micro-runtime
  printf 'r%d.%s' \
    $(git rev-list --count HEAD) \
    $(git rev-parse --short=10 HEAD)
}

prepare() {
  if [ -d build ]
  then
    msg2 "Build dir already exist; doing an incremental build"
    msg2 "If you want to do a clean build, please delete $(realpath build)"
    return
  fi

  cmake \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -S wasm-micro-runtime/core/iwasm/products/linux/ -B build/
}

build() {
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
