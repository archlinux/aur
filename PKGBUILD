# Maintainer: RiverOnVenus <aur@zhui.dev>
pkgname=shisa
pkgver=0.1.7
pkgrel=1
pkgdesc='App lock for KDE Plasma 6 on Wayland: hides private windows and gates launches via fanotify'
arch=('x86_64')
url='https://github.com/RiverOnVenus/Shisa'
license=('GPL-3.0-or-later')
depends=('polkit' 'dbus' 'webkit2gtk-4.1' 'gtk3' 'hicolor-icon-theme')
makedepends=('cargo' 'nodejs' 'npm')
optdepends=(
    'noto-fonts-cjk: Chinese UI font'
)
install=shisa.install
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('d63a6495694a74b6c487a4c2f7109e43bb5f03b4105cffba21bf25ed256aa35b')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked
    ( cd gui/shisa-settings/src-tauri && cargo fetch --locked )
    ( cd gui/shisa-settings && npm ci --cache "$srcdir/npm-cache" --no-audit --no-fund )
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    # Keep build paths out of the binaries so the package does not mention
    # the build directory.
    export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/build/shisa --remap-path-prefix=$HOME/.cargo=/build/cargo"
    # The settings window is a Tauri app. Its frontend is built here so the
    # package is built from source rather than from a prebuilt bundle.
    ( cd gui/shisa-settings && npm run build )
    cargo build --release --frozen
    ( cd gui/shisa-settings/src-tauri && cargo build --release --frozen --features custom-protocol )
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --workspace --release --frozen
    ( cd gui/shisa-settings && npm test )
    ( cd gui/shisa-settings/src-tauri && cargo test --release --frozen )
    node --test crates/shisa-agent/tests/*.test.mjs
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 target/release/shisad "$pkgdir/usr/bin/shisad"
    install -Dm755 target/release/shisa "$pkgdir/usr/bin/shisa"
    install -Dm755 target/release/shisa-agent "$pkgdir/usr/bin/shisa-agent"
    install -Dm755 gui/shisa-settings/src-tauri/target/release/shisa-settings \
        "$pkgdir/usr/bin/shisa-settings"

    install -Dm644 data/shisad.service "$pkgdir/usr/lib/systemd/system/shisad.service"
    install -Dm644 data/shisa-agent.service "$pkgdir/usr/lib/systemd/user/shisa-agent.service"

    install -Dm644 data/io.github.RiverOnVenus.Shisa.policy \
        "$pkgdir/usr/share/polkit-1/actions/io.github.RiverOnVenus.Shisa.policy"
    install -Dm644 data/49-shisa-admin.rules \
        "$pkgdir/usr/share/polkit-1/rules.d/49-shisa-admin.rules"
    install -Dm644 data/shisa-lock.sysusers \
        "$pkgdir/usr/lib/sysusers.d/shisa-lock.conf"
    install -Dm644 data/io.github.RiverOnVenus.Shisa.conf \
        "$pkgdir/usr/share/dbus-1/system.d/io.github.RiverOnVenus.Shisa.conf"
    install -Dm644 data/shisa-remark.hook "$pkgdir/usr/share/libalpm/hooks/90-shisa-remark.hook"
    install -Dm644 data/io.github.RiverOnVenus.Shisa.desktop \
        "$pkgdir/usr/share/applications/io.github.RiverOnVenus.Shisa.desktop"

    install -Dm644 data/icons/shisa.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.RiverOnVenus.Shisa.svg"
    install -Dm644 data/icons/shisa.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.RiverOnVenus.Shisa-launcher.svg"
    for size in 16x16 22x22; do
        install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/$size/status" data/icons/"$size"/*.svg
    done
    install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/status" data/icons/22x22/*.svg

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
