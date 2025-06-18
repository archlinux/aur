# vim: set sts=2 sw=2 et:
# Maintainer: blacktea <blackteahamburger@outlook.com>
# Contributor: kXuan <kxuanobj@gmail.com>
# Contributor: Dan Fuhry <dan@fuhry.com>

pkgname=envoyproxy
pkgver=1.34.1
pkgrel=1
pkgdesc="A high performance, open source, general RPC framework that puts mobile and HTTP/2 first."
arch=('i686' 'x86_64')
url='https://envoyproxy.io'
license=('Apache2')
_llvmver=18
makedepends=(
    'cmake'
    'git'
    'lld'
    'go'
    'java-environment-openjdk'
    'ninja'
    'perl'
    'python'
    'libxcrypt-compat'
    "clang${_llvmver}"
    "libc++${_llvmver}"
    "llvm${_llvmver}"
)
source=(
    "https://github.com/$pkgname/envoy/archive/v$pkgver.tar.gz"
    0001-arch-dynamically-link-libpsl.patch
    0002-stats-thread_local_cache-thread-safety.patch
    0003-disable-thread-safety-analysis-for-file-system-http.patch
)
sha512sums=('8e99b6934e3d53945ca19a466176825aaabb342c7ec9891a18e18513b7371773cbd53a1b7ea467478b89ebb64b71dc5b95e50b54fd3942a4c546017fa893b3d0'
            'ad0e9b86552c85f23fa28a54a07f686d2acfb929d6218668ec147f26d5cfe8f7778fd12e332e22216247c7ed42d8227855ee1a514e4af90af4689aacb8ce7b35'
            'cde218638527bc17f765c722a9c9197d51a8ce0acdfabab887d8fb02541d47d0fed28b6f3db7ceb9aa68dc11152b11209d084b54f39f3780c11f9f888b1a3dbb'
            '81b63af4585b5d7d392c5315f0cf125ab5df6fc0c2a3165446f9a5d5803c1ab03a6d7047997c7dc16b1fa838ad44b0021863c1910ab73f365d5722d3a8e314da')

prepare() {
  cd "envoy-$pkgver"

  for f in ${source[@]}; do
    # test that "$f" ends in ".patch"
    if [ "${f%.patch}" != "$f" ]; then
      msg "Applying patch: $f"
      patch -Np1 -i "../$f"
    fi
  done

  export GOPATH="$srcdir"/go

  msg "Building bazelisk"
  go install github.com/bazelbuild/bazelisk@latest
  export BAZELISK="$GOPATH/bin/bazelisk"

  msg "Setting SOURCE_VERSION"
  # https://github.com/envoyproxy/envoy/blob/main/bazel/get_workspace_status
  echo "65a0228c93d2b7ca20c2ec56940735e5b6d76a38" > SOURCE_VERSION

  msg "Setting build environment for Clang"
  ./bazel/setup_clang.sh "/usr/lib/llvm${_llvmver}"

  echo "build:libc++ --action_env=CXXFLAGS=-stdlib=libc++:-fPIC" > user.bazelrc
  echo "build:libc++ --action_env=LDFLAGS=-stdlib=libc++:-L/usr/lib/llvm${_llvmver}/lib" >> user.bazelrc
  echo "build:libc++ --action_env=BAZEL_LINKLIBS=-L/usr/lib/llvm${_llvmver}/lib:-l%:libc++.a:-l%:libc++abi.a" >> user.bazelrc
}

build() {
  cd "envoy-$pkgver"

  $BAZELISK build \
    --workspace_status_command bazel/get_workspace_status \
    --config=libc++ --verbose_failures -c opt \
    //source/exe:envoy-static
}

package() {
  cd "envoy-$pkgver"

  install -Dm755 bazel-bin/source/exe/envoy-static "$pkgdir"/usr/bin/envoy
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
