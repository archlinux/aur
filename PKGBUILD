# Maintainer: Ismail Ivanov <ismailfilipov321@gmail.com>
pkgname=deepfilternet-plus-git
pkgver=r1638.6496d8e
pkgrel=1
pkgdesc="AI noise suppression: LADSPA mic plugin for EasyEffects/PipeWire and deep-filter CLI (git)"
arch=('x86_64' 'aarch64')
url="https://github.com/ismailivanov/DeepFilterNetPlus"
license=('MIT OR Apache-2.0')
makedepends=('git' 'cargo')
provides=('deepfilternet-plus' 'deep-filter' 'libdeep_filter_ladspa')
conflicts=('deepfilternet-plus-bin' 'libdeep_filter_ladspa')
optdepends=('easyeffects: use the plugin as microphone noise suppression (Deep Noise Remover)')
source=("deepfilternetplus::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd deepfilternetplus
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd deepfilternetplus
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd deepfilternetplus
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release -p deep-filter-ladspa
  cargo build --frozen --profile release-lto -p deep_filter \
    --no-default-features \
    --features bin,tract,default-model,wav-utils,transforms,logging \
    --bin deep-filter
}

check() {
  cd deepfilternetplus
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release -p deep-filter-ladspa
}

package() {
  cd deepfilternetplus
  install -Dm755 target/release/libdeep_filter_ladspa.so \
    "${pkgdir}/usr/lib/ladspa/libdeep_filter_ladspa.so"
  install -Dm755 target/release-lto/deep-filter "${pkgdir}/usr/bin/deep-filter"
  install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
