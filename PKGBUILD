#!/usr/bin/env bash
# shellcheck disable=SC2034
# Maintainer:  Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=openai-codex-bin
pkgver=0.150.0
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
sha256sums_x86_64=('5e9c400a740ee42a009743699d0a78a9a456772b53ae8ff93b6381d559676fb2'
                   '71fbad9f31bc070c2e95239dee741483e35da46f534de5933848e8d43104b920')
sha256sums_aarch64=('0eb7261686c33d4e294aba6f739b2fb20027b2bd407d180c1e075b8349908432'
                    '2002b2201f1969843bed9caedeb3773f91043af33c25ddc30e06cac62ed89889')

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
