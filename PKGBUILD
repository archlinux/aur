# Maintainer: kXuan <kxuanobj@gmail.com>

pkgname=envoyproxy
pkgver=1.11.2
pkgrel=1
pkgdesc="A high performance, open source, general RPC framework that puts mobile and HTTP/2 first."
arch=('i686' 'x86_64')
url='https://envoyproxy.io'
license=('Apache2')
makedepends=('bazel' 'cmake' 'git' 'go' 'ninja' 'perl' 'python')
source=(
    "https://github.com/$pkgname/envoy/archive/v$pkgver.tar.gz"
    "0001-Patch-in-ecf04cc-and-49f0fb9-from-gRPC.-7850.patch"
    "0002-bazel-patch-gRPC-to-fix-Envoy-builds-with-glibc-v2.3.patch"
    "0003-fix-com_github_datadog_dd_opentracing_cpp-build-fail.patch"
    "0004-use-python2.patch"
)
sha512sums=('b3605028dbcc54730b372a877df2b8c86ee1c14a3be7c7f42814d00687930936c481bfd576fd924fd167ae4d09fe83e2509d5d739b73deb7c9ac812b1945418e'
            'c2907a1a0b1379c8d46c3989596341e42581bb14f2bc6fcd865ad4ee6ac18ba63df913d9d82622364652f749bb758cf31210ac3fcb823b5dfc6b137ac6685cbc'
            'd39017b7747b74e0e9492637896dded25dd1f28187cb81438e491a23c5520331ca5987357f135c8bfa875abb69d1b4dda73a5c2847614d939c0f87a51537f0ec'
            '9cfe6ef8f41082bbfff97842d58b022c34d5e3666786a86c991bec0cb0d9a955eae6343ea0ae53d4245f84082b88847e5d1b2cf1519b99e649b7848673536fff'
            'a3dc84ab896622f52ffe47b333a90649b49a8fa97d6e10cc06ab691c4dcb8a7e1bf5522f2af93d6e74ca765bb41d33c0ff00a60e6daaa3ee596413ccc298171a')

prepare() {
  cd "envoy-$pkgver"
  for p in "${srcdir}"/*.patch; do
      echo "Apply patch $p"
      patch --forward --strip=1 --input="$p"
  done
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
