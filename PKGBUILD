# vim: set sts=2 sw=2 et:
# Maintainer: blacktea <blackteahamburger@outlook.com>
# Contributor: kXuan <kxuanobj@gmail.com>
# Contributor: Dan Fuhry <dan@fuhry.com>

pkgname=envoyproxy
pkgver=1.32.0
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
sha512sums=('fc77c732bfc52551966a50b6185a4b3fe5eb499193b1e7aed78bef6931343c172cd66df5c9b454f1f535fe91a5750fa65c12fbd1bb14be6fa1944913d34aa988'
            'b34cae6a11d8b7a2c6395cb86331661972040ccba7b4c36a689071d061033ee81f7904cedcdeebfef1eeb9cc571669b62dc71979c002cf71f428544360a7069c'
            'faadcaa5b816dc06f74dcedf4ddef906a68b9509617e543bc63affb2eecd6b1a47e5b108d6c78ae73fc0900a647f7727abdcfaa5a4c1709daaaf3060444877a6'
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


