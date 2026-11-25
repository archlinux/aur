# Maintainer: czyt <czytcn@gmail.com>

pkgname=dffy-render-mermaid-bin
pkgver=0.5.0
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
sha256sums_x86_64=('e0b64c19867a685488c7314749db82528b8de58f2b213938abf664f2cbb7462a')
sha256sums_aarch64=('9b7c950d4ae3e87f0007f955710ba804a41b40531654387608dc80c3b2634fa3')

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
