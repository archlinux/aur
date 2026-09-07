# Maintainer: nmadhu <nitin@jaseci.org>
#
# jaclang-git: the self-contained native `jac` binary, built from the latest
# git HEAD of jaseci-labs/jaseci (NOT the prebuilt release binary).
#
# This is inspired by the upstream one-liner installer
# (scripts/install.sh), which ships a prebuilt `jac` binary downloaded from
# GitHub Releases. This package instead clones the source and builds that very
# same binary with the documented upstream command `cd jac && zig build`.
#
# The build produces ONE self-contained executable: a tiny Zig launcher with a
# private CPython + the jaclang runtime appended as a payload. At runtime it
# dlopens the bundled libpython, so the installed binary needs NO system Python,
# pip, uv, or llvmlite -- only glibc.
#
# HEAVY BUILD WARNING:
#   The build fetches over HTTP and needs ~10 GB free during build:
#     * a pinned LLVM 22.1.x slice (~80 MB) via `zig build fetch-llvm`
#     * a python-build-standalone tree (~600 MB download + extract)
#     * typeshed stdlib stubs
#     * zig dependencies (the fused neovim editor fork, mini.nvim, tree-sitter-jac)
#   So this package REQUIRES network access at build time. The pbs + LLVM trees
#   are cached in your zig global cache, so rebuilds after a `pkgver` bump are
#   much faster.
#
# To build a lighter binary WITHOUT the fused neovim editor (much faster, far
# fewer sub-dependencies, no `jac ninja` command), edit the build() line below
# to read:  zig build -Dno-ninja
#
# Toolchain: zig >= 0.16.0 (the version pinned in jac/build.zig.zon).

pkgname=jaclang-git
pkgver=0.37.7.r0.g3ad35097c9
pkgrel=1
pkgdesc="Jac programming language - self-contained native 'jac' binary built from git (Python-like syntax; compiles to Python bytecode, JavaScript, and native machine code; bundles its own CPython runtime)"
arch=('x86_64' 'aarch64')
url="https://github.com/jaseci-labs/jaseci"
license=('MIT')
depends=('glibc')
makedepends=(
  'git'
  'zig>=0.16.0'   # exact minimum pinned in jac/build.zig.zon
  'cmake'         # only needed for the fused neovim editor (skip with -Dno-ninja)
)
provides=('jac' 'jaclang')
conflicts=('jac' 'jaclang')
# NOTE: '!strip' is MANDATORY. The jac binary layout is
#   [ ELF launcher stub ][ runtime payload .tar.gz ][ 80-byte trailer ]
# makepkg's default strip would rewrite the ELF and drop the appended payload +
# trailer, producing a broken binary. (The build's OWN best-effort strip of the
# bundled libpython during packing is unaffected and still runs.)
options=('!strip' '!debug')
source=("git+https://github.com/jaseci-labs/jaseci.git")
sha256sums=('SKIP')

# Default branch (jaseci release tags follow v2.3.x; the jac binary itself
# reports its own 0.30.x version via `jac --version`).
_gitbranch=main

pkgver() {
    cd "$srcdir/jaseci"
    # e.g. tag v2.3.28 at HEAD  -> 2.3.28.r0.g<sha>
    #      5 commits past v2.3.27 -> 2.3.27.r5.g<sha>
    git describe --long --tags 2>/dev/null \
        | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
        || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/jaseci/jac"

    # Step 1: fetch the pinned LLVM 22.1.x slice and compile + statically link
    # the LLVMPY_* shim (jac/native/*.cpp) against it. The default release
    # binary REQUIRES this shim -- without it, mkpayload aborts with
    # "no LLVM shim (--shim)". ~80 MB download, a few minutes to link.
    zig build fetch-llvm

    # Step 2: the full binary. fetches python-build-standalone (~600 MB) +
    # typeshed over HTTP, builds the launcher stub (links libc only), assembles
    # the runtime payload (jaclang site + private CPython), and packs
    # [stub][payload.tar.gz][trailer] -> zig-out/bin/jac.
    # For a lighter build WITHOUT the neovim editor (much faster/smaller), use:
    #   zig build -Dno-ninja --summary all
    zig build --summary all
}

package() {
    cd "$srcdir/jaseci/jac"

    install -Dm755 "zig-out/bin/jac" "$pkgdir/usr/bin/jac"

    # The launcher materializes its CPython runtime into ~/.cache/jac/rt on
    # first run, so nothing else needs to ship under /usr.

    install -Dm644 "$srcdir/jaseci/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
