# Maintainer: kXuan <kxuanobj@gmail.com>

pkgname=envoyproxy
pkgver=1.11.0
pkgrel=1
pkgdesc="A high performance, open source, general RPC framework that puts mobile and HTTP/2 first."
arch=('i686' 'x86_64')
url='https://envoyproxy.io'
license=('Apache2')
makedepends=('cmake' 'go' 'bazel' 'perl' 'ninja' 'python' 'git')
source=(
    "https://github.com/$pkgname/envoy/archive/v$pkgver.tar.gz"
    "0001-bazel-adapt-cc_wraper.py-to-python3-7519.patch"
    "0002-fix-com_github_datadog_dd_opentracing_cpp-build-fail.patch"
)
sha512sums=('aebee8e446f673aef0536c06d624cc7a011d32e7e0d6c313e43e11660146412731a597764edfaf3a32db4894831e9412c87cf6b734ce0f0b3f80799aa6691820'
            '01ffa67fd8fade4fd1c5d28473fd2f9c2a9734329765f20fb8190bddc51b39c235f72c44e4eadb8eecfd2fe810eeee067c371f1f29e2da530851bbc95d501d73'
            '9cfe6ef8f41082bbfff97842d58b022c34d5e3666786a86c991bec0cb0d9a955eae6343ea0ae53d4245f84082b88847e5d1b2cf1519b99e649b7848673536fff')

prepare() {
  cd "envoy-$pkgver"
  patch --forward --strip=1 --input="${srcdir}/0001-bazel-adapt-cc_wraper.py-to-python3-7519.patch"
  patch --forward --strip=1 --input="${srcdir}/0002-fix-com_github_datadog_dd_opentracing_cpp-build-fail.patch"
  go get github.com/bazelbuild/buildtools/buildifier
  # The commit id of $pkgver
  echo "bf169f9d3c8f4c682650c5390c088a4898940913" > SOURCE_VERSION
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
