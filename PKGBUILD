# Maintainer: Renat Gorbushin <lis@lis314.ru>pkgname=amd-container-toolkit
pkgname=kaeru-mcp
pkgver=0.4.0
pkgrel=1
pkgdesc="Cross-agent cognitive engine for LLM agents"
arch=('x86_64')
url="https://github.com/LamantinAI/kaeru"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('rust' 'clang')
_srcname=kaeru
source=("${pkgname}-${pkgver}.tar.gz"::https://github.com/LamantinAI/kaeru/archive/refs/tags/v${pkgver}.tar.gz
        "kaeru-mcp.service")
sha256sums=('e896dc6378e1ad4c8c700af4a3cf4e0d38b7943fbb413ad2435aeddca034d8de'
            '06dfc9aa8d89f28ac8b2517a9034fe70508c7afdce76d8fb944665a7e0b94492')

build() {
    cd "${srcdir}/${_srcname}-${pkgver}"

    # GCC 16 no longer makes uint64_t/uint32_t available via 
    # transitive includes — the bundled RocksDB in cozorocks-0.1.7 has 
    # dozens of headers that rely on this.
    # Also strips the srcdir from C++ debug info embedded by cozorocks/cxx bridge
    CXXFLAGS="$CXXFLAGS -include cstdint -ffile-prefix-map=$srcdir=/build" \
    RUSTFLAGS="--remap-path-prefix=$srcdir=/build --remap-path-prefix=$HOME/.cargo=/cargo" \
        cargo build -p kaeru-mcp --release
}

package() {
    cd "${srcdir}/${_srcname}-${pkgver}"

    install -Dm755 target/release/kaeru-mcp "${pkgdir}/usr/local/bin/kaeru-mcp"
    install -Dm644 ../kaeru-mcp.service "${pkgdir}/usr/lib/systemd/user/kaeru-mcp.service"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
