# Maintainer: neycrol <330578697@qq.com>
# Contributor: Kyle De'Vir (QuartzDragon) <kyle.devir.33@proton.me>

pkgname=bcachefs-tools-git
_pkgname=bcachefs-tools
# Keep epoch=1 to preserve upgrade ordering from the previous date-based
# VCS pkgver scheme used in AUR history.
epoch=1
pkgver=1.36.1.r275.g8542892
pkgrel=4
pkgdesc="Bcachefs userspace tools (Git version) with FUSE support enabled"
arch=('x86_64')
url="https://github.com/koverstreet/bcachefs-tools"
license=('GPL-2.0-only')
provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

depends=(
    'bash'
    'fuse3'
    'libaio.so' 'libaio'
    'libblkid.so' 'libuuid.so' 'util-linux-libs'
    'libgcc'
    'libkeyutils.so' 'keyutils'
    'libsodium.so' 'libsodium'
    'liburcu'
    'libz.so' 'zlib'
    'libzstd.so' 'zstd'
    'lz4'
    'libudev.so' 'systemd-libs'
    'udev'
)
makedepends=(
    'git'
    'cargo'
    'clang'
    'llvm'
    'pkgconf'
    'valgrind'
)

source=("git+https://github.com/koverstreet/bcachefs-tools.git")
sha256sums=('SKIP')

_common_make_args=(
    BCACHEFS_FUSE=1
    PREFIX=/usr
    ROOT_SBINDIR=/usr/bin
    LIBEXECDIR=/usr/lib
    INITRAMFS_DIR=/usr/lib/initcpio
)

pkgver() {
    cd "$_pkgname"
    git describe --long --abbrev=7 --tags 2>/dev/null \
        | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
    || printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_pkgname"

    # Fetch Rust deps up front so build/package stages don't need to
    # download crates again when using --locked.
    cargo fetch --locked --target "$(rustc --print host-tuple)"

    # _Disable_ cross-toolchain LTO because we are using different toolchains
    # for C/C++ and Rust code (i.e., LLVM LTO is incompatible with GCC LTO).
    # In this project, C/C++ code is linked into Rust code. Therefore, apply
    # a workaround to force generation of normal object code on C side:
    CFLAGS+=" -ffat-lto-objects"
    CXXFLAGS+=" -ffat-lto-objects"
}

build() {
    cd "$_pkgname"
    local -a make_args=("${_common_make_args[@]}" "CARGO_ARGS=--locked")

    make "${make_args[@]}" all
}

package() {
    cd "$_pkgname"
    local -a make_args=("${_common_make_args[@]}" "CARGO_ARGS=--locked" "DESTDIR=$pkgdir")

    make "${make_args[@]}" install

    # Remove DKMS sources installed by upstream makefile.
    # Userspace tools stay here; kernel module is provided elsewhere to avoid mismatches.
    rm -rf "$pkgdir/usr/src"

    # License
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Shell completions
    install -dm755 "$pkgdir/usr/share/bash-completion/completions"
    install -dm755 "$pkgdir/usr/share/fish/vendor_completions.d"
    install -dm755 "$pkgdir/usr/share/zsh/site-functions"
    "$pkgdir/usr/bin/bcachefs" completions bash > "$pkgdir/usr/share/bash-completion/completions/bcachefs"
    "$pkgdir/usr/bin/bcachefs" completions fish > "$pkgdir/usr/share/fish/vendor_completions.d/bcachefs.fish"
    "$pkgdir/usr/bin/bcachefs" completions zsh > "$pkgdir/usr/share/zsh/site-functions/_bcachefs"
}
