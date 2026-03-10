#!/usr/bin/env bash
# shellcheck disable=SC2034
# Maintainer:  Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=openai-codex-bin
pkgver=0.113.0
pkgrel=3
pkgdesc="Arch Linux package for OpenAI's Codex CLI - Auto Updated"
arch=('x86_64' 'aarch64')
url="https://github.com/openai/codex"
license=('Apache')
provides=('openai-codex')
conflicts=('openai-codex' 'openai-codex-autoup-bin')
replaces=('openai-codex-autoup-bin')
optdepends=(
  'git: for working with git repositories'
  'ripgrep: accelerated large-repo search'
)
keywords=('codex' 'openai' 'cli' 'ai' 'machine-learning' 'chatgpt')

source_x86_64=(
  "codex-${pkgver}-x86_64.tar.gz::https://github.com/openai/codex/releases/download/rust-v${pkgver}/codex-x86_64-unknown-linux-gnu.tar.gz"
)
sha256sums_x86_64=('3a3507cbe74efb54f546d9fa7584c5b55274b919dcd25ac959379ffc0497b741')
sha256sums_aarch64=('b482d5de403eff9e66bc9a8c709641f6cabbbaf5493af1df4c0c8472ea2c7ea3')

source_aarch64=(
  "codex-${pkgver}-aarch64.tar.gz::https://github.com/openai/codex/releases/download/rust-v${pkgver}/codex-aarch64-unknown-linux-gnu.tar.gz"
)

package() {
  cd "$srcdir" || exit

  if [[ "$CARCH" == "x86_64" ]]; then
    install -Dm755 "codex-x86_64-unknown-linux-gnu" "$pkgdir/usr/bin/codex"
  fi

  if [[ "$CARCH" == "aarch64" ]]; then
    install -Dm755 "codex-aarch64-unknown-linux-gnu" "$pkgdir/usr/bin/codex"
  fi

  # Install completions
  mkdir -p "${pkgdir}/usr/share/bash-completion/completions/"
  mkdir -p "${pkgdir}/usr/share/zsh/site-functions/"
  mkdir -p "${pkgdir}/usr/share/fish/vendor_completions.d/"
  mkdir -p "${pkgdir}/usr/share/elvish/lib/"
  mkdir -p "${pkgdir}/usr/share/powershell/Completions/"

  # Generate completion scripts
  "${pkgdir}/usr/bin/codex" completion bash >codex.bash
  "${pkgdir}/usr/bin/codex" completion zsh >codex.zsh
  "${pkgdir}/usr/bin/codex" completion fish >codex.fish
  "${pkgdir}/usr/bin/codex" completion elvish >codex.elvish
  "${pkgdir}/usr/bin/codex" completion powershell >codex.ps1

  # Install completion files
  install -Dm644 "codex.bash" "${pkgdir}/usr/share/bash-completion/completions/codex"
  install -Dm644 "codex.zsh" "${pkgdir}/usr/share/zsh/site-functions/_codex"
  install -Dm644 "codex.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/codex.fish"
  install -Dm644 "codex.elvish" "${pkgdir}/usr/share/elvish/lib/codex.elv"
  install -Dm644 "codex.ps1" "${pkgdir}/usr/share/powershell/Completions/codex.ps1"
}
