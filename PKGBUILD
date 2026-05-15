# vim: set sts=2 sw=2 et:
# Maintainer: blacktea <blackteahamburger@outlook.com>
# Contributor: kXuan <kxuanobj@gmail.com>
# Contributor: Dan Fuhry <dan@fuhry.com>

pkgname=envoyproxy
pkgver=1.38.0
pkgrel=1
pkgdesc="A high performance, open source, general RPC framework that puts mobile and HTTP/2 first."
arch=('i686' 'x86_64')
url='https://envoyproxy.io'
license=('Apache2')
makedepends=(
    'bazelisk'
    'git'
    'ncurses5-compat-libs'
    'lsb-release'
)
source=(
    "https://github.com/$pkgname/envoy/archive/v$pkgver.tar.gz"
)
sha512sums=('a9afec52355104630c088f1c91b8b45993e1c73c9bae7f8afdc614cc2ca3422595dff82c5f0b9c2a2ff356f8f31953d2b570b9c007e0bc64cab1f167d7e3bae7')

prepare() {
  cd "envoy-$pkgver"

  for f in ${source[@]}; do
    # test that "$f" ends in ".patch"
    if [ "${f%.patch}" != "$f" ]; then
      msg "Applying patch: $f"
      patch -Np1 -i "../$f"
    fi
  done

  export GOPATH="$srcdir"/go

  msg "Setting SOURCE_VERSION"
  # https://github.com/envoyproxy/envoy/blob/main/bazel/get_workspace_status
  echo "f1dd21b16c244bda00edfb5ffce577e12d0d2ec2" > SOURCE_VERSION
}

build() {
  cd "envoy-$pkgver"

  /usr/bin/bazelisk build \
    --workspace_status_command bazel/get_workspace_status \
    --config=clang --verbose_failures -c opt \
    //source/exe:envoy-static
}

package() {
  cd "envoy-$pkgver"

  install -Dm755 bazel-bin/source/exe/envoy-static "$pkgdir"/usr/bin/envoy
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
