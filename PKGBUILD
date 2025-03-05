# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=3fs
pkgver=0.1.5.r37.g49e0ad5
pkgrel=1
pkgdesc='Fire-Flyer File System (3FS).'
arch=('x86_64')
url='https://github.com/deepseek-ai/3fs'
license=('MIT')
groups=('deepseek')
depends=('foundationdb-server-bin' 'fuse3')
makedepends=('clang' 'cmake' 'git' 'ninja' 'rust')
optdepends=()
source=("$pkgname::git+$url.git"
        'git+https://github.com/google/googletest.git'
        'git+https://github.com/facebook/folly.git'
        'git+https://github.com/google/leveldb.git'
        'git+https://github.com/facebook/rocksdb.git'
        'git+https://github.com/eliaskosunen/scnlib.git'
        'git+https://github.com/pybind/pybind11.git'
        'git+https://github.com/ClickHouse/clickhouse-cpp.git'
        'git+https://github.com/fmtlib/fmt.git'
        'git+https://github.com/ToruNiina/toml11.git'
        'git+https://github.com/jemalloc/jemalloc.git'
        'git+https://github.com/microsoft/mimalloc.git'
        'git+https://github.com/facebook/zstd.git'
        'git+https://github.com/axboe/liburing.git'
        'git+https://github.com/google/gtest-parallel.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "$pkgname"
  git tag -f 0.1.5 815e55e
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  sed -i '/set(CLANG_FORMAT/d' cmake/CLangFormat.cmake

  git submodule init
  for repo in ${repos[@]}; do
    git config "submodule.third_party/${repo}.url" "$srcdir/third_party/${repo}"
  done
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$pkgname"
  cmake -S . -B build -G Ninja \
      -DCMAKE_BUILD_TYPE=RelWithDebInfo \
      -DCMAKE_CXX_COMPILER=clang++ \
      -DCMAKE_C_COMPILER=clang \
      -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
      -DCLANG_FORMAT=clang-format
  cmake --build build
}

package() {
  cd "$pkgname"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cmake --install build --prefix "$pkgdir"
}
