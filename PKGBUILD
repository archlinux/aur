# Maintainer: Ibnu Afdel <ibnuafdel at gmail dot com>
pkgname=pomogo
pkgver=3.0.1
pkgrel=1
pkgdesc="Keyboard-driven Pomodoro and deep-focus timer for the Linux terminal, with an Omarchy bar widget"
arch=('x86_64' 'aarch64')
url="https://github.com/Ibnu-Afdel/pomogo-rs"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
optdepends=(
  'libcanberra: transition sounds via canberra-gtk-play'
  'pipewire-audio: transition sounds via pw-play when canberra is missing'
  'libnotify: notify-send, used by pomogo doctor'
)
options=('!lto' '!debug')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f03d55ebc52424cc1f14d281d53b2307f5991c26e08f27c42fefd2b6b033f34a')

_srcdir="pomogo-rs-${pkgver}"

prepare() {
  cd "${_srcdir}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_srcdir}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "${_srcdir}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release
}

package() {
  cd "${_srcdir}"
  local bin="target/release/pomogo"

  install -Dm755 "${bin}" "${pkgdir}/usr/bin/pomogo"

  install -dm755 "${pkgdir}/usr/share/bash-completion/completions" \
    "${pkgdir}/usr/share/zsh/site-functions" \
    "${pkgdir}/usr/share/fish/vendor_completions.d"
  "${bin}" completion bash >"${pkgdir}/usr/share/bash-completion/completions/pomogo"
  "${bin}" completion zsh >"${pkgdir}/usr/share/zsh/site-functions/_pomogo"
  "${bin}" completion fish >"${pkgdir}/usr/share/fish/vendor_completions.d/pomogo.fish"

  install -Dm644 contrib/pomogo.desktop "${pkgdir}/usr/share/applications/pomogo.desktop"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
