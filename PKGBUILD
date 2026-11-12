# Maintainer: agony <27015 at riseup dot net>

pkgname=pixtuoid
pkgver=0.22.0
pkgrel=1
pkgdesc='Terminal pixel-art office for AI coding agents'
arch=('x86_64' 'aarch64')
url='https://github.com/pixtuoid/pixtuoid'
license=('MIT')
depends=('alsa-lib' 'glibc' 'libgcc')
makedepends=('cargo')
optdepends=('libxkbcommon: floating window'
            'wayland: floating window on Wayland'
            'libx11: floating window on X11'
            'libxcursor: floating window on X11'
            'libxi: floating window on X11'
            'libxkbcommon-x11: floating window on X11'
            'vulkan-icd-loader: floating window with Vulkan, OpenGL without it'
            'libglvnd: floating window with OpenGL')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('49a430b2b6725f788455e87de7d70feae8da2c4d9376696d37298c297242391b')

_home_env() {
  export HOME="${srcdir}/home"
  export XDG_CONFIG_HOME="${HOME}/.config"
  export XDG_DATA_HOME="${HOME}/.local/share"
  export XDG_STATE_HOME="${HOME}/.local/state"
  export XDG_CACHE_HOME="${HOME}/.cache"
}

prepare() {
  cd "${pkgname}-${pkgver}"
  # Pins lld as the x86_64 linker of upstream CI
  rm .cargo/config.toml
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p pixtuoid -p pixtuoid-hook
  _home_env
  for shell in bash fish zsh; do
    target/release/pixtuoid completions "${shell}" > "completion.${shell}"
  done
  target/release/pixtuoid man > pixtuoid.1
}

check() {
  cd "${pkgname}-${pkgver}"
  _home_env
  [[ "$(target/release/pixtuoid --version)" == "pixtuoid ${pkgver}" ]]
  target/release/pixtuoid doctor | grep -q 'delivered a test event'
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 target/release/pixtuoid target/release/pixtuoid-hook -t "${pkgdir}/usr/bin"
  install -Dm644 pixtuoid.1 -t "${pkgdir}/usr/share/man/man1"
  install -Dm644 completion.bash "${pkgdir}/usr/share/bash-completion/completions/pixtuoid"
  install -Dm644 completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/pixtuoid.fish"
  install -Dm644 completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_pixtuoid"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
