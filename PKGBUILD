# Maintainer: Markus Maiwald <ops@sovereign-society.org>
# Binary package for Arch / CachyOS. The release binaries are fully static
# (musl, x86-64-v3 CPU floor), so the package has no runtime dependencies.
#
# Install:
#   makepkg -si
#   jarvis doctor
#
# pkgver uses underscores (AUR forbids hyphens). Tag v0.3.2 → 0.3.2

pkgname=jarvis-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="Jarvis: private AI agent for professionals (static CE binaries)"
arch=('x86_64')
url="https://git.sovereign-society.org/libertaria/Jarvis"
license=('LicenseRef-Libertaria')
optdepends=(
  'podman: agent sandbox (recommended; default when healthy)'
)
provides=('jarvis' 'mnemos')
conflicts=('jarvis' 'mnemos' 'jarvis-git')
options=('!strip')  # already stripped in release build
# Map AUR pkgver → release tag / asset names
_tag="v${pkgver//_/-}"
_assetver="${pkgver//_/-}"
source=(
  "jarvis-${_assetver}-x86_64-linux.tar.gz::${url}/releases/download/${_tag}/jarvis-${_assetver}-x86_64-linux.tar.gz"
  "jarvis-${_assetver}-x86_64-linux.sha256::${url}/releases/download/${_tag}/jarvis-${_assetver}-x86_64-linux.sha256"
)
sha256sums=(
  'cdd70ff9fb0ac6623e9841bccaac92dcbd7853289e2a79fc56d782f2f673bb1b'
  'b05e48e447b4ab22c277bbc9c8c3d9b6961df5247b4921b486339c0fcec04b5b'
)

package() {
  cd "${srcdir}/jarvis-${_assetver}-x86_64-linux"

  install -Dm755 bin/jarvis "${pkgdir}/usr/bin/jarvis"
  install -Dm755 bin/harnessd "${pkgdir}/usr/bin/harnessd"
  # harnessd finds the confinement shim beside itself; without it, fenced
  # process.execute refuses (fail closed) instead of running unconfined.
  install -Dm755 bin/jarvis-confine "${pkgdir}/usr/bin/jarvis-confine"
  ln -s jarvis "${pkgdir}/usr/bin/mnemos"

  install -d "${pkgdir}/usr/share/jarvis"
  if [[ -d share ]]; then
    cp -a share/. "${pkgdir}/usr/share/jarvis/"
  fi
  if [[ -f VERSION ]]; then
    install -Dm644 VERSION "${pkgdir}/usr/share/jarvis/VERSION"
  fi
}
