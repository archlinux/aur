# Maintainer: kXuan <kxuanobj@gmail.com>

pkgname=envoyproxy
pkgver=1.8.0
pkgrel=1
pkgdesc="A high performance, open source, general RPC framework that puts mobile and HTTP/2 first."
arch=('i686' 'x86_64')
url='https://envoyproxy.io'
license=('Apache2')
makedepends=('cmake' 'clang' 'go' 'bazel' 'perl' 'ninja' 'python')
source=(
    https://github.com/$pkgname/envoy/archive/v$pkgver.tar.gz
)
sha512sums=('728794f755b85e2a01b79342156953deade38c34a565e538928cb669a17658af01b69488a0e966b4774bba6d30fa2d460e3329f80503a3de1f8669225bf4426b')

prepare() {
  cd "envoy-$pkgver"
  go get github.com/bazelbuild/buildtools/buildifier
  echo "5d25f466c3410c0dfa735d7d4358beb76b2da507" > SOURCE_VERSION
}

build() {
  cd "envoy-$pkgver"

  bazel build --verbose_failures --workspace_status_command bazel/get_workspace_status  //source/exe:envoy-static
}

package() {
  cd "envoy-$pkgver"

  install -Dm755 bazel-bin/source/exe/envoy-static "$pkgdir"/usr/bin/envoy
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
