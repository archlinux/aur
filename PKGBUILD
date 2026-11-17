# Maintainer: agony <27015 at riseup dot net>

pkgname=chainloop-cli-bin
pkgver=1.135.4
pkgrel=1
pkgdesc='CLI for signed, policy-checked records of AI coding agents and CI/CD pipelines (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/chainloop-dev/chainloop'
license=('Apache-2.0')
provides=("chainloop-cli=${pkgver}")
conflicts=('chainloop-cli')
install=chainloop-cli.install
_release="${url}/releases/download/v${pkgver}"
source_x86_64=("chainloop-${pkgver}-linux-amd64::${_release}/chainloop-linux-amd64")
source_aarch64=("chainloop-${pkgver}-linux-arm64::${_release}/chainloop-linux-arm64")
sha256sums_x86_64=('dcc68f0ebfc90ad31e1fe73b971d651cd62fc2b0ef0eb2a1f599d14ac72229e9')
sha256sums_aarch64=('fad2194910717257eea7264976353647a88a531ec780f40bf4472bdf315846d3')

_chainloop_env() {
  export HOME="${srcdir}/home"
  export XDG_CONFIG_HOME="${HOME}/.config"
  export XDG_DATA_HOME="${HOME}/.local/share"
  export DO_NOT_TRACK=1
}

build() {
  _chainloop_env
  install -m755 chainloop-"${pkgver}"-linux-* chainloop
  for shell in bash fish zsh; do
    ./chainloop completion "${shell}" > "completion.${shell}"
  done
}

package() {
  install -Dm755 chainloop -t "${pkgdir}/usr/bin"
  install -Dm644 completion.bash "${pkgdir}/usr/share/bash-completion/completions/chainloop"
  install -Dm644 completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/chainloop.fish"
  install -Dm644 completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_chainloop"
}
