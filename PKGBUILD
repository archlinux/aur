# Maintainer: czyt <czytcn@gmail.com>

pkgname=dffy-render-markdown-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="dffy renderer plugin that draws Markdown as rendered text for the diff view: headings, lists, quotes, tables and links, with Mermaid fences drawn as diagrams"
arch=('x86_64' 'aarch64')
url="https://github.com/amalucelli/dffy"
license=('MIT')
# The release binaries are Rust builds that only link glibc.
depends=('glibc')
optdepends=('dffy-bin: the diff viewer this renderer plugs into')
provides=('dffy-render-markdown')
conflicts=('dffy-render-markdown')
options=('!strip' '!debug')

# Upstream's downloads carry no version in their names, so the local names do:
# otherwise makepkg would keep serving the previous release from its cache.
_tar_x86_64="dffy-render-markdown_${pkgver}_linux_amd64.tar.gz"
_tar_aarch64="dffy-render-markdown_${pkgver}_linux_arm64.tar.gz"
source_x86_64=("${_tar_x86_64}::https://github.com/amalucelli/dffy/releases/download/v${pkgver}/dffy-render-markdown_linux_amd64.tar.gz")
source_aarch64=("${_tar_aarch64}::https://github.com/amalucelli/dffy/releases/download/v${pkgver}/dffy-render-markdown_linux_arm64.tar.gz")
# Both archives hold a file called dffy-render-markdown, so they are unpacked
# by arch below instead of into the same source directory.
noextract=("${_tar_x86_64}" "${_tar_aarch64}")
sha256sums_x86_64=('57b2c8dab5526ea601597b4689b7a3e8617a46a5400dd48482dd7281831a49ea')
sha256sums_aarch64=('58feef01751c1961d0449e49251a8da2359c45c6f3650174901de8318e6d0e9c')

package() {
  local tar_var="_tar_${CARCH}"
  local tarball="${srcdir}/${!tar_var}"
  local unpacked="${srcdir}/unpacked-${CARCH}"

  mkdir -p "${unpacked}"
  bsdtar -xf "${tarball}" -C "${unpacked}"

  # dffy finds its renderers as dffy-render-<name> on PATH.
  install -Dm755 "${unpacked}/dffy-render-markdown" \
    "${pkgdir}/usr/bin/dffy-render-markdown"
  install -Dm644 "${unpacked}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${unpacked}/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
