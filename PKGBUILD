# vim: set sts=2 sw=2 et:
# Maintainer: blacktea <blackteahamburger@outlook.com>
# Contributor: kXuan <kxuanobj@gmail.com>
# Contributor: Dan Fuhry <dan@fuhry.com>

pkgname=envoyproxy
pkgver=1.26.2
pkgrel=1
pkgdesc="A high performance, open source, general RPC framework that puts mobile and HTTP/2 first."
arch=('i686' 'x86_64')
url='https://envoyproxy.io'
license=('Apache2')
makedepends=(
    'cmake'
    'clang'
    'git'
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
)
sha512sums=('12e138851f2f98e4c7f7c9e7e5f8c1198a9a0fc01f31527ff558ec48353f93dba63c36ba61d7a2e865bc5ad5c02c0c7b409683b975e05548210d27cdd60cb2ec'
            '58f7f40a420e1dc7ba845c5349a7596126b4eecc39ca15ebb94fbfe9cd944109318e7577329242164d4dd4ae3a99359723f41dc7265a0334cba06e556c7e8be3')

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
    --config=clang --verbose_failures -c opt \
    --features=-default_compile_flags \
    --copt=-g \
    --copt=-fstack-protector \
    --copt=-fcolor-diagnostics \
    --copt=-D_FORTIFY_SOURCE=1 \
    --copt=-O2 \
    --copt=-DNDEBUG \
    --copt=-ffunction-sections \
    --copt=-fdata-sections \
    --cxxopt=-std=c++17 \
    --host_cxxopt=-std=c++17 \
    --cxxopt='-includecstdint' \
    --host_cxxopt='-includecstdint' \
    --cxxopt='-includestring' \
    --host_cxxopt='-includestring' \
    --cxxopt='-includestring_view' \
    --host_cxxopt='-includestring_view' \
    //source/exe:envoy-static
}

package() {
  cd "envoy-$pkgver"

  install -Dm755 bazel-bin/source/exe/envoy-static "$pkgdir"/usr/bin/envoy
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
