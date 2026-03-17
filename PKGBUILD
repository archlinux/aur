# Maintainer: neycrol <330578697@qq.com>
# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Kyle De'Vir (QuartzDragon) <kyle.devir.33@proton.me>

pkgname=bcachefs-tools-git
pkgname=(bcachefs-tools-git bcachefs-dkms-git)
_pkgname=bcachefs-tools
# Keep epoch=1 to preserve upgrade ordering from the previous date-based
# VCS pkgver scheme used in AUR history.
epoch=1
pkgver=1.37.2.r0.g82c7fba
pkgrel=1
pkgdesc="Bcachefs userspace tools (Git version)"
arch=('x86_64')
url="https://github.com/koverstreet/bcachefs-tools"
license=('GPL-2.0-only')
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
    'jq'
    'llvm'
    'pkgconf'
)

source=("git+https://github.com/koverstreet/bcachefs-tools.git")
sha256sums=('SKIP')

_common_make_args=(
    PREFIX=/usr
    ROOT_SBINDIR=/usr/bin
    LIBEXECDIR=/usr/lib
    INITRAMFS_DIR=/usr/lib/initcpio
    CARGO_ARGS=--locked
)

pkgver() {
    cd "$_pkgname"
    git describe --long --abbrev=7 --tags 2>/dev/null \
        | sed 's/^v//;s/[^-]*-g/r&/;s/-/./g' \
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
    local -a make_args=("${_common_make_args[@]}")

    make "${make_args[@]}" all
}

package_bcachefs-tools-git() {
    provides=("bcachefs-tools=${pkgver%%.r*}")
    conflicts=(bcachefs-tools)

    cd "$_pkgname"
    local -a make_args=("${_common_make_args[@]}" "DESTDIR=$pkgdir")

    # run install but not install_dkms
    make "${make_args[@]}" install -o install_dkms

    # replace incompatible initcpio hooks
    rm -rf "$pkgdir"/usr/lib/initcpio/*
    install -Dm644 arch/etc/initcpio/hooks/bcachefs -t "$pkgdir/usr/lib/initcpio/hooks"
    install -Dm644 arch/etc/initcpio/install/bcachefs -t "$pkgdir/usr/lib/initcpio/install"

    # Shell completions
    "$pkgdir/usr/bin/bcachefs" completions bash \
        | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/bcachefs"
    "$pkgdir/usr/bin/bcachefs" completions fish \
        | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/bcachefs.fish"
    "$pkgdir/usr/bin/bcachefs" completions zsh \
        | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_bcachefs"
}

package_bcachefs-dkms-git() {
    pkgdesc="Bcachefs out-of-tree module (Git version)"
    depends=(
        dkms
    )
    provides=("bcachefs-dkms=${pkgver%%.r*}")
    conflicts=(bcachefs-dkms)

    cd "$_pkgname"
    local -a make_args=("${_common_make_args[@]}" "DESTDIR=$pkgdir")

    make "${make_args[@]}" install_dkms
}
