#!/usr/bin/env bash
# shellcheck disable=SC2034
# Maintainer:  Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=openai-codex-bin
pkgver=0.144.4
pkgrel=2
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
sha256sums_x86_64=('37c985be9d89e8c4f43b3aa0594c1213eac212d30ae2b95221f08fec807515d1'
                   '302941bed6fb3c8829dde5fe72864ee04466eec1623c73b43cd44bf2fafe8038')
sha256sums_aarch64=('4d07243ef4ae6786b8b321d7aea3f9be4e1d2c597ae5407e7c1b9873334082b2'
                    'cb69dcb4ae6573290435fe56721f1fed580f96997d258f3536ffe18d05fa6b8f')

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
