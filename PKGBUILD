# Maintainer: czyt <czytcn@gmail.com>

pkgname=dffy-render-mermaid-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="dffy renderer plugin that draws Mermaid flowcharts and sequence diagrams with box characters, so their changes read as a diagram in the diff view"
arch=('x86_64' 'aarch64')
url="https://github.com/amalucelli/dffy"
license=('MIT')
# The release binaries are Rust builds that only link glibc.
depends=('glibc')
optdepends=('dffy-bin: the diff viewer this renderer plugs into')
provides=('dffy-render-mermaid')
conflicts=('dffy-render-mermaid')
options=('!strip' '!debug')

# Upstream's downloads carry no version in their names, so the local names do:
# otherwise makepkg would keep serving the previous release from its cache.
_tar_x86_64="dffy-render-mermaid_${pkgver}_linux_amd64.tar.gz"
_tar_aarch64="dffy-render-mermaid_${pkgver}_linux_arm64.tar.gz"
source_x86_64=("${_tar_x86_64}::https://github.com/amalucelli/dffy/releases/download/v${pkgver}/dffy-render-mermaid_linux_amd64.tar.gz")
source_aarch64=("${_tar_aarch64}::https://github.com/amalucelli/dffy/releases/download/v${pkgver}/dffy-render-mermaid_linux_arm64.tar.gz")
# Both archives hold a file called dffy-render-mermaid, so they are unpacked by
# arch below instead of into the same source directory.
noextract=("${_tar_x86_64}" "${_tar_aarch64}")
sha256sums_x86_64=('50bf6268bb35e640fe3b8b8bd3b47c33a88260eb4ca3690a8176fc7b43b9b9f5')
sha256sums_aarch64=('fce1f53af83bc6801d814537464f8a0050e92f5219a10ae58ed557c221639d77')

package() {
  local tar_var="_tar_${CARCH}"
  local tarball="${srcdir}/${!tar_var}"
  local unpacked="${srcdir}/unpacked-${CARCH}"

  mkdir -p "${unpacked}"
  bsdtar -xf "${tarball}" -C "${unpacked}"

  # dffy finds its renderers as dffy-render-<name> on PATH.
  install -Dm755 "${unpacked}/dffy-render-mermaid" \
    "${pkgdir}/usr/bin/dffy-render-mermaid"
  install -Dm644 "${unpacked}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${unpacked}/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
