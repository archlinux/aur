# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: VisorCraft LLC <maintainer@visorcraft.com>
# SPDX-FileCopyrightText: 2026 VisorCraft LLC
# SPDX-License-Identifier: GPL-3.0-only
# Modified for a proper AUR release
# GPG keys: https://github.com/visorcraft.gpg

pkgname=grexa
pkgver=1.11.0
pkgrel=1
pkgdesc="Fast Linux file content search with tabs, replace, and AI assistance"
arch=(x86_64)
url="https://github.com/visorcraft/Grexa"
license=(GPL-3.0-only)
depends=(
    glibc
    libgcc      libgcc_s.so
    libstdc++   libstdc++.so
    qt6-base
    qt6-declarative
    kirigami
    hicolor-icon-theme
    poppler)
makedepends=(
    cargo
    pkgconf
    qt6-tools
    clang
    ninja
    git)
optdepends=(
    'podman: container search via rootless Podman'
    'docker: container search via Docker'
    'kwalletmanager: API key storage (KDE)'
    'gnome-keyring: API key storage (non-KDE)')
provides=(grexa-cli)
options=(!lto)
source=("$pkgname::git+$url#tag=v$pkgver?signed")
sha256sums=('aea2f49aecc37fbeb04d435cd2a91911845d5fc7225d8be15ed1d85169f2d8b7')
validpgpkeys=('198BC500E85FE8B2C24227B90526453161165CE5')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname"
    cargo fetch --locked --target host-tuple
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export LIBGIT2_NO_VENDOR=1
    cd "$pkgname"
    cargo build --workspace --release --frozen --all-features
    ./target/release/grexa-cli manpage > grexa-cli.1
    ./target/release/grexa-cli completions bash > grexa-cli.bash
    ./target/release/grexa-cli completions fish > grexa-cli.fish
    ./target/release/grexa-cli completions zsh > grexa-cli.zsh
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    export LIBGIT2_NO_VENDOR=1
    cd "$pkgname"
    cargo test --workspace --frozen
}

package() {
    cd "$pkgname"

    install -Dm755 target/release/grexa{,-cli} -t "$pkgdir/usr/bin/"

    install -Dm644 packaging/com.visorcraft.Grexa.desktop -t \
        "$pkgdir/usr/share/applications/"
    install -Dm644 packaging/com.visorcraft.Grexa.metainfo.xml -t \
        "$pkgdir/usr/share/metainfo/"
    install -Dm644 packaging/icons/scalable/com.visorcraft.Grexa.svg -t \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
    for size in 16 24 32 48 64 96 128 192 256 512; do
        install -Dm644 "packaging/icons/${size}x${size}/apps/com.visorcraft.Grexa.png" -t \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/"
    done

    install -Dm644 grexa-cli.1 -t    "$pkgdir/usr/share/man/man1/"

    install -Dm644 grexa-cli.bash    "$pkgdir/usr/share/bash-completion/completions/grexa-cli"
    install -Dm644 grexa-cli.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"
    install -Dm644 grexa-cli.zsh     "$pkgdir/usr/share/zsh/site-functions/_grexa-cli"

    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
