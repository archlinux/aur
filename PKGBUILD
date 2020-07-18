# Maintainer: blacktea <blackteahamburger@outlook.com>
# Contributor: kXuan <kxuanobj@gmail.com>

pkgname=envoyproxy
pkgver=1.14.4
pkgrel=1
pkgdesc="A high performance, open source, general RPC framework that puts mobile and HTTP/2 first."
arch=('i686' 'x86_64')
url='https://envoyproxy.io'
license=('Apache2')
makedepends=(
    'bazel'
    'cmake'
    'git'
    'go'
    'java-environment-openjdk'
    'ninja'
    'perl'
    'python'
)
source=(
    "https://github.com/$pkgname/envoy/archive/v$pkgver.tar.gz"
)
sha512sums=('ddec1df1ed09fee3c9299c6d7b8cfb34fb415e9a79b60005761d5a1672fa8ee679d46364ae8de82814c9bda3d76c3b5037f41a413aff051f7198fc8cee8dd977'
)

prepare() {
  cd "envoy-$pkgver"
  go get github.com/bazelbuild/buildtools/buildifier
  bazel --version | cut -d\  -f2 > .bazelversion
  # The commit id of $pkgver
  echo "923c4111bb48405ac96ef050c4f59ebbad3d7761" > SOURCE_VERSION
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
