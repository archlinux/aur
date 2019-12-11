# Maintainer: kXuan <kxuanobj@gmail.com>

pkgname=envoyproxy
pkgver=1.12.2
pkgrel=1
pkgdesc="A high performance, open source, general RPC framework that puts mobile and HTTP/2 first."
arch=('i686' 'x86_64')
url='https://envoyproxy.io'
license=('Apache2')
makedepends=('bazel' 'cmake' 'git' 'go' 'ninja' 'perl' 'python')
source=(
    "https://github.com/$pkgname/envoy/archive/v$pkgver.tar.gz"
)
sha512sums=('883f6b27929d1807d968f8ba97b6931dbbe60ba2761e1af663ed7839889c153c6410867883bc97ba481f40162ea96e66f9505b042cd6ae6dacece653513e0e43')

prepare() {
  cd "envoy-$pkgver"
#  for p in "${srcdir}"/*.patch; do
#      echo "Apply patch $p"
#      patch --forward --strip=1 --input="$p"
#  done
  go get github.com/bazelbuild/buildtools/buildifier
  # The commit id of $pkgver
  echo "44f8c365a1f1798f0af776f6aa64279dc68f5666" > SOURCE_VERSION
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
