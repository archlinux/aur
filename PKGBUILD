# vim: set sts=2 sw=2 et:
# Maintainer: blacktea <blackteahamburger@outlook.com>
# Contributor: kXuan <kxuanobj@gmail.com>
# Contributor: Dan Fuhry <dan@fuhry.com>

pkgname=envoyproxy
pkgver=1.31.0
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
sha512sums=('8cf270494157745acba02b6d841384d43e6613ad2447a8cf7a6af08d4e623b698b924d73420d52f3bc99d2d2abbe13efe7fe144107a5a921712fcf6494019c8e'
            '0f6edce12009718e9a1aa5314f94c6fc752af0412c767d448c7a003b2b6c95fe545babf9aede539a619daf8ae26ff224de0458ed5d49a1cfd3a0f89888a0755e'
            '0bbbc7f699c68347a0c3ab4f2f8857d6f13346d7d04076cda96c2ff0c04d53807ec1f0f1985662ca0c7f68a0ca81af15b4f436cc4b8d16a442df0a396e11b2a2'
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


