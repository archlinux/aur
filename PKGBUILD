# Maintainer:
# Contributor: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname="dwarfs"
pkgname="$_pkgname-git"
pkgver=0.14.0.r0.g35dc3e1
pkgrel=1
pkgdesc="A fast high compression read-only file system"
url="https://github.com/mhx/dwarfs"
license=(
  'MIT'          # read
  'GPL-3.0-only' # write, tests
)
arch=('x86_64')

depends=(
  'libbrotlidec.so' # brotli
  'libbrotlienc.so' # brotli
  'double-conversion'
  'fuse3'
  'gflags'
  'google-glog'
  'libFLAC++.so' # flac
  'libFLAC.so'   # flac
  'libarchive'
  'libboost_chrono.so'          # boost-libs
  'libboost_filesystem.so'      # boost-libs
  'libboost_process.so'         # boost-libs
  'libboost_program_options.so' # boost-libs
  'libfmt.so'                   # fmt
  'lz4'
  'openssl'
  'xxhash'
  'xz'
  'zstd'
)
makedepends=(
  'boost'
  'cmake'
  'git'
  'ninja'
  'nlohmann-json'
  'python'
  'python-mistletoe' # render manpage
  'range-v3'
  'ruby-ronn'
  'utf8cpp'
)
checkdepends=(
  'gtest'
)

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgsrc"
  git submodule update --init --recursive --depth=1
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_INSTALL_SBINDIR='bin'
    -Wno-dev

    -DPREFER_SYSTEM_GTEST=ON
    -DWITH_TESTS=$CHECKFUNC
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

check() {
  local _jobs=$(grep -Pom1 -- '-j\K[0-9]+' <<< "$MAKEFLAGS")
  local _test_opts=(
    --test-dir build
    --output-on-failure
    --parallel ${_jobs:-}
    --verbose

    # some tests may fail
    -E 'categorize|dwarfs_automount|dwarfs_fsname_and_subtype|end_to_end|huge_holes_fuse|mutating_and_error_ops|random_large_files|random_small_files_fuse|timestamps_fuse'
  )
  ctest "${_test_opts[@]}"
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # fix symlink
  ln -sf dwarfs "$pkgdir/usr/bin/mount.dwarfs"

  # license
  install -Dm644 "$_pkgsrc"/LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname/"
}
