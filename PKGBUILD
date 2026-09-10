# Maintainer: coffee <catheadcoffee@gmail.com>
# narsil-mcp — Rust MCP server for deep code intelligence (postrv/narsil-mcp).
#
# Prebuilt release binaries for linux x86_64 + aarch64. Upstream CI builds
# them via .github/workflows/build-binaries.yml with `--features graph`
# (default "native" set plus the RDF/SPARQL graph tools). The release tarball
# contains only the already-stripped binary: mode 644, no docs, no LICENSE
# files — the licenses are fetched from the release tag instead.
#
# update.sh tracks new stable vX.Y.Z tags (pre-release -rcN tags are skipped)
# via git ls-remote and rewrites both per-arch checksum arrays. Keep those
# arrays on single lines: update.sh replaces each one wholesale, which also
# refreshes the license checksums when upstream edits them.

pkgname=narsil-mcp-bin
pkgver=1.7.0
pkgrel=1
pkgdesc="Rust MCP server for deep code intelligence: semantic search, call graphs, taint analysis, SBOM"
arch=('x86_64' 'aarch64')
url="https://github.com/postrv/narsil-mcp"
license=('MIT' 'Apache-2.0')
depends=('glibc' 'gcc-libs')
provides=('narsil-mcp')
conflicts=('narsil-mcp' 'narsil-mcp-git')

# Per-architecture sources: the release assets differ per arch, and makepkg
# pairs source_<arch> with <sum>sums_<arch> arrays — a generic source array
# must not be mixed with per-arch checksums (integrity check size mismatch).
#
# The arch names in these URLs are literal on purpose (not $CARCH): $CARCH
# is expanded once for the host arch, which would write the host asset URL
# into the other arch's .SRCINFO field. namcap's "use $CARCH" hint is a
# known false positive here.
_license_sources=(
  "LICENSE-MIT::https://raw.githubusercontent.com/postrv/narsil-mcp/v${pkgver}/LICENSE-MIT"
  "LICENSE-APACHE::https://raw.githubusercontent.com/postrv/narsil-mcp/v${pkgver}/LICENSE-APACHE"
)
source_x86_64=(
  "narsil-mcp-${pkgver}-linux-x86_64.tar.gz::https://github.com/postrv/narsil-mcp/releases/download/v${pkgver}/narsil-mcp-v${pkgver}-linux-x86_64.tar.gz"
  "${_license_sources[@]}"
)
source_aarch64=(
  "narsil-mcp-${pkgver}-linux-aarch64.tar.gz::https://github.com/postrv/narsil-mcp/releases/download/v${pkgver}/narsil-mcp-v${pkgver}-linux-aarch64.tar.gz"
  "${_license_sources[@]}"
)
# Both tarball hashes match the upstream .sha256 release assets; license
# hashes are identical for both architectures (tag content, arch-agnostic).
sha256sums_x86_64=('46986fe312f6fc1bb5fd57d028ee007a321a810084b7e0a6c6c66b337291f4f0' '22610661fd90ef80e47a421c4417fcd624c3e9571612d4f5e2401fd2b4fe68ef' '38140d0016ebc4e835fe7466764ec59e9bf8ae1678a9143a6bd3ebd87dcd32a6')
sha256sums_aarch64=('ef79328cf397f21a5ab24b9e932f0254043c9e5672bf7b9df66229fc44c76026' '22610661fd90ef80e47a421c4417fcd624c3e9571612d4f5e2401fd2b4fe68ef' '38140d0016ebc4e835fe7466764ec59e9bf8ae1678a9143a6bd3ebd87dcd32a6')

package() {
    # Tarball layout: a single ./narsil-mcp entry, already stripped by
    # upstream CI. Install fixes its 644 mode and runner/runner ownership.
    install -Dm755 "${srcdir}/narsil-mcp" "${pkgdir}/usr/bin/narsil-mcp"

    install -Dm644 "${srcdir}/LICENSE-MIT" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 "${srcdir}/LICENSE-APACHE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
