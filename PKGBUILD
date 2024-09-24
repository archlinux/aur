# vim: set sts=2 sw=2 et:
# Maintainer: blacktea <blackteahamburger@outlook.com>
# Contributor: kXuan <kxuanobj@gmail.com>
# Contributor: Dan Fuhry <dan@fuhry.com>

pkgname=envoyproxy
pkgver=1.31.2
pkgrel=1
pkgdesc="A high performance, open source, general RPC framework that puts mobile and HTTP/2 first."
arch=('i686' 'x86_64')
url='https://envoyproxy.io'
license=('Apache2')
makedepends=(
    'cmake'
    'clang'
    'git'
    'libc++'
    'lld'
    'go'
    'java-environment-openjdk'
    'ninja'
    'llvm'
    'perl'
    'python'
    'libxcrypt-compat'
)
source=(
    "https://github.com/$pkgname/envoy/archive/v$pkgver.tar.gz"
    0001-arch-dynamically-link-libpsl.patch
    0002-tcmalloc-hold-pageheap_lock-for-info-accessor.patch
    0003-stats-thread_local_cache-thread-safety.patch
    0004-disable-thread-safety-analysis-for-file-system-http.patch
)
sha512sums=('55b690b9d5db47214b8e7cb876628c14be67699454f5e29cd87c7f41f1100fa66b2ffd2ecaf6c1ef7d758b7b09891a11687616c503780ae40bab17b033d7d6ea'
            '0f6edce12009718e9a1aa5314f94c6fc752af0412c767d448c7a003b2b6c95fe545babf9aede539a619daf8ae26ff224de0458ed5d49a1cfd3a0f89888a0755e'
            '99bf9b7eb348fa98ffa0b6b5dad51dc45d5b9655ca6f85a1a580afd4081e00a2e40c46b64c878a7a1cddf3e3a1926bafae6be81257bccc62599f4d92763d6643'
            '0df61310fcfa57fc5558547f7fada729739c7b62f796f8227bc1afd09d87306d0cb0b68371865597afadc6d92fd269a41a4802ba370e8257f3308e766072417e'
            'db18337fc39fb82b6bc08b304ffd736ccfeeab42a76922ddbf8e6c596d74397368c5dc77951663062e7dbadc4d24b89dc09bf112228105ede183a7215dee3abd')

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
  ./bazel/setup_clang.sh
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


