# Maintainer: Alexandre Fiori <fiorix@gmail.com>
#
# Template. The version and checksum below are filled in by
# packaging/arch/make-aur-package.sh, which renders this into a publishable
# PKGBUILD + .SRCINFO. The version lives in the git tag, never here: a hardcoded
# pkgver is what left the previous checked-in PKGBUILD stranded at 0.4.0.

pkgname=sdme
pkgver=0.17.2
pkgrel=1
pkgdesc='The systemd machine editor'
arch=('x86_64' 'aarch64')
url='https://sdme.io'
license=('MIT')
# systemd-nspawn and machinectl ship inside Arch's systemd package, so there is
# no separate systemd-container to depend on as there is on Debian and Fedora.
depends=('systemd>=255')
optdepends=(
    'qemu-base: QCOW2 disk image import support'
    'apparmor: security profile support'
)
makedepends=('cargo')
backup=('etc/apparmor.d/sdme-default')
install=sdme.install
# makepkg enables lto by default and puts -flto=auto in CFLAGS/LDFLAGS. The cc
# crate passes those through, so ring and zstd-sys compile their C to LLVM
# bitcode that the final rustc link cannot resolve (undefined ZSTD_freeCCtx,
# ring_core_*). Cargo already applies its own LTO per the release profile.
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/fiorix/sdme/archive/v$pkgver.tar.gz")
sha256sums=('16df3b3a1d4bf45c37ffce0c61ce53639af4104eeb94ce26fed5a7dffa99ec33')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    # Deliberately no --target. build.rs spawns a nested `cargo build --features
    # probe` that does not inherit --frozen, so the optional probe deps (tonic,
    # prost, tokio) have to be in the registry cache already or build() reaches
    # for the network behind cargo's back.
    cargo fetch --locked
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # Provenance marker: makes `sdme upgrade` defer to pacman instead of
    # overwriting the pacman-owned binary.
    export SDME_CHANNEL=aur
    # Default features only. --all-features would enable `probe`, which builds
    # sdme-kube-probe as a second binary; build.rs already embeds it.
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    # Keep probe-less test artifacts away from the release binary package().
    CARGO_TARGET_DIR=target/package-tests SDME_SKIP_PROBE=1 cargo test --frozen
}

package() {
    cd "$pkgname-$pkgver"

    # Backstop: require the validated probe artifact consumed by include_bytes!.
    # Binary size is not a reliable proxy because the probe-less binary itself
    # can exceed the old threshold.
    local probe
    probe=$(find target/release/build -path '*/out/sdme-kube-probe' \
        -type f -size +0c -print -quit)
    if [[ -z "$probe" ]]; then
        echo "error: no embedded kube probe artifact found" >&2
        return 1
    fi

    install -Dm755 target/release/sdme "$pkgdir/usr/bin/sdme"

    target/release/sdme config completions bash |
        install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/sdme"
    target/release/sdme config completions zsh |
        install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_sdme"
    target/release/sdme config completions fish |
        install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/sdme.fish"

    target/release/sdme config apparmor-profile |
        install -Dm644 /dev/stdin "$pkgdir/etc/apparmor.d/sdme-default"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
