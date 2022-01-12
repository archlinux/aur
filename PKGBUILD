# Maintainer: blacktea <blackteahamburger@outlook.com>
# Contributor: kXuan <kxuanobj@gmail.com>
# Contributor: Dan Fuhry <dan@fuhry.com>

pkgname=envoyproxy
pkgver=1.20.1
pkgrel=1
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
)
source=(
    "https://github.com/$pkgname/envoy/archive/v$pkgver.tar.gz"
    use_bazelisk.patch
    fix_wee8_build.patch
    add-extra-wee8-patch.patch
    wee8-jinja2-python-collections.patch
    remove-deprecated-copy-constructor.patch
)
sha512sums=('67ecdbf0c136b95c6fdb15b5d8ba7828a814b0c9c584ed194a0488cd1948955603b1bd122951901a8c73b2dd27f86b7384237b3ef08035c137bf7a5fc5f1bf70'
            '248d0903c0aaa680065cdb308068e7f999f2ba7e2ffbc3b743715d2db968858f41cf104c59e1e98d6cda74baea54755e7c9edc29711c3b1daa87d63107ee4017'
            'e16e4949c7b66797f85d4e9547f4e47be689c2e3eb320514ba83a2c54f22f860bfc5a729b3be56b89c31336f0e414880d373b5f4d1f8b859710f80da650e9c31'
            'f10a18f829cc9bf99b9fdfa149b6881dd882fc78adb189de3c6bacebfe39c9db085186f0e2eeba7a1f9d64e0e7d4a524f42966bc637d9fe101a630f59fbb56a5'
            '53518bb0711d5abc7c6fe9dfb9f4e2c2c279b2082bfdaecf24be3bf1177aa78abf4407ca9699632825ab670056d20a587ae34bb982227332037185d7cad5b193'
            '650d3b9ee7456c1695d60721ccea183fca9b7ed9b3fcc2c85aaca95c0c18dcf67c5e39a4955b00ee1f8de20e7b75e66e9f3ae90020b590fdb8712f9089652246')

prepare() {
  cd "envoy-$pkgver"

  patch -Np1 -i ../use_bazelisk.patch
  patch -Np1 -i ../fix_wee8_build.patch
  patch -Np1 -i ../add-extra-wee8-patch.patch
  patch -Np1 -i ../remove-deprecated-copy-constructor.patch

  cp -L "${srcdir}/wee8-jinja2-python-collections.patch" "${srcdir}/envoy-${pkgver}/bazel/external/"

  export GOPATH="$srcdir"/go

  go get github.com/bazelbuild/bazelisk
  export BAZELISK="$GOPATH/bin/bazelisk"

  # https://github.com/envoyproxy/envoy/blob/main/bazel/get_workspace_status
  echo "98c1c9e9a40804b93b074badad1cdf284b47d58b" > SOURCE_VERSION

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
    //source/exe:envoy-static
}

package() {
  cd "envoy-$pkgver"

  install -Dm755 bazel-bin/source/exe/envoy-static "$pkgdir"/usr/bin/envoy
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
