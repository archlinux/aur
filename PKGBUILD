# Maintainer: Deepu K Sasidharan <d4udts@gmail.com>
#
# Generated from deployment/aur/llamastash/PKGBUILD.template by
# deployment/aur/packager.py during .github/workflows/release.yml.
# Do not edit aur-llamastash/PKGBUILD by hand -- it is overwritten on
# every stable tag.
pkgname=llamastash
pkgver=0.0.3
pkgrel=1
pkgdesc='Zero-overhead, terminal-native local-LLM launcher'
arch=('x86_64' 'aarch64')
url='https://github.com/llamastash/llamastash'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
optdepends=('llama.cpp: provides llama-server (otherwise installed by `llamastash init`)')
provides=('llamastash')
conflicts=('llamastash-bin' 'llamastash-git')
# Cargo.toml [profile.release] already sets lto="thin"; disable makepkg's
# RUSTFLAGS=-Clto=on injection so we don't double-link.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8b304293b6d5db97375821deac824dbfd9444076a4599a7293b9e7546eaeabed')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # --bin llamastash matches release.yml so the test-only fake_llama_server
  # bin (gated behind the test-fixtures feature) is never even considered.
  cargo build --frozen --release --bin llamastash
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/llamastash "$pkgdir/usr/bin/llamastash"
  install -Dm644 LICENSE      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md    "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
