# Maintainer: blacktea <blackteahamburger@outlook.com>
# Contributor: kXuan <kxuanobj@gmail.com>
# Contributor: Dan Fuhry <dan@fuhry.com>

pkgname=envoyproxy
pkgver=1.23.0
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
)
sha512sums=('050a2dbae6c0b3666a30331b8abf90d98724e7c1cc287fbdc10418d3cde85bdbd923d1a0d81ea280cccc43cbbf22731577a22fc0003cb57dd438a7fe19444426'
            '248d0903c0aaa680065cdb308068e7f999f2ba7e2ffbc3b743715d2db968858f41cf104c59e1e98d6cda74baea54755e7c9edc29711c3b1daa87d63107ee4017')


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
