#!/usr/bin/env bash
# shellcheck disable=SC2034
# Maintainer:  Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=openai-codex-bin
pkgver=0.146.0
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
sha256sums_x86_64=('5ba3b9405543953081f661d0854d266f76e2abbe51d41349355a36de7673776a'
                   'a140731f54e7039355d189479dfc7d059b6c0a87176c7a011d2f271a9914139a')
sha256sums_aarch64=('975bac91562abeedeb8f79636d51a86649b31f34a9de6a3bcb059565b6cf1f87'
                    '95b4a80b15316a8eb4706a289697fc42fee7644ea79b0ad0bdae2273af5e08a8')

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
