# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=env0-cli-bin
pkgver=2.7.1
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
sha256sums_x86_64=('de3557f89abcf2141d1f75390a0584b6e4ff1afd37de1f7e46b0015a1adcc95a')
sha256sums_aarch64=('d85a8d14dd36d62860421f737df08267d29494617545f67eec066cb59faebad0')

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
