# vim: set sts=2 sw=2 et:
# Maintainer: blacktea <blackteahamburger@outlook.com>
# Contributor: kXuan <kxuanobj@gmail.com>
# Contributor: Dan Fuhry <dan@fuhry.com>

pkgname=envoyproxy
pkgver=1.24.0
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
    use_bazelisk.patch
    0001-arch-dynamically-link-libpsl.patch
)
sha512sums=('7cc0be5cc90550c81bedc537a2f981cd90a1c11c5b5c08a154d8a8c7b87f9d2bd18432291dcbbd3b19df3f4b3c5593b07fe2c33e452e105c4e3a67267a73742a'
            '248d0903c0aaa680065cdb308068e7f999f2ba7e2ffbc3b743715d2db968858f41cf104c59e1e98d6cda74baea54755e7c9edc29711c3b1daa87d63107ee4017'
            '0c5d5afd48ea87c8de030bbdf1a3c525be962983d6c09504599ff4be2dce90d2c98a5351ae34fa883feb8223f82b1e55d97b88cab4f3e1a7efff722dd30afbae')

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
    //source/exe:envoy-static
}

package() {
  cd "envoy-$pkgver"

  install -Dm755 bazel-bin/source/exe/envoy-static "$pkgdir"/usr/bin/envoy
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
