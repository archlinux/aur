# Maintainer: kXuan <kxuanobj@gmail.com>

pkgname=envoyproxy
pkgver=1.11.1
pkgrel=1
pkgdesc="A high performance, open source, general RPC framework that puts mobile and HTTP/2 first."
arch=('i686' 'x86_64')
url='https://envoyproxy.io'
license=('Apache2')
makedepends=('bazel' 'cmake' 'git' 'go' 'ninja' 'perl' 'python')
source=(
    "https://github.com/$pkgname/envoy/archive/v$pkgver.tar.gz"
    "0001-bazel-adapt-cc_wraper.py-to-python3-7519.patch"
    "0002-fix-com_github_datadog_dd_opentracing_cpp-build-fail.patch"
)
sha512sums=('128dba4b436e9f54480dd53fc0b9a87d7a3bbb13e8af4935c3b50e0c84f84bdc5a848eb10167e37d955549913734b842f9269a0d947f20637f569ae5eacce999'
            '01ffa67fd8fade4fd1c5d28473fd2f9c2a9734329765f20fb8190bddc51b39c235f72c44e4eadb8eecfd2fe810eeee067c371f1f29e2da530851bbc95d501d73'
            '9cfe6ef8f41082bbfff97842d58b022c34d5e3666786a86c991bec0cb0d9a955eae6343ea0ae53d4245f84082b88847e5d1b2cf1519b99e649b7848673536fff')

prepare() {
  cd "envoy-$pkgver"
  patch --forward --strip=1 --input="${srcdir}/0001-bazel-adapt-cc_wraper.py-to-python3-7519.patch"
  patch --forward --strip=1 --input="${srcdir}/0002-fix-com_github_datadog_dd_opentracing_cpp-build-fail.patch"
  go get github.com/bazelbuild/buildtools/buildifier
  # The commit id of $pkgver
  echo "e349fb6139e4b7a59a9a359be0ea45dd61e589c5" > SOURCE_VERSION
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
