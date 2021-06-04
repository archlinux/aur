# Maintainer: blacktea <blackteahamburger@outlook.com>
# Contributor: kXuan <kxuanobj@gmail.com>

pkgname=envoyproxy
pkgver=1.18.3
pkgrel=2
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
)
sha512sums=('1d24ddd3ead66a5eff890771e43514b200f9a40a159bbdb02262488d65bb31b08a4fccfb0c20a5d8078ef4797b9a04176f5b3d4cdd437a252ece6a7aee579eb2'
            '248d0903c0aaa680065cdb308068e7f999f2ba7e2ffbc3b743715d2db968858f41cf104c59e1e98d6cda74baea54755e7c9edc29711c3b1daa87d63107ee4017')

prepare() {
  cd "envoy-$pkgver"

  patch -Np1 -i ../use_bazelisk.patch

  export GOPATH="$srcdir"/go

  go get github.com/bazelbuild/bazelisk
  export BAZELISK="$GOPATH/bin/bazelisk"

  # https://github.com/envoyproxy/envoy/blob/main/bazel/get_workspace_status
  echo "98c1c9e9a40804b93b074badad1cdf284b47d58b" > SOURCE_VERSION

  ./bazel/setup_clang.sh
}

build() {
  cd "envoy-$pkgver"

  $BAZELISK build --workspace_status_command bazel/get_workspace_status --config=clang --verbose_failures -c opt //source/exe:envoy-static
}

package() {
  cd "envoy-$pkgver"

  install -Dm755 bazel-bin/source/exe/envoy-static "$pkgdir"/usr/bin/envoy
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
