# Maintainer: Rotko Networks <hq@rotko.net>
#
# Canonical, in-repo source of truth for the AUR package. The workflow at
# .github/workflows/aur.yml copies this file into the AUR repo whenever it
# changes on main. Do not hand-edit the AUR copy.
#
# zomp is a rolling fork: main is a rebased commit series on top of upstream
# oh-my-pi, so this is a -git package. pkgver() reads the checkout, which means
# upstream moving — or the series being rewritten under it — never needs a new
# release here.
pkgname=zomp-git
# Snapshot only: makepkg recomputes this with pkgver() at build time, and the
# .SRCINFO the AUR ships is generated from the same function.
pkgver=v18.1.17.r211.g565d82c
pkgrel=1
pkgdesc="Fork of oh-my-pi (omp) that runs tool calls through zish's kernel sandbox (git build)"
arch=('x86_64' 'aarch64')
url="https://github.com/rotkonetworks/zomp"
license=('MIT')
# gcc-libs: the bundled pi_natives addon links libstdc++/libgcc at runtime.
depends=('glibc' 'gcc-libs')
# rustup (not rust): rust-toolchain.toml pins nightly-2026-08-08, and rustup is
# what honors it. cmake/make build the C dependencies of pi_natives.
makedepends=('git' 'bun' 'rustup' 'cmake' 'make')
optdepends=('zish: kernel-enforced (Landlock+seccomp) sandbox for the external-shell backend'
            'chromium: browser tool (headless web automation)'
            'python: persistent Python eval cells')
provides=('omp' 'oh-my-pi')
conflicts=('omp' 'oh-my-pi' 'oh-my-pi-git' 'oh-my-pi-bin')
# !lto is required, not cosmetic: makepkg appends LTOFLAGS (-flto=auto) to
# CFLAGS/LDFLAGS, and GCC's LTO at link time drops the C dependencies of the
# bundled pi_natives addon (oniguruma, PCRE2, tree-sitter) from the cdylib. The
# addon then loads with `undefined symbol: ts_node_is_missing` and every command
# that touches natives — the bash tool included — dies. The artifact is a Bun
# single-file executable: stripping or debug-splitting it corrupts the embedded
# runtime.
options=('!lto' '!strip' '!debug')
source=("$pkgname::git+https://github.com/rotkonetworks/zomp.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    local desc
    # v18.1.17-211-g565d82c → v18.1.17.r211.g565d82c
    if desc="$(git describe --tags --long --abbrev=7 2>/dev/null)"; then
        printf '%s' "$desc" | sed 's/-\([0-9]\+\)-g/.r\1.g/'
    else
        printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    fi
}

build() {
    cd "$pkgname"
    bun install --frozen-lockfile

    # pi_natives addon through napi + cargo. The `ci` profile is the one release
    # CI builds the shipping addons with (see .github/workflows/ci.yml): the
    # default `local` profile — thin LTO plus incremental compilation — emits a
    # cdylib whose tree-sitter symbols stay unresolved, and loading the addon
    # then dies with `undefined symbol: ts_node_is_missing`.
    OMP_NATIVE_CARGO_PROFILE=ci bun run build:native

    # Compiles src/cli.ts into a single-file executable with the addon and the
    # generated tool views embedded; writes packages/coding-agent/dist/omp.
    bun --cwd=packages/coding-agent run build
}

# No check(): upstream's test suite drives the full agent (natives, PTY, network)
# and is run in CI; packaging should not gate a user's install on it. The build
# itself already fails on a broken checkout.

package() {
    cd "$pkgname"
    local _omp="$pkgdir/usr/bin/omp"
    install -Dm755 packages/coding-agent/dist/omp "$_omp"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Shell completions generated from the live CLI metadata. The Bun binary
    # needs a writable HOME for its extraction cache.
    export HOME="$srcdir/.omp-home"
    install -dm755 "$HOME"
    install -dm755 "$pkgdir/usr/share/bash-completion/completions"
    "$_omp" completions bash > "$pkgdir/usr/share/bash-completion/completions/omp" 2>/dev/null \
        || rm -f "$pkgdir/usr/share/bash-completion/completions/omp"
    install -dm755 "$pkgdir/usr/share/zsh/site-functions"
    "$_omp" completions zsh > "$pkgdir/usr/share/zsh/site-functions/_omp" 2>/dev/null \
        || rm -f "$pkgdir/usr/share/zsh/site-functions/_omp"
    install -dm755 "$pkgdir/usr/share/fish/vendor_completions.d"
    "$_omp" completions fish > "$pkgdir/usr/share/fish/vendor_completions.d/omp.fish" 2>/dev/null \
        || rm -f "$pkgdir/usr/share/fish/vendor_completions.d/omp.fish"
}
