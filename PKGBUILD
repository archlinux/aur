# Maintainer: kXuan <kxuanobj@gmail.com>

pkgname=envoyproxy
pkgver=1.12.1
pkgrel=1
pkgdesc="A high performance, open source, general RPC framework that puts mobile and HTTP/2 first."
arch=('i686' 'x86_64')
url='https://envoyproxy.io'
license=('Apache2')
makedepends=('bazel' 'cmake' 'git' 'go' 'ninja' 'perl' 'python')
source=(
    "https://github.com/$pkgname/envoy/archive/v$pkgver.tar.gz"
)
sha512sums=('5308d8b46b6ff64aa2d6665878c67eda99af16fbb8f93cd93547d1a898108c9d8d171bfd10fa555a8c4b9bd7860b168dde5d6f85659bf5017b8f37e121c53d95')

prepare() {
  cd "envoy-$pkgver"
#  for p in "${srcdir}"/*.patch; do
#      echo "Apply patch $p"
#      patch --forward --strip=1 --input="$p"
#  done
  go get github.com/bazelbuild/buildtools/buildifier
  # The commit id of $pkgver
  echo "7a12f379e47a9f7cf7211c727fe8fc70b6a0a9ab" > SOURCE_VERSION
}

build() {
  cd "envoy-$pkgver"

  bazel build --verbose_failures --workspace_status_command bazel/get_workspace_status -c opt //source/exe:envoy-static
}

package() {
  cd "envoy-$pkgver"

  install -Dm755 bazel-bin/source/exe/envoy-static "$pkgdir"/usr/bin/envoy
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
