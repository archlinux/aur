# Maintainer: Renat Gorbushin <lis@lis314.ru>
pkgname=kaeru-mcp
pkgver=0.7.2
pkgrel=1
pkgdesc="Cross-agent cognitive engine for LLM agents"
arch=('x86_64')
url="https://github.com/LamantinAI/kaeru"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('rust' 'clang' 'git')
source=("${pkgname}::git+${url}.git#tag=v${pkgver}"
        "kaeru-mcp.service")
sha256sums=('40a0945df162a249f55faead4b64958221f63b079ab21dd97d5801e605d73e69'
            '7903bf86742dee200aaf362888a9446282aecd113dbbbb29768fd8ef5044c1ad')

build() {
    cd "${srcdir}/${pkgname}"

    export MAKEFLAGS="--jobs=$(nproc)"
    # GCC 16 no longer makes uint64_t/uint32_t available via
    # transitive includes — the bundled RocksDB in cozorocks-0.1.7 has
    # dozens of headers that rely on this. This is a C++ (<cstdint>) header
    # problem only — do NOT put -include cstdint in CFLAGS, it breaks
    # ring's .S/.c sources (cc has no C++ include path for it).
    # Also strips the srcdir from debug info embedded by cozorocks/cxx bridge.
    # No -march=native / -C target-cpu=native: those tie the resulting
    # binary to the exact CPU of whatever machine runs makepkg — not
    # reproducible across machines.
    export CFLAGS="$CFLAGS -ffile-prefix-map=$srcdir=/build"
    export CXXFLAGS="$CXXFLAGS -include cstdint -ffile-prefix-map=$srcdir=/build"
    export RUSTFLAGS="--remap-path-prefix=$srcdir=/build --remap-path-prefix=$HOME/.cargo=/cargo"

    cargo build -p kaeru-mcp --release --locked
}

package() {
    cd "${srcdir}/${pkgname}"

    install -Dm755 target/release/kaeru-mcp "${pkgdir}/usr/bin/kaeru-mcp"
    install -Dm644 ../kaeru-mcp.service "${pkgdir}/usr/lib/systemd/user/kaeru-mcp.service"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
