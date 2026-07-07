# Maintainer: Renat Gorbushin <lis@lis314.ru>
pkgname=kaeru-mcp
pkgver=0.4.1
pkgrel=2
pkgdesc="Cross-agent cognitive engine for LLM agents"
arch=('x86_64')
url="https://github.com/LamantinAI/kaeru"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('rust' 'clang' 'git')
source=("${pkgname}::git+${url}.git#tag=v${pkgver}"
        "kaeru-mcp.service")
sha256sums=('0368109ae17fc8bffc24d71dcd019274f38249588ea3f7e229a2ef618e16f32c'
            '7903bf86742dee200aaf362888a9446282aecd113dbbbb29768fd8ef5044c1ad')

build() {
    cd "${srcdir}/${pkgname}"

    export MAKEFLAGS="--jobs=$(nproc)"
    # GCC 16 no longer makes uint64_t/uint32_t available via 
    # transitive includes — the bundled RocksDB in cozorocks-0.1.7 has 
    # dozens of headers that rely on this.
    # Also strips the srcdir from C++ debug info embedded by cozorocks/cxx bridge
    export CXXFLAGS="$CXXFLAGS -march=native -include cstdint -ffile-prefix-map=$srcdir=/build"
    export RUSTFLAGS="--remap-path-prefix=$srcdir=/build --remap-path-prefix=$HOME/.cargo=/cargo -C target-cpu=native"
    
    cargo build -p kaeru-mcp --release
}

package() {
    cd "${srcdir}/${pkgname}"

    install -Dm755 target/release/kaeru-mcp "${pkgdir}/usr/bin/kaeru-mcp"
    install -Dm644 ../kaeru-mcp.service "${pkgdir}/usr/lib/systemd/user/kaeru-mcp.service"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
