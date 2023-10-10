# vim: set sts=2 sw=2 et:
# Maintainer: blacktea <blackteahamburger@outlook.com>
# Contributor: kXuan <kxuanobj@gmail.com>
# Contributor: Dan Fuhry <dan@fuhry.com>

pkgname=envoyproxy
pkgver=1.27.0
pkgrel=2
pkgdesc="A high performance, open source, general RPC framework that puts mobile and HTTP/2 first."
arch=('i686' 'x86_64')
url='https://envoyproxy.io'
license=('Apache2')
makedepends=(
    'cmake'
    'clang'
    'git'
    'lld'
    'go'
    'java-environment-openjdk'
    'ninja'
    'llvm'
    'perl'
    'python'
    'libxcrypt-compat'
)
source=(
    "https://github.com/$pkgname/envoy/archive/v$pkgver.tar.gz"
    0001-arch-dynamically-link-libpsl.patch
    0002-luajit-use-correct-make-binary.patch
    0003-close-http-connections-that-prematurely-reset-stream.patch
    0004-limit-http-requests-per-io-cycle.patch
)
sha512sums=('de4d05962413d56f1ffcfe05266d1e3892bb48a6f313dda3dc34a436cec6631220b91a9d624c5f4f09653cf85f9498efec8bf5169ced4e527d55054788c7cc87'
            '58f7f40a420e1dc7ba845c5349a7596126b4eecc39ca15ebb94fbfe9cd944109318e7577329242164d4dd4ae3a99359723f41dc7265a0334cba06e556c7e8be3'
            '905643509ad1998c5bfe6854c97ad13cb1db1d981801876a98ca1c36cc93a63548501dd84e9f310735856095a097122756a68b7d0aea7797ac2e7f3f23d0bc99'
            '9a5de75818a8bf93282328412650c3556d46404b8dcc1d39dc61cbe2148fdbd83363cfd8a146c106c68b98ad00b5907060575e23a3a3dc300597c983d72e5d79'
            'f444701ddc0bf447cc974b87f19b1f8ef3f148b46d727f163cc9bc4a313f21cf719b13dd228843125174f02f444dad975fd7d3017213ac8baefe06c4b41bb6b1')

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

  msg "Building bazelisk"
  go install github.com/bazelbuild/bazelisk@latest
  export BAZELISK="$GOPATH/bin/bazelisk"

  msg "Setting SOURCE_VERSION"
  # https://github.com/envoyproxy/envoy/blob/main/bazel/get_workspace_status
  echo "65a0228c93d2b7ca20c2ec56940735e5b6d76a38" > SOURCE_VERSION

  msg "Setting build environment for Clang"
  ./bazel/setup_clang.sh
}

build() {
  cd "envoy-$pkgver"

  $BAZELISK build \
    --workspace_status_command bazel/get_workspace_status \
    --config=clang --verbose_failures -c opt \
    --features=-default_compile_flags \
    --copt=-g \
    --copt=-fstack-protector \
    --copt=-fcolor-diagnostics \
    --copt=-D_FORTIFY_SOURCE=1 \
    --copt=-O2 \
    --copt=-DNDEBUG \
    --copt=-ffunction-sections \
    --copt=-fdata-sections \
    --cxxopt=-std=c++17 \
    --host_cxxopt=-std=c++17 \
    --cxxopt='-includecstdint' \
    --host_cxxopt='-includecstdint' \
    --cxxopt='-includestring' \
    --host_cxxopt='-includestring' \
    --cxxopt='-includestring_view' \
    --host_cxxopt='-includestring_view' \
    //source/exe:envoy-static
}

package() {
  cd "envoy-$pkgver"

  install -Dm755 bazel-bin/source/exe/envoy-static "$pkgdir"/usr/bin/envoy
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
