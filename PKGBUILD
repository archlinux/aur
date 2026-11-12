# Maintainer: danalec
pkgname=rgy-search-git
pkgver=r20261112.rea9814f
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
    # The flags go into the TARGET's own variable, not RUSTFLAGS: the
    # per-target ones are the flags of the target's own artifacts, and
    # RUSTFLAGS reaches every target the build makes. The form is cargo's
    # own ("-C target-cpu=..."), which is what the tree's release build
    # uses for the same three variants.
    #
    # The build command is the tree's release build's own: --workspace and
    # an explicit --target. The explicit target is not decoration: it is
    # what puts the binaries under target/<triple>/release, and what the
    # build scripts see as the target they are building for.
    #
    # CFLAGS is replaced on purpose, for two measured reasons.
    #
    #  * Arch's CFLAGS carry `-flto=auto`, and the tree's only C library
    #    is mimalloc: the `cc` crate compiles it with those flags, the
    #    objects come out as LTO bitcode, and rust-lld cannot read them --
    #    the link then fails with "undefined symbol: mi_free". MEASURED on
    #    the CachyOS box on 2026-11-12.
    #  * Arch's CFLAGS carry `-march=native`, which would bake THIS
    #    machine's instructions into a package that is meant to be built
    #    on the machine that will run it. The `-march` here is the one
    #    the detection chose, so the C half and the Rust half are built
    #    for the same CPU.
    CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_RUSTFLAGS="-C target-cpu=$target" \
    CARGO_BUILD_JOBS="$(nproc)" \
    MAKEFLAGS="" \
    CFLAGS="-O3 -march=$target -pipe -fno-plt" \
    CXXFLAGS="-O3 -march=$target -pipe -fno-plt" \
    cargo build --release --locked --workspace --target x86_64-unknown-linux-gnu
}

package() {
    cd "$srcdir/rgy"
    install -Dm755 target/x86_64-unknown-linux-gnu/release/searchctl "${pkgdir}/usr/bin/searchctl"
    install -Dm755 target/x86_64-unknown-linux-gnu/release/searchd "${pkgdir}/usr/bin/searchd"
    install -Dm755 target/x86_64-unknown-linux-gnu/release/rgy-autostart "${pkgdir}/usr/bin/rgy-autostart"
    install -Dm755 target/x86_64-unknown-linux-gnu/release/rgxy "${pkgdir}/usr/bin/rgxy"
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
