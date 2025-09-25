# Maintainer: envolution
# Contributor: Jose Fernandez <josefernandez.dev@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154
# ci|skipcheck|

pkgname=below
pkgver=0.11.0
pkgrel=1
pkgdesc="A time traveling resource monitor for modern Linux systems"
arch=(x86_64)
url="https://github.com/facebookincubator/below"
license=('Apache-2.0')
depends=(glibc gcc-libs libelf zlib)
makedepends=(cargo clang)
options=(!lto)
install=below.install
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.zip"
  "below.install"
)
sha256sums=('33f3d7adc96082ac884d6c532dbb8b935230035948fd0b5c5c70b70413d8cd13'
            'af3057fcf8bf411522d76cf5def98b6c871687002b44236a9fe34bf8a47d95c2')

prepare() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo update
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export LIBBPF_LIB_DIR=/usr/lib
  export LIBBPF_INCLUDE_DIR=/usr/include/bpf
  cargo build --frozen --no-default-features --features "libbpf-cargo/default libbpf-rs/default" --release
}

check() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export LIBBPF_LIB_DIR=/usr/lib
  export LIBBPF_INCLUDE_DIR=/usr/include/bpf
  cargo test --no-default-features --features "libbpf-cargo/default libbpf-rs/default" --workspace -- --skip sudotest
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 'README.md' -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 "etc/below.service" "${pkgdir}/usr/lib/systemd/system/below.service"
}
# vim:set ts=2 sw=2 et:
