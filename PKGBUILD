# Maintainer: czyt <czytcn@gmail.com>

pkgname=dffy-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Fast terminal diff viewer for git, built for large repositories: file tree and split or unified view, syntax-aware diff, watch mode, JSON output and an MCP server for coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/amalucelli/dffy"
license=('MIT')
# The release binaries are Rust builds that only link glibc.
depends=('glibc')
optdepends=(
  'git: reviewing a repository, which is what dffy is for (it also diffs two files on its own)'
  'dffy-render-markdown-bin: render Markdown files, after adding "render = md:markdown" to ~/.config/dffy/config'
  'dffy-render-mermaid-bin: draw Mermaid diagrams, after adding "render = mmd:mermaid mermaid:mermaid" to ~/.config/dffy/config'
)
provides=('dffy')
conflicts=('dffy' 'dffy-git')
options=('!strip' '!debug')

# Upstream's downloads carry no version in their names, so the local names do:
# otherwise makepkg would keep serving the previous release from its cache.
_tar_x86_64="dffy_${pkgver}_linux_amd64.tar.gz"
_tar_aarch64="dffy_${pkgver}_linux_arm64.tar.gz"
source_x86_64=("${_tar_x86_64}::https://github.com/amalucelli/dffy/releases/download/v${pkgver}/dffy_linux_amd64.tar.gz")
source_aarch64=("${_tar_aarch64}::https://github.com/amalucelli/dffy/releases/download/v${pkgver}/dffy_linux_arm64.tar.gz")
# Both archives hold a file called dffy, so they are unpacked by arch below
# instead of into the same source directory.
noextract=("${_tar_x86_64}" "${_tar_aarch64}")
sha256sums_x86_64=('edc5ffd2d9173c7d2540902fad79d7970bc670b17991ade9ef6e35ca667aa10f')
sha256sums_aarch64=('9574355e19742a51441b35130372f6a47ee09e64d7b46dbc275be2c1218f686a')

package() {
  local tar_var="_tar_${CARCH}"
  local tarball="${srcdir}/${!tar_var}"
  local unpacked="${srcdir}/unpacked-${CARCH}"

  mkdir -p "${unpacked}"
  bsdtar -xf "${tarball}" -C "${unpacked}"

  install -Dm755 "${unpacked}/dffy" "${pkgdir}/usr/bin/dffy"
  install -Dm644 "${unpacked}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${unpacked}/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
