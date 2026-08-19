# Maintainer: Markus Maiwald <ops@sovereign-society.org>
# B-004 — binary package for Arch / CachyOS power users.
#
# Install (after publish to AUR, or local):
#   makepkg -si
#   jarvis doctor
#
# pkgver uses underscores (AUR forbids hyphens). Tag v0.3.0-beta.1 → 0.3.0_beta.1

pkgname=jarvis-bin
pkgver=0.3.0_beta.87
pkgrel=1
pkgdesc="Jarvis — private AI agent for professionals (CE binary, static SQLite)"
arch=('x86_64')
url="https://git.sovereign-society.org/libertaria/Jarvis"
license=('LicenseRef-Libertaria')
depends=('glibc')
optdepends=(
  'podman: agent sandbox (recommended; default when healthy)'
)
provides=('jarvis' 'mnemos')
conflicts=('jarvis' 'mnemos' 'jarvis-git')
options=('!strip')  # already stripped in release build
# Map AUR pkgver → release tag / asset names
_tag="v0.3.0-beta.87"
_assetver="0.3.0-beta.87"
source=(
  "jarvis-${_assetver}-x86_64-linux.tar.gz::${url}/releases/download/${_tag}/jarvis-${_assetver}-x86_64-linux.tar.gz"
  "jarvis-${_assetver}-x86_64-linux.sha256::${url}/releases/download/${_tag}/jarvis-${_assetver}-x86_64-linux.sha256"
)
# sha256sums filled by updpkgsums after download; placeholder until first makepkg
sha256sums=(
  'db70fd849d140f6a5d394d317e2337fe9b146bed67c7cf47b7d2706192a705aa'
  'SKIP'
)

package() {
  cd "${srcdir}/jarvis-${_assetver}-x86_64-linux"

  install -Dm755 bin/jarvis "${pkgdir}/usr/bin/jarvis"
  install -Dm755 bin/harnessd "${pkgdir}/usr/bin/harnessd"
  ln -s jarvis "${pkgdir}/usr/bin/mnemos"

  install -d "${pkgdir}/usr/share/jarvis"
  if [[ -d share ]]; then
    cp -a share/. "${pkgdir}/usr/share/jarvis/"
  fi
  if [[ -f VERSION ]]; then
    install -Dm644 VERSION "${pkgdir}/usr/share/jarvis/VERSION"
  fi
  if [[ -f README.txt ]]; then
    install -Dm644 README.txt "${pkgdir}/usr/share/doc/${pkgname}/README.txt"
  fi
}
