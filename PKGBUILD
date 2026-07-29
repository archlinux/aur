# Maintainer: Jos Dehaes <jos dot dehaes at gmail dot com>

pkgname=yserver
pkgver=1.4.0
pkgrel=1
pkgdesc='A modern X11 server written from scratch in Rust (DRM/KMS + Vulkan)'
url='https://github.com/joske/yserver'
arch=('x86_64' 'aarch64')
license=('MIT')
# Runtime dependencies nothing can infer from the ELF headers:
#   vulkan-icd-loader — ash dlopen()s libvulkan.so.1 at runtime
#   xorg-xauth        — starty(1) execs xauth and refuses to start without it
#   xkeyboard-config  — xkbcommon reads the rules/keymaps from disk
# NOT seatd: yserver dropped libseat and opens /dev/dri and /dev/input directly.
# mcookie (also needed by starty) comes from util-linux, which is part of base.
depends=('libgcc' 'glibc' 'libxshmfence' 'libxkbcommon' 'libinput' 'systemd-libs'
         'fontconfig' 'freetype2' 'vulkan-icd-loader' 'xorg-xauth' 'xkeyboard-config')
makedepends=('cargo' 'gcc' 'just' 'shaderc' 'pkgconf' 'scdoc')
# A Vulkan driver is required to render, but which one is hardware-dependent.
optdepends=('vulkan-driver: required Vulkan implementation for your GPU'
            'xorg-fonts-misc: core X11 bitmap fonts for legacy clients'
            'lightdm: graphical login (see the example drop-in in /usr/share/doc)')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Fill with `updpkgsums` once v1.4.0 is tagged. Not SKIP: that is for VCS
# sources, and a fixed tarball must be verified.
sha256sums=('6cf65ed1e13285b9a500560617bd01ad8ed9820562bb23946a959bbae7df7e3d')

# Rust LTO is controlled by the cargo profile, not makepkg's C toolchain flags.
options=('!lto')

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CARGO_INCREMENTAL=0
    # A release tarball has no .git, so without this the build script stamps
    # the literal string "unknown" into `yserver --version`.
    export YSERVER_GIT_COMMIT="v$pkgver"
    # --locked, not --frozen: --frozen also implies --offline, which would need
    # a separate `cargo fetch` in prepare(). Cargo.lock is still respected.
    #
    # No --target: it only matters for keeping makepkg's RUSTFLAGS off host
    # units (build scripts, proc macros), and this build.rs just execs glslc
    # and git. Omitting it leaves the binary in target/release, which is where
    # `just install` looks by default, so no TARGETDIR override is needed.
    cargo build --locked --release --bin yserver
    # Render the scdoc man pages. PREFIX is baked into their FILES sections, so
    # it has to match the prefix used in package().
    PREFIX=/usr just man
}

# No check(): the unit tests build, but the coverage that means anything for an
# X server (rendercheck, xts5) needs a GPU, KMS and input devices, none of which
# exist in a clean chroot. Running a subset would buy a green tick, not
# confidence — and a test that needs a device would fail every user's build.

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir" PREFIX=/usr just install

    # Arch keeps licences in /usr/share/licenses/$pkgname; relocate the generic
    # copy that `just install` stages into /usr/share/doc/yserver.
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    rm -f "$pkgdir/usr/share/doc/$pkgname/LICENSE"
}
