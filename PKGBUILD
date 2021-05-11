# Maintainer: blacktea <blackteahamburger@outlook.com>
# Contributor: kXuan <kxuanobj@gmail.com>

pkgname=envoyproxy
pkgver=1.18.2
pkgrel=1
pkgdesc="A high performance, open source, general RPC framework that puts mobile and HTTP/2 first."
arch=('i686' 'x86_64')
url='https://envoyproxy.io'
license=('Apache2')
makedepends=(
    'cmake'
    'clang'
    'git'
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
sha512sums=('374db0b0efb54d9ce83bf56efcaa509e46dba8624df7b91fea3e8533591f4d656250950dc358f5b22b6e770dfdc8268816dc0a0bec189f85ff00ebe803b9fe1e'
            '248d0903c0aaa680065cdb308068e7f999f2ba7e2ffbc3b743715d2db968858f41cf104c59e1e98d6cda74baea54755e7c9edc29711c3b1daa87d63107ee4017')

prepare() {
  cd "envoy-$pkgver"

  patch -Np1 -i ../use_bazelisk.patch

  export GOPATH="$srcdir"/go

  go get github.com/bazelbuild/bazelisk
  export BAZELISK="$GOPATH/bin/bazelisk"

  ./bazel/setup_clang.sh
}

build() {
  cd "envoy-$pkgver"

  $BAZELISK build --config=clang --verbose_failures -c opt //source/exe:envoy-static
}

package() {
  cd "envoy-$pkgver"

  install -Dm755 bazel-bin/source/exe/envoy-static "$pkgdir"/usr/bin/envoy
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
