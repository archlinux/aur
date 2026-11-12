# Maintainer: agony <27015 at riseup dot net>

pkgname=opencrabs
pkgver=0.5.15
pkgrel=1
pkgdesc='Autonomous, self-improving AI agent in a single Rust binary'
arch=('x86_64' 'aarch64')
url='https://github.com/opencrabs/opencrabs'
license=('MIT')
depends=('glibc' 'libgcc' 'libgomp' 'libstdc++' 'openssl')
makedepends=('alsa-lib' 'cargo' 'clang' 'cmake')
optdepends=('rtk: filter shell command output to save tokens')
options=('!lto')
install=opencrabs.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d9cda6b6a28e60026e76a3a66dbf6850fe536300b11a410867c960eab1088b1c')

_home_env() {
  export HOME="${srcdir}/home"
  export XDG_CONFIG_HOME="${HOME}/.config"
  export XDG_DATA_HOME="${HOME}/.local/share"
  mkdir -p "${HOME}"
}

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
  _home_env
  for shell in bash fish zsh; do
    target/release/opencrabs completions "${shell}" > "completion.${shell}"
  done
}

check() {
  cd "${pkgname}-${pkgver}"
  _home_env
  [[ "$(target/release/opencrabs --version)" == "opencrabs ${pkgver}" ]]
  target/release/opencrabs profile create demo > /dev/null
  [[ "$(target/release/opencrabs profile list | grep -x '  demo')" == '  demo' ]]
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 target/release/opencrabs -t "${pkgdir}/usr/bin"
  install -Dm644 packaging/linux/opencrabs.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm644 packaging/linux/opencrabs.png -t "${pkgdir}/usr/share/pixmaps"
  install -Dm644 completion.bash "${pkgdir}/usr/share/bash-completion/completions/opencrabs"
  install -Dm644 completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/opencrabs.fish"
  install -Dm644 completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_opencrabs"
  install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
