# Maintainer: Jason Go <jasongo@jasongo.net>

_rust_version='nightly'
_sdk='no-sdk'
_suffix="$( [ "$_sdk" == "std-sdk" ] && echo "" || echo "-$_sdk" )"
pkgname="llrt$_suffix-git"
pkgver=20251103.133823
pkgrel=1
pkgdesc='Lightweight JavaScript runtime, compiler, REPL, and test runner (NO @aws-sdk bundled)'
arch=('x86_64' 'aarch64')
url='https://github.com/awslabs/llrt'
license=('Apache-2.0')
makedepends=('cmake' 'nodejs' 'parallel' 'rustup' 'zig' 'zip' 'zstd')
optdepends=(
  'typescript: transpiler for TypeScript code with type checking support'
  'esbuild: fast compiler and bundler for JavaScript and TypeScript'
  'swc-js-bin: drop-in replacement for Babel with compilation and polyfill support'
  'bun-bin: fast runtime, compiler, and bundler for JavaScript and TypeScript'
)
provides=('llrt')
conflicts=('llrt')
options=(!buildflags !makeflags !debug)
source=(
  "git+$url.git"
  "https://github.com/yarnpkg/yarn/releases/download/v1.22.22/yarn-v1.22.22.tar.gz"
)
sha256sums=('SKIP'
            '88268464199d1611fcf73ce9c0a6c4d44c7d5363682720d8506f6508addf36a0')

_CARCH="$( [ "$CARCH" == "aarch64" ] && echo "arm64" || echo "x64" )"

prepare() {
  cd llrt

  # Use Rust's nightly version from the date of the upstream release to prevent regression issues
  sed -i "s/RUST_VERSION = nightly/RUST_VERSION = $_rust_version/g" Makefile

  echo "Downloading..."
  parallel --halt now,fail=1 --keep-order --latest-line --link --tagstring '{1}:' '{2}' \
    ::: '      Git submodules' '   Rust dependencies' 'AWS SDK dependencies' \
    ::: 'git submodule update --init --checkout && echo "Done!"' \
        "rustup toolchain install $_rust_version --target $CARCH-unknown-linux-musl && make stdlib-$_CARCH && cargo fetch --target $CARCH-unknown-linux-musl --color never && echo 'Done!'" \
        "$srcdir/yarn-v1.22.22/bin/yarn install --no-progress && echo 'Done!'"
}

build() {
  cd llrt
  make "libs-$_CARCH"
  make "llrt-linux-$_CARCH$_suffix.zip"
}

package() {
  install -Dm755 "$srcdir/llrt/target/$CARCH-unknown-linux-musl/release/llrt" "$pkgdir/usr/bin/llrt"
  ln -sf "/usr/bin/llrt" "$pkgdir/usr/bin/llrt-$_sdk" # Provide a suffixed alias to llrt
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/llrt/"{LICENSE,THIRD_PARTY_LICENSES,NOTICE}
}
