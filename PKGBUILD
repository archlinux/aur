# Maintainer: Henry-ZHR <henry-zhr@qq.com>
pkgname=codex-auth
pkgver=0.4.0
pkgrel=1
pkgdesc="A CLI tool to switch and manage Codex accounts"
arch=('x86_64' 'aarch64')
url="https://github.com/Loongphy/codex-auth"
license=('MIT')
depends=('glibc')
makedepends=('git' 'zig')
optdepends=('openai-codex: adding accounts easier')
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha512sums=('a2d16568eb253cd8adda3fa181aa09c80704cfa287c50f470c60c4c70161349898130c4f2f3026ca528df91d080d0ca1e61300b564e86c3f2158951dffbfa793')

prepare() {
  mkdir -p "${pkgname}/build"
}

build() {
  cd "${pkgname}"
  zig build -Doptimize=ReleaseSafe --prefix build

  cd build
  bin/codex-auth completion bash >bash-completion
  bin/codex-auth completion fish >fish-completion
  bin/codex-auth completion zsh >zsh-completion
}

package() {
  cd "${pkgname}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd build
  install -Dm755 bin/codex-auth "${pkgdir}/usr/bin/codex-auth"
  install -Dm644 bash-completion "${pkgdir}/usr/share/bash-completion/completions/codex-auth"
  install -Dm644 fish-completion "${pkgdir}/usr/share/fish/vendor_completions.d/codex-auth.fish"
  install -Dm644 zsh-completion "${pkgdir}/usr/share/zsh/site-functions/_codex-auth"
}
