# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=wasm-micro-runtime-git
pkgver=y2019.28.11+2.g89f152cdea
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
  git describe --tags --abbrev=10 | sed 's/^tag-\([0-9]\+\)-\([0-9]\+\)-\([0-9]\+\)-\([0-9]\+\)-g\([0-9a-f]\+\)$/y\3.\2.\1+\4.g\5/g'
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
