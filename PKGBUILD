# Maintainer: danalec
pkgname=rgy-search-git
pkgver=r0.1.10.4.35a94d7
pkgrel=1
pkgdesc="Whole-filesystem name search and content search in one stack (built from source, SIMD detected)"
arch=('x86_64')
url="https://github.com/danalec/rgy"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs')
makedepends=('cargo' 'rust' 'git')
provides=('rgy-search-bin')
conflicts=('rgy-search-bin' 'rgy-search-avx2-bin' 'rgy-search-znver4-bin')
# The source is the GitHub mirror, which carries the live tree: one flat
# commit, no history, refreshed at every release. The history lives on the
# Forgejo.
#
# The AUR does not build a git package: the user builds it, with
# `aurbuild`, on the machine that will run it -- which is the point of
# this package, because the build then happens on the CPU that will use
# it, and that CPU is the one whose SIMD is detected below.
source=('rgy::git+https://github.com/danalec/rgy.git')
sha256sums=('SKIP')
# The release profile strips the binaries itself (the tree's own
# `strip = true`), so pacman must not strip them a second time.
options=('!strip' '!debug')

pkgver() {
    cd "$srcdir/rgy"
    # The date and the commit: a git package's version has to change when
    # the tree does, and it has to say which tree it is.
    printf '%s.r%s\n' \
        "$(git log -1 --format=%cd --date=format:%Y%m%d)" \
        "$(git rev-parse --short HEAD)"
}

# The SIMD the machine has, as a target-cpu.
#
# The three binary packages are three builds of the same tree, one per
# instruction set, and a user has to know which one their CPU has. This
# package does not ask: it reads the CPU and picks.
#
#   * an AMD with avx512f gets `znver4` -- the Zen 4's and the Zen 5's
#     both carry it, and the tree's own znver4 build is the one that was
#     measured against them;
#   * anything else with avx2 gets `x86-64-v3` -- the AVX2 baseline,
#     which every Zen 3 and every recent Intel has;
#   * anything else gets `x86-64`, the portable build, which runs
#     everywhere.
#
# The flags come from /proc/cpuinfo, which is the kernel's own answer
# about the CPU it is running on.
_rgy_target_cpu() {
    local vendor flags
    vendor=$(grep -m1 '^vendor_id' /proc/cpuinfo | cut -d: -f2 | tr -d '[:space:]')
    flags=$(grep -m1 '^flags' /proc/cpuinfo)
    if [ "$vendor" = "AuthenticAMD" ] && grep -qw avx512f <<<"$flags"; then
        echo znver4
    elif grep -qw avx2 <<<"$flags"; then
        echo x86-64-v3
    else
        echo x86-64
    fi
}

build() {
    cd "$srcdir/rgy"
    local target
    target=$(_rgy_target_cpu)
    echo "the CPU carries $target"
    RUSTFLAGS="--target-cpu=$target" \
    CARGO_BUILD_JOBS="${MAKEFLAGS:-}" \
    cargo build --release --locked
}

package() {
    cd "$srcdir/rgy"
    install -Dm755 target/release/searchctl "${pkgdir}/usr/bin/searchctl"
    install -Dm755 target/release/searchd "${pkgdir}/usr/bin/searchd"
    install -Dm755 target/release/rgy-autostart "${pkgdir}/usr/bin/rgy-autostart"
    install -Dm755 target/release/rgxy "${pkgdir}/usr/bin/rgxy"
    ln -s searchctl "${pkgdir}/usr/bin/rgy"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 MANUAL.md "${pkgdir}/usr/share/doc/${pkgname}/MANUAL.md"
    install -Dm644 FORMATS.md "${pkgdir}/usr/share/doc/${pkgname}/FORMATS.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
    install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
    install -Dm644 NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}
