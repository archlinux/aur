# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=env0-cli-bin
pkgver=2.6.0
pkgrel=1
pkgdesc="The env0 command-line interface"
arch=('x86_64' 'aarch64')
url="https://www.env0.com"
license=('MIT')
# Statically linked Go binary, already stripped upstream
options=(!strip)
provides=('env0-cli')
conflicts=('env0-cli')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tgz::https://registry.npmjs.org/@env0/cli-linux-x64/-/cli-linux-x64-${pkgver}.tgz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tgz::https://registry.npmjs.org/@env0/cli-linux-arm64/-/cli-linux-arm64-${pkgver}.tgz")
sha256sums_x86_64=('85828d8e4745cd5f8af2c55e698834de820cc27bf6f02510ae22394ac3240647')
sha256sums_aarch64=('828d1ab4105b2143015056732bed0404db8ac653b35ab3b6271e62d03fffa0b8')

build() {
  cd "${srcdir}/package"

  # the binary writes a config file on every run, keep it inside srcdir
  export HOME="${srcdir}" XDG_CONFIG_HOME="${srcdir}/.config"
  for _shell in bash zsh fish; do
    ./bin/env0 completion "${_shell}" > "env0.${_shell}"
  done
}

package() {
  cd "${srcdir}/package"

  # binary
  install -Dm755 bin/env0 "${pkgdir}/usr/bin/env0"

  # shell completions
  install -Dm644 env0.bash "${pkgdir}/usr/share/bash-completion/completions/env0"
  install -Dm644 env0.zsh "${pkgdir}/usr/share/zsh/site-functions/_env0"
  install -Dm644 env0.fish "${pkgdir}/usr/share/fish/vendor_completions.d/env0.fish"

  # license
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
