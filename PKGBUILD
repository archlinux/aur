# Maintainer: neycrol <330578697@qq.com>
# Contributor: Kyle De'Vir (QuartzDragon) <kyle.devir.33@proton.me>

pkgname=bcachefs-tools-git
_pkgname=bcachefs-tools
pkgver=20260202172648.r2332.gdbdb2f4c
pkgrel=1
pkgdesc="Bcachefs userspace tools (Git version) with FUSE support enabled"
arch=('x86_64')
url="https://github.com/koverstreet/bcachefs-tools"
license=('GPL-2.0-only')
provides=("$_pkgname")
conflicts=("$_pkgname")

depends=(
    'glibc'
    'libaio'
    'util-linux-libs'
    'keyutils'
    'libsodium'
    'liburcu'
    'zlib'
    'zstd'
    'lz4'
    'systemd-libs'
    'fuse3'
)
makedepends=(
    'git'
    'rust'
    'cargo'
    'clang'
    'llvm'
    'pkgconf'
)

source=("git+https://github.com/koverstreet/bcachefs-tools.git")
sha256sums=('SKIP')

# Disable LTO to prevent issues with Rust's ThinLTO
options=('!lto' '!debug')

pkgver() {
    cd "$_pkgname"
    git remote set-url origin "https://github.com/koverstreet/bcachefs-tools.git"
    local ref="HEAD"
    if git fetch --quiet origin; then
        if git rev-parse --verify -q origin/HEAD >/dev/null; then
            ref="origin/HEAD"
        elif git rev-parse --verify -q origin/master >/dev/null; then
            ref="origin/master"
        fi
    fi
    # Date/time + revcount + short hash keeps version ordering obvious for audit.
    printf "%s.r%s.g%s" \
        "$(git show -s --format=%cd --date=format:%Y%m%d%H%M%S "$ref")" \
        "$(git rev-list --count "$ref")" \
        "$(git rev-parse --short "$ref")"
}

prepare() {
    cd "$_pkgname"
    # Ensure a clean tree for reproducible patches.
    git reset --hard

    # Fetch Rust deps up front (helps offline builds later).
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"

    # Upstream no longer ships include/linux/types.h; keep prepare() clean.
}

build() {
    cd "$_pkgname"

    # Honor user toolchain flags and add reproducibility-friendly path remap.
    export RUSTFLAGS="${RUSTFLAGS} -C link-arg=${LDFLAGS} --remap-path-prefix=${srcdir}/=/"
    export CFLAGS="${CFLAGS} -fdebug-prefix-map=${srcdir}/=/"

    make \
        BCACHEFS_FUSE=1 \
        PREFIX=/usr \
        ROOT_SBINDIR=/usr/bin \
        LIBEXECDIR=/usr/lib \
        INITRAMFS_DIR=/usr/lib/initcpio \
        EXTRA_CFLAGS="${CFLAGS} -include linux/types.h" \
        all
    
    # Generate shell completions using the built binary
    local _bin="./target/release/bcachefs"
    if [ -x "$_bin" ]; then
        msg2 "Generating shell completions..."
        "$_bin" completions bash > bcachefs.bash
        "$_bin" completions zsh  > _bcachefs
        "$_bin" completions fish > bcachefs.fish
    fi
}

package() {
    cd "$_pkgname"

    make \
        BCACHEFS_FUSE=1 \
        PREFIX=/usr \
        ROOT_SBINDIR=/usr/bin \
        LIBEXECDIR=/usr/lib \
        INITRAMFS_DIR=/usr/lib/initcpio \
        DESTDIR="$pkgdir" \
        install

    # Remove DKMS sources installed by upstream makefile.
    # Userspace tools stay here; kernel module is provided elsewhere to avoid mismatches.
    rm -rf "$pkgdir/usr/src"

    # License
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Shell completions
    if [ -f bcachefs.bash ]; then
        install -Dm644 bcachefs.bash "$pkgdir/usr/share/bash-completion/completions/bcachefs"
        install -Dm644 _bcachefs      "$pkgdir/usr/share/zsh/site-functions/_bcachefs"
        install -Dm644 bcachefs.fish  "$pkgdir/usr/share/fish/vendor_completions.d/bcachefs.fish"
    fi
}
