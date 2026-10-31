# Maintainer: Sebastien Rousseau <sebastienrousseau@users.noreply.github.com>
#
# AUR PKGBUILD for the `dot` CLI from
# https://github.com/sebastienrousseau/dotfiles
#
# This file is the template the release pipeline rewrites per tag:
# `release-distribute-aur.yml` sets `pkgver` and `sha256sums` from the
# release's dot-<version>.tar.gz and pushes it to the AUR.
#
# The package builds that release archive, not the git head, so the
# `-git` suffix is a misnomer kept because the AUR repo carries it
# (docs/operations/RELEASE_PIPELINE.md, Known caveats).
#
# Publication target: aur.archlinux.org/packages/dot-cli-git

pkgname=dot-cli-git
pkgver=0.2.540
pkgrel=1
pkgdesc='Declarative dotfiles CLI for macOS, Linux, WSL, and PowerShell'
arch=('any')
url='https://github.com/sebastienrousseau/dotfiles'
license=('Apache-2.0 OR MIT')
depends=('bash' 'chezmoi' 'git' 'curl')
optdepends=(
  'gum: gorgeous tables and prompts in dot commands'
  'jq: JSON-mode output for every dot command'
  'starship: themed shell prompt integration'
  'fzf: fuzzy interactive selection'
)
makedepends=('make')
provides=('dot' 'dotfiles')
conflicts=('dot' 'dotfiles')
source=("dot-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/dot-${pkgver}.tar.gz")
sha256sums=('4e391dc15a9b8375d4195b92f4d79f326d19c235732a2b967eb1f02021fd7f36')

package() {
  cd "${srcdir}/dot-${pkgver}" || return 1
  # The archive's own install contract: the CLI tree under
  # /usr/lib/dotfiles, /usr/bin/dot linked to it, man page, completions.
  make install PREFIX=/usr DESTDIR="${pkgdir}"
  local f
  for f in LICENSE-APACHE LICENSE-MIT; do
    install -Dm644 "$f" "${pkgdir}/usr/share/licenses/${pkgname}/$f"
  done
}
