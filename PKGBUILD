# Maintainer: kXuan <kxuanobj@gmail.com>

pkgname=envoyproxy
pkgver=1.13.0
pkgrel=2
pkgdesc="A high performance, open source, general RPC framework that puts mobile and HTTP/2 first."
arch=('i686' 'x86_64')
url='https://envoyproxy.io'
license=('Apache2')
makedepends=('bazel' 'cmake' 'git' 'go' 'ninja' 'perl' 'python')
source=(
    "https://github.com/$pkgname/envoy/archive/v$pkgver.tar.gz"
    "0001-aur-fix-bazelversion-to-2.1.0.patch"
)
sha512sums=('64d0d523903bbcdc30beea89bc130c91a1bf168f6a2fbab4e191c693d0b8c02da06a3725cd53bb70650e16b44884004c468f5c0e20135cf4214c36eb60a62b90'
'SKIP')

prepare() {
  cd "envoy-$pkgver"
  for p in "${srcdir}"/*.patch; do
      echo "Apply patch $p"
      patch --forward --strip=1 --input="$p"
  done
  go get github.com/bazelbuild/buildtools/buildifier
  # The commit id of $pkgver
  echo "bb7ceff4c3c5bd4555dff28b6e56d27f2f8be0a7" > SOURCE_VERSION
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
