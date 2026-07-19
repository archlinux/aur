# Maintainer: Chokri Hammedi (blue0x1)

pkgname=nimux
pkgver=1.0.2
pkgrel=1
pkgdesc='Pure-Nim network enumeration, remote execution, and MCP toolkit'
arch=('x86_64')
url='https://github.com/blue0x1/nimux'
license=('AGPL-3.0-only')
depends=('krb5' 'mingw-w64-gcc' 'nim' 'openssl')
makedepends=('nim')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/blue0x1/nimux/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e630014d2a18cee58abe81023c6fc47910b403f684515294569a359dd244ed09')

build() {
  cd "${pkgname}-${pkgver}"

  make SETCAP=0 linux
  nim c -d:release --opt:speed --nimcache:.nimcache/mcp \
    -o:nimux_mcp integrations/mcp/nimux-mcp/nimux_mcp.nim
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 nimux "${pkgdir}/usr/bin/nimux"
  install -Dm755 nimux_mcp "${pkgdir}/usr/bin/nimux_mcp"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 integrations/COMMAND_SURFACE.md "${pkgdir}/usr/share/doc/${pkgname}/COMMAND_SURFACE.md"
  install -Dm644 integrations/mcp/README.md "${pkgdir}/usr/share/doc/${pkgname}/mcp/README.md"
  install -Dm644 integrations/mcp/nimux-mcp/policy.example.json "${pkgdir}/usr/share/doc/${pkgname}/mcp/policy.example.json"
}
