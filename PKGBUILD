# Maintainer: Alexandre Fiori <fiorix@gmail.com>
#
# Versionless template. packaging/distros/arch/make-aur-package.sh renders the
# release version, pkgrel, source location, and checksum into the AUR metadata.

pkgname=chan-desktop
pkgver=0.79.1
pkgrel=1
pkgdesc='Desktop edition of the chan AI-native IDE'
# Native CI builds both architectures; aarch64 is observed-only for v0.73.0.
arch=('x86_64' 'aarch64')
url='https://chan.app'
license=('Apache-2.0')
# The GTK/WebKit stack is soname-derived. systemd carries the packaged user
# unit's runtime plus `chan devserver --service=systemd`, xdg-utils the
# `chan://` scheme handler, and gcc-libs the libgcc_s.so.1 the binary links;
# namcap's soname-only analysis cannot see the first two.
depends=(
    'gcc-libs'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'libayatana-appindicator'
    'librsvg'
    'libsoup3'
    'systemd'
    'webkit2gtk-4.1'
    'xdg-utils'
)
makedepends=('cargo' 'desktop-file-utils' 'nodejs' 'npm' 'pkgconf')
provides=("chan=$pkgver")
conflicts=('chan')
# Cargo owns thin LTO. makepkg's additional -flto=auto reaches native C/C++
# dependencies and can leave rustc unable to resolve their symbols at link time.
options=(!lto)
source=('chan-0.79.1.tar.gz::https://github.com/fiorix/chan/archive/v0.79.1.tar.gz')
sha256sums=('9637126bfdfd7e4ace1aa3857ef1fe39d336b4083b47450f39f3b25500b60a12')

# RUSTUP_TOOLCHAIN keeps the tree's rust-toolchain.toml pin from making a
# rustup-provided cargo download a second toolchain mid-build, per Arch's Rust
# packaging guidelines. A plain rust package ignores it.
prepare() {
    cd "chan-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    npm --prefix web ci
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "chan-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CHAN_PACKAGED=aur
    make web WEB_SKIP_INSTALL=1
    cargo build --frozen --release -p chan-desktop
}

check() {
    cd "chan-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CHAN_PACKAGED=aur
    cargo test --frozen --release -p chan-desktop
    desktop-file-validate packaging/distros/shared/chan-desktop.desktop
}

package() {
    cd "chan-$pkgver"
    install -Dm755 target/release/chan-desktop "$pkgdir/usr/bin/chan-desktop"
    ln -s chan-desktop "$pkgdir/usr/bin/chan"
    ln -s chan-desktop "$pkgdir/usr/bin/cs"

    install -Dm644 packaging/distros/shared/chan-desktop.desktop \
        "$pkgdir/usr/share/applications/chan-desktop.desktop"
    install -Dm644 desktop/src-tauri/icons/32x32.png \
        "$pkgdir/usr/share/icons/hicolor/32x32/apps/chan-desktop.png"
    install -Dm644 desktop/src-tauri/icons/64x64.png \
        "$pkgdir/usr/share/icons/hicolor/64x64/apps/chan-desktop.png"
    install -Dm644 desktop/src-tauri/icons/128x128.png \
        "$pkgdir/usr/share/icons/hicolor/128x128/apps/chan-desktop.png"
    install -Dm644 desktop/src-tauri/icons/128x128@2x.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/chan-desktop.png"
    install -Dm644 desktop/src-tauri/icons/icon.png \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/chan-desktop.png"
    install -Dm644 packaging/distros/shared/chan-devserver.service \
        "$pkgdir/usr/lib/systemd/user/chan-devserver.service"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/chan-desktop/LICENSE"
    install -Dm644 README.md CHANGELOG.md -t "$pkgdir/usr/share/doc/chan-desktop/"
}
