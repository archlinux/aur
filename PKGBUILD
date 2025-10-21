# vim: set sts=2 sw=2 et:
# Maintainer: blacktea <blackteahamburger@outlook.com>
# Contributor: kXuan <kxuanobj@gmail.com>
# Contributor: Dan Fuhry <dan@fuhry.com>

pkgname=envoyproxy
pkgver=1.36.2
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
sha512sums=('e5521856c5aa2526deca036c556e26e8094da512e731d9e3032116d0bc958a1168cb712bbc0f734bcd32cae8c26561aff6b2bbe781fe31a8ae66a190e3481437'
            '93bcae0f82c89f62efcf1708f6230d316125c5735f16f235cebd998b4360deba1c619fab8dcf21013bde36c267f45d28945232b1e501350190c1a936ab8e2fc0'
            '472607b2392b0f41ff812ded7dd73621bbb664a7c104cda393f4be80787369a651c4cbfcad0515c515ea542451dc45e71e8d4635491f9b23c74f4ea0b51301de'
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
    --config=clang --config=libc++ --verbose_failures -c opt \
    //source/exe:envoy-static
}

package() {
  cd "envoy-$pkgver"

  install -Dm755 bazel-bin/source/exe/envoy-static "$pkgdir"/usr/bin/envoy
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
