#!/usr/bin/env bash
# shellcheck disable=SC2034
# Maintainer:  Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=openai-codex-bin
pkgver=0.148.0
pkgrel=1
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
  "codex-${pkgver}-x86_64.tar.gz::https://github.com/openai/codex/releases/download/rust-v${pkgver}/codex-x86_64-unknown-linux-musl.tar.gz"
  "codex-code-mode-host-${pkgver}-x86_64.tar.gz::https://github.com/openai/codex/releases/download/rust-v${pkgver}/codex-code-mode-host-x86_64-unknown-linux-musl.tar.gz"
)
sha256sums_x86_64=('1a36f762f6b3bef533bb86345ad9517661c2d84d53996a250cf2ca89d2cfee5a'
                   '8e6e559b228fa61b18fb2c28c31ec02068751025bcce3f00cf63c79499d59829')
sha256sums_aarch64=('410c6ae0c763eb39c6da17665e63f9aa4a98e6ee663d81f8e8b779c97cb175ac'
                    '1c410fe4bb174949649efe05c150b1512fb4775d5874eb54b2edb624cf7513a4')

source_aarch64=(
  "codex-${pkgver}-aarch64.tar.gz::https://github.com/openai/codex/releases/download/rust-v${pkgver}/codex-aarch64-unknown-linux-musl.tar.gz"
  "codex-code-mode-host-${pkgver}-aarch64.tar.gz::https://github.com/openai/codex/releases/download/rust-v${pkgver}/codex-code-mode-host-aarch64-unknown-linux-musl.tar.gz"
)

package() {
  cd "$srcdir" || exit

  if [[ "$CARCH" == "x86_64" ]]; then
    install -Dm755 "codex-x86_64-unknown-linux-musl" "$pkgdir/usr/bin/codex"
    install -Dm755 "codex-code-mode-host-x86_64-unknown-linux-musl" "$pkgdir/usr/bin/codex-code-mode-host"
  fi

  if [[ "$CARCH" == "aarch64" ]]; then
    install -Dm755 "codex-aarch64-unknown-linux-musl" "$pkgdir/usr/bin/codex"
    install -Dm755 "codex-code-mode-host-aarch64-unknown-linux-musl" "$pkgdir/usr/bin/codex-code-mode-host"
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
