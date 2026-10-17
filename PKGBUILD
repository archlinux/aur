# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=codebase-memory-mcp
pkgver=0.12.1
pkgrel=1
pkgdesc="High-performance code intelligence MCP server with persistent knowledge graph"
arch=('x86_64' 'aarch64')
url="https://github.com/DeusData/codebase-memory-mcp"
license=('MIT')
depends=('glibc' 'gcc-libs' 'zlib')
optdepends=('git: git-history change-coupling analysis')
conflicts=("${pkgname}-bin" "${pkgname}-ui-bin" "${pkgname}-git")
options=('!lto' '!debug')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1b4b1aa2857625dfedd3980cb297d155551ac7687e46111190498505c8b0b98b')

build() {
    cd "${pkgname}-${pkgver}"

    # -Wno-error: upstream's -Werror trips on benign warnings under Arch's
    # newer GCC. CBM_VERSION stamps the --version string. Makefile.cbm no
    # longer wires up libgit2 (0.12.0), so the old LIBGIT2_* overrides are gone.
    # 0.12.0 also turned on mimalloc's global malloc override for Linux, whose
    # upstream binaries are fully static. Linked dynamically, the system
    # libstdc++'s own constructor reaches free() (glibc newlocale) before
    # mimalloc is initialized and every run segfaults at startup, so keep the
    # override off, as upstream does on macOS.
    make -j"$(nproc)" -f Makefile.cbm cbm \
        CFLAGS_EXTRA="-DCBM_VERSION=\"\\\"${pkgver}\\\"\" -Wno-error" \
        MIMALLOC_OVERRIDE_DEFINE= GLOBAL_OVERRIDE_DEFINE=
}

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm755 build/c/codebase-memory-mcp "${pkgdir}/usr/bin/codebase-memory-mcp"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
