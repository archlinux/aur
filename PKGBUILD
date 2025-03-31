# vim: set sts=2 sw=2 et:
# Maintainer: blacktea <blackteahamburger@outlook.com>
# Contributor: kXuan <kxuanobj@gmail.com>
# Contributor: Dan Fuhry <dan@fuhry.com>

pkgname=envoyproxy
pkgver=1.33.2
pkgrel=1
pkgdesc="A high performance, open source, general RPC framework that puts mobile and HTTP/2 first."
arch=('i686' 'x86_64')
url='https://envoyproxy.io'
license=('Apache2')
_llvmver=14
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
    0002-tcmalloc-hold-pageheap_lock-for-info-accessor.patch
    0003-stats-thread_local_cache-thread-safety.patch
    0004-disable-thread-safety-analysis-for-file-system-http.patch
)
sha512sums=('e11a59221f4e49afb5986a138df3dfd9e65b9320ffe527acb513ba58280497e174da1dee748d8ddf27411e1a03e5c09d9bc51f04f9d4ca0a8aa0205a51bb2675'
            '68b382fd3356a682269d1ac009059a7de115c7b8a8a249735e26439e7396c94a9cd8cbad4c1285c7ae5b7d8234decadffead237bae3ea7a2c9057479a5e49a66'
            '5f1cc17945f4545f0975821af73a9d04d7f27c21c4e1f466eac532ced037d68729803bdb48718204872fb9943c82c0f30211c109ad2af436ed7f4c71d65014ca'
            '0df61310fcfa57fc5558547f7fada729739c7b62f796f8227bc1afd09d87306d0cb0b68371865597afadc6d92fd269a41a4802ba370e8257f3308e766072417e'
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
