# Maintainer: VisorCraft LLC <packages@visorcraft.com>
# SPDX-FileCopyrightText: 2026 VisorCraft LLC
# SPDX-License-Identifier: 0BSD
# GPG keys: https://github.com/visorcraft.gpg

pkgname=caishen
pkgver=1.1.0
pkgrel=1
pkgdesc="Local-first, always-encrypted household financial ledger"
arch=('x86_64')
url="https://github.com/visorcraft/CaiShen"
license=('GPL-3.0-only')
depends=(
    'cairo'
    'dbus'
    'gdk-pixbuf2'
    'glib2'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'libgcc'
    'libsoup3'
    'wayland'
    'webkit2gtk-4.1'
)
makedepends=(
    'cargo'
    'git'
    'nodejs'
    'npm'
    'pkgconf'
)
checkdepends=(
    'python'
)
optdepends=(
    'podman: self-hosted TLS container stack via rootless Podman'
    'docker: self-hosted TLS container stack via Docker'
    'xdg-desktop-portal: native file pickers and link opening'
)
provides=('caishen-desktop' 'caishen-host')
conflicts=('caishen-bin' 'caishen-git')
options=('!lto')
source=("$pkgname::git+$url#tag=v$pkgver?signed")
sha256sums=('53b0a9112a6153151295ca5882712f3bbf673a0a3da61a6a5cf6a4af673843d9')
validpgpkeys=('198BC500E85FE8B2C24227B90526453161165CE5')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    export npm_config_cache="$srcdir/npm-cache"
    cd "$pkgname"
    npm --prefix ui ci
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export npm_config_cache="$srcdir/npm-cache"
    export npm_config_offline=true
    cd "$pkgname"
    npm --prefix ui run build
    cargo build --release --frozen -p caishen-desktop -p caishen-host
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname"
    python3 -B scripts/check_locale_sync.py
    cargo test -p caishen-core --no-default-features --release --frozen
}

package() {
    cd "$pkgname"

    install -Dm755 target/release/caishen-desktop -t "$pkgdir/usr/bin/"
    install -Dm755 target/release/caishen -t "$pkgdir/usr/bin/"

    install -Dm644 packaging/org.visorcraft.caishen.desktop -t \
        "$pkgdir/usr/share/applications/"
    install -Dm644 packaging/org.visorcraft.caishen.metainfo.xml -t \
        "$pkgdir/usr/share/metainfo/"

    for size in 32 128 256 512; do
        install -Dm644 "apps/desktop/icons/${size}x${size}.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/org.visorcraft.caishen.png"
    done

    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
