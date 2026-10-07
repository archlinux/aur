# Maintainer: Ibnu Afdel <ibnuafdel at gmail dot com>
pkgname=pomogo
pkgver=4.0.0
pkgrel=1
pkgdesc="Terminal focus companion: autopilot Pomodoro, body reminders, a daily goal and an Omarchy bar widget"
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
sha256sums=('cc7fb1d2582870d4d1b6cc3b154a10f49c8cb6448c711c64ba2f78daaf0d423d')

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
