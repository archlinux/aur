# Maintainer: Torge Matthies <openglfreak at googlemail dot com>

pkgbase=deepfilternet-git
pkgname=(libdf-git libdeep_filter_ladspa-git deepfilternet-demos-git)
pkgver=v0.5.6.r10.g59789e1
pkgrel=1
pkgdesc='A Low Complexity Speech Enhancement Framework for Full-Band Audio (48kHz) using Deep Filtering (Git version)'
url='https://github.com/Rikorose/DeepFilterNet'
arch=('x86_64')
license=('MIT' 'Apache')
depends=('gcc-libs')
makedepends=('cargo' 'git')
_repo=DeepFilterNet
source=('git+https://github.com/Rikorose/DeepFilterNet.git')
sha512sums=('SKIP')

if check_option "lto" "y"; then
  export CARGO_PROFILE_RELEASE_LTO=true CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
fi
if check_option "debug" "y"; then
  export CARGO_PROFILE_RELEASE_DEBUG=2
fi

pkgver() {
  cd "$_repo"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_repo"
  export RUSTUP_TOOLCHAIN=nightly
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_repo"
  export RUSTUP_TOOLCHAIN=nightly
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features --all-targets
}

check() {
  cd "$_repo"
  export RUSTUP_TOOLCHAIN=nightly
  export CARGO_TARGET_DIR=check
  cargo test --frozen --all-features --workspace
}

package_libdf-git() {
  pkgdesc+=" - core library"
  conflicts+=('libdf')
  provides+=('libdf')
  cd "$_repo"
  install -Dm0755 -t "$pkgdir/usr/lib/" "target/release/liblibdf.so" "target/release/liblibdfdata.so"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/${pkgname}/" "LICENSE" "LICENSE-MIT"
}

package_libdeep_filter_ladspa-git() {
  pkgdesc+=" - ladspa plugin"
  depends+=('libdf')
  conflicts+=('libdeep_filter_ladspa')
  provides+=('libdeep_filter_ladspa')
  cd "$_repo"
  install -Dm0755 -t "$pkgdir/usr/lib/ladspa/" "target/release/libdeep_filter_ladspa.so"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/${pkgname}/" "LICENSE" "LICENSE-MIT"
}

package_deepfilternet-demos-git() {
  pkgdesc+=" - demo application"
  depends+=('libdf')
  conflicts+=('deepfilternet-demos')
  provides+=('deepfilternet-demos')
  cd "$_repo"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/df-demo-c"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/${pkgname}/" "LICENSE" "LICENSE-MIT"
}
