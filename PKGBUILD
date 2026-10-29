# Maintainer: Atomic Chat <support@atomic.chat>
#
# Generated from packaging/PKGBUILD.in in https://github.com/AtomicBot-ai/atomic-server by the release
# workflow (scripts/linux-packages.mjs pkgbuild); change the template there, not this copy.

pkgname=atc-bin
pkgver=0.2.9
_version=0.2.9
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

_base='https://github.com/AtomicBot-ai/atomic-server/releases/download/v0.2.9'
source=("LICENSE-${_version}::${_base}/LICENSE"
        "NOTICE-${_version}::${_base}/NOTICE"
        "THIRD_PARTY_NOTICES-${_version}.md::${_base}/THIRD_PARTY_NOTICES.md")
# The x86_64 package carries the baseline build (no AVX2 needed), as the deb and rpm do.
source_x86_64=("atc-${_version}-x86_64::${_base}/atc-${_version}-x86_64-unknown-linux-gnu-baseline")
source_aarch64=("atc-${_version}-aarch64::${_base}/atc-${_version}-aarch64-unknown-linux-gnu")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4' '0fc89a2d40a3f52c9e85f9430412cb6095360a1b5fa500afff596e59d5cafd7f' '0758a998262bf8ced32a75d7f69863a134b595498809ecca0c04634d96cbdf28')
sha256sums_x86_64=('2d680f516e947606e430a94a1271ef3413e10dd5813b0bbff39a070efa773af9')
sha256sums_aarch64=('0936a1244de90527f8b39ff70ab89b2ec3989812de561b3c9299dc0811793897')

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
