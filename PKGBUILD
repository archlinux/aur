# Maintainer: Sebastien Rousseau <sebastian.rousseau@gmail.com>
#
# AUR PKGBUILD scaffold for the `dot` CLI from
# https://github.com/sebastienrousseau/dotfiles
#
# STATUS: scaffold only. The framework does not yet ship a single-
# tarball release artefact (chezmoi-managed root layout). The
# v0.3.0 reorganisation (docs/operations/ROADMAP_V0_2_503.md)
# produces a tarball this PKGBUILD can point at. Until then, the
# `sha256sums` is SKIP and source uses the main branch as a
# placeholder.
#
# Publication target: aur.archlinux.org/packages/dot-cli-git
# Validate via:  paru -S dot-cli-git

pkgname=dot-cli-git
pkgver=0.2.518
pkgrel=1
pkgdesc='Declarative dotfiles CLI for macOS, Linux, WSL, and PowerShell (git head)'
arch=('any')
url='https://github.com/sebastienrousseau/dotfiles'
license=('MIT')
depends=('bash' 'chezmoi' 'git' 'curl')
optdepends=(
  'gum: gorgeous tables and prompts in dot commands'
  'jq: JSON-mode output for every dot command'
  'starship: themed shell prompt integration'
  'fzf: fuzzy interactive selection'
)
makedepends=('git')
provides=('dot' 'dotfiles')
conflicts=('dot' 'dotfiles')
source=("git+${url}.git")
sha256sums=('f53d9178c9975c3aee371b6f3b88544cc97e699a86ff98caad885bb2a203f56b')

pkgver() {
  cd "${srcdir}/dotfiles" || return 1
  printf '%s.r%s' "$(grep '^dotfiles_version' .chezmoidata.toml | cut -d'"' -f2)" \
    "$(git rev-list --count HEAD)"
}

package() {
  cd "${srcdir}/dotfiles" || return 1
  install -Dm755 dot_local/bin/executable_dot "${pkgdir}/usr/bin/dot"
  install -Dm644 dot_local/share/man/man1/dot.1 "${pkgdir}/usr/share/man/man1/dot.1"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # Install scripts/dot library — the dispatcher sources lib/* + commands/*
  install -dm755 "${pkgdir}/usr/share/dotfiles/scripts"
  cp -r scripts/dot "${pkgdir}/usr/share/dotfiles/scripts/"

  # zsh completion
  install -Dm644 dot_local/share/zsh/completions/_dot \
    "${pkgdir}/usr/share/zsh/site-functions/_dot"
}
