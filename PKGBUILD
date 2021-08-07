# Maintainer: blacktea <blackteahamburger@outlook.com>
# Contributor: kXuan <kxuanobj@gmail.com>

pkgname=envoyproxy
pkgver=1.19.0
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
)
source=(
    "https://github.com/$pkgname/envoy/archive/v$pkgver.tar.gz"
    use_bazelisk.patch
    fix_wee8_build.patch
)
sha512sums=('8a4dd06ce2cf3adc0f81800ff5a228b276686b70bbc41634d12602f22903aa5fd42f6443e1b0b8c9f12304ba7dcf45eea5452bbe8942daf33ba192ac59194327'
            '248d0903c0aaa680065cdb308068e7f999f2ba7e2ffbc3b743715d2db968858f41cf104c59e1e98d6cda74baea54755e7c9edc29711c3b1daa87d63107ee4017'
            'e16e4949c7b66797f85d4e9547f4e47be689c2e3eb320514ba83a2c54f22f860bfc5a729b3be56b89c31336f0e414880d373b5f4d1f8b859710f80da650e9c31')

prepare() {
  cd "envoy-$pkgver"

  patch -Np1 -i ../use_bazelisk.patch
  patch -Np1 -i ../fix_wee8_build.patch

  export GOPATH="$srcdir"/go

  go get github.com/bazelbuild/bazelisk
  export BAZELISK="$GOPATH/bin/bazelisk"

  # https://github.com/envoyproxy/envoy/blob/main/bazel/get_workspace_status
  echo "98c1c9e9a40804b93b074badad1cdf284b47d58b" > SOURCE_VERSION

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
