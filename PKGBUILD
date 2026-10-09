#!/usr/bin/env bash
# shellcheck disable=SC2034
# Maintainer:  Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=openai-codex-bin
pkgver=0.162.1
pkgrel=1
pkgdesc="Arch Linux package for OpenAI's Codex CLI - Auto Updated"
arch=('x86_64' 'aarch64')
url="https://github.com/openai/codex"
license=('Apache')
provides=('openai-codex')
conflicts=('openai-codex' 'openai-codex-autoup-bin')
replaces=('openai-codex-autoup-bin')
depends=('glibc' 'alsa-lib')
optdepends=(
  'git: for working with git repositories'
  'ripgrep: accelerated large-repo search'
  'pipewire-alsa: voice audio through PipeWire'
)
keywords=('codex' 'openai' 'cli' 'ai' 'machine-learning' 'chatgpt')
# Voice manifests verify bundled file hashes; preserve upstream binaries.
options=('!strip' '!debug')

source_x86_64=(
  "codex-package-${pkgver}-x86_64.tar.gz::https://github.com/openai/codex/releases/download/rust-v${pkgver}/codex-package-x86_64-unknown-linux-musl.tar.gz"
)
sha256sums_x86_64=('a676f5722aae0d86cbe3764332f08eab1fdd89dc0a300b3ad4ffbf48611fa3e3')
sha256sums_aarch64=('53a9ce0b94beb27a63fdeb2f7704d95199e17b3898aa33b60461a1a93ac0d88b')

source_aarch64=(
  "codex-package-${pkgver}-aarch64.tar.gz::https://github.com/openai/codex/releases/download/rust-v${pkgver}/codex-package-aarch64-unknown-linux-musl.tar.gz"
)

package() {
  cd "$srcdir" || exit

  # Codex discovers voice through codex-package.json and package-relative paths.
  # Keep the complete bundle together, including its helper, runtime and notices.
  install -d "$pkgdir/opt/openai-codex" "$pkgdir/usr/bin"
  cp -a bin codex-package.json codex-path codex-resources "$pkgdir/opt/openai-codex/"
  ln -s /opt/openai-codex/bin/codex "$pkgdir/usr/bin/codex"
  ln -s /opt/openai-codex/bin/codex-code-mode-host "$pkgdir/usr/bin/codex-code-mode-host"

  # Install completions
  mkdir -p "${pkgdir}/usr/share/bash-completion/completions/"
  mkdir -p "${pkgdir}/usr/share/zsh/site-functions/"
  mkdir -p "${pkgdir}/usr/share/fish/vendor_completions.d/"
  mkdir -p "${pkgdir}/usr/share/elvish/lib/"
  mkdir -p "${pkgdir}/usr/share/powershell/Completions/"

  # Generate completion scripts
  "${srcdir}/bin/codex" completion bash >codex.bash
  "${srcdir}/bin/codex" completion zsh >codex.zsh
  "${srcdir}/bin/codex" completion fish >codex.fish
  "${srcdir}/bin/codex" completion elvish >codex.elvish
  "${srcdir}/bin/codex" completion powershell >codex.ps1

  # Install completion files
  install -Dm644 "codex.bash" "${pkgdir}/usr/share/bash-completion/completions/codex"
  install -Dm644 "codex.zsh" "${pkgdir}/usr/share/zsh/site-functions/_codex"
  install -Dm644 "codex.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/codex.fish"
  install -Dm644 "codex.elvish" "${pkgdir}/usr/share/elvish/lib/codex.elv"
  install -Dm644 "codex.ps1" "${pkgdir}/usr/share/powershell/Completions/codex.ps1"
}
