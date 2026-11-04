# Maintainer: Atomic Chat <support@atomic.chat>
#
# Generated from packaging/PKGBUILD.in in https://github.com/AtomicBot-ai/atomic-server by the release
# workflow (scripts/linux-packages.mjs pkgbuild); change the template there, not this copy.

pkgname=atc-bin
pkgver=0.2.14
_version=0.2.14
pkgrel=1
pkgdesc='Atomic Server: install an inference engine, pull a model, serve it over an OpenAI-compatible API (https://atomic.chat)'
arch=('x86_64' 'aarch64')
url='https://github.com/AtomicBot-ai/atomic-server'
license=('Apache-2.0')
depends=('glibc')
# The server finds it on PATH for remote access; without it, the terminal UI and the web say how to install it.
optdepends=('cloudflared: public remote access through a Cloudflare tunnel')
provides=('atc')
conflicts=('atc')
# A Bun-compiled binary carries its program after the executable; stripping it cuts the program off.
options=('!strip' '!debug')

_base='https://github.com/AtomicBot-ai/atomic-server/releases/download/v0.2.14'
source=("LICENSE-${_version}::${_base}/LICENSE"
        "NOTICE-${_version}::${_base}/NOTICE"
        "THIRD_PARTY_NOTICES-${_version}.md::${_base}/THIRD_PARTY_NOTICES.md")
# The x86_64 package carries the baseline build (no AVX2 needed), as the deb and rpm do.
source_x86_64=("atc-${_version}-x86_64::${_base}/atc-${_version}-x86_64-unknown-linux-gnu-baseline")
source_aarch64=("atc-${_version}-aarch64::${_base}/atc-${_version}-aarch64-unknown-linux-gnu")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4' '0fc89a2d40a3f52c9e85f9430412cb6095360a1b5fa500afff596e59d5cafd7f' '49efb1ee1b3ec56b48329212a2e2218a7810f7296ad092721bd0501e04bec49b')
sha256sums_x86_64=('f2a7ec8211703dc3c1c406fe45e56a2e68bf5b55730adbbb0f80d3b08d0c36bd')
sha256sums_aarch64=('f917b8c47ea22474c1a65942af3323980f7c072c5b9173712725389776901d7c')

package() {
  install -Dm755 "${srcdir}/atc-${_version}-${CARCH}" "${pkgdir}/usr/bin/atc"
  install -Dm644 "LICENSE-${_version}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "NOTICE-${_version}" "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
  install -Dm644 "THIRD_PARTY_NOTICES-${_version}.md" \
    "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_NOTICES.md"

  # The completion scripts come from the command tree; the installed copy is the executable one, and a
  # throwaway data folder keeps HOME untouched.
  local bin="${pkgdir}/usr/bin/atc" data="${srcdir}/completion-data"
  mkdir -p "${data}"
  install -dm755 "${pkgdir}/usr/share/bash-completion/completions" \
    "${pkgdir}/usr/share/zsh/site-functions" "${pkgdir}/usr/share/fish/vendor_completions.d"
  "${bin}" completion bash --data-folder "${data}" >"${pkgdir}/usr/share/bash-completion/completions/atc"
  "${bin}" completion zsh --data-folder "${data}" >"${pkgdir}/usr/share/zsh/site-functions/_atc"
  "${bin}" completion fish --data-folder "${data}" >"${pkgdir}/usr/share/fish/vendor_completions.d/atc.fish"

  # Tells `atc update` that pacman owns /usr/bin/atc.
  install -dm755 "${pkgdir}/usr/lib/atc"
  printf 'aur\n' >"${pkgdir}/usr/lib/atc/install-source"
}
