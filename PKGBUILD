#!/usr/bin/env bash
# shellcheck disable=SC2034
# Maintainer:  Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=openai-codex-bin
pkgver=0.162.0
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
sha256sums_x86_64=('4f573944c1d2059109d75a2f4d0cc9c03697288224a5e407717a9de98fc010c5')
sha256sums_aarch64=('d47a5fa21e037a1b85729b88c238ff3da8a956fc9fb5ad3976714428e7fb2bda')

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
