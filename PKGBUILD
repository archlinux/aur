# Maintainer: Renat Gorbushin <lis@lis314.ru>
pkgname=kaeru-mcp
pkgver=0.4.1
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
sha256sums=('cee2f048a0c1ab6eebab213bc3927c5face68ee82dbd852ee36779899f7b361f'
            '7903bf86742dee200aaf362888a9446282aecd113dbbbb29768fd8ef5044c1ad')

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

    install -Dm755 target/release/kaeru-mcp "${pkgdir}/usr/bin/kaeru-mcp"
    install -Dm644 ../kaeru-mcp.service "${pkgdir}/usr/lib/systemd/user/kaeru-mcp.service"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
