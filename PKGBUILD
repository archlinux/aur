# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=codebase-memory-mcp
pkgver=0.10.1
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
sha256sums=('3bcd3ef96390d8032b71c873e2f7413324e7876e351cc64d94d321a6c1aa5a8a')

build() {
    cd "${pkgname}-${pkgver}"

    # LIBGIT2 forced off: the HAVE_LIBGIT2 path uses git_allocator without
    # including <git2/sys/alloc.h> and won't compile. Upstream release binaries
    # are static/zero-dep with libgit2 off too; git history parsing falls back
    # to `git log`. -Wno-error: upstream's -Werror trips on benign warnings
    # under Arch's newer GCC. CBM_VERSION stamps the --version string.
    make -j"$(nproc)" -f Makefile.cbm cbm \
        CFLAGS_EXTRA="-DCBM_VERSION=\"\\\"${pkgver}\\\"\" -Wno-error" \
        LIBGIT2_LIBS= LIBGIT2_CFLAGS= LIBGIT2_FLAGS=
}

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm755 build/c/codebase-memory-mcp "${pkgdir}/usr/bin/codebase-memory-mcp"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
