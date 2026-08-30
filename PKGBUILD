# Maintainer: Horváth Ákos <h dot akos0322 at gmail dot com>
pkgname=cores
pkgver=0.42.1
pkgrel=1
pkgdesc="Modern hardware monitor with remote monitoring support"
arch=('x86_64')
url="https://github.com/Levminer/cores"
license=('GPL-3.0-only')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'librsvg' 'hicolor-icon-theme')
makedepends=('rust' 'cargo' 'nodejs' 'npm' 'git')
provides=('coresd')
# makepkg's default "lto" option injects -flto=auto into CFLAGS/CXXFLAGS;
# that breaks the bundled C builds inside aws-lc-sys/libsqlite3-sys (their
# static libs come out as LTO bytecode that the final, non-LTO link step
# can't resolve, producing undefined-symbol linker errors). The Rust side
# already does its own LTO via the workspace's [profile.release] settings.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/skarab1/cores/archive/refs/tags/$pkgver.tar.gz"
        "coresd.service"
        "cores.desktop")
sha256sums=('a007dcc90581a81f2974b4c8c67f3881f35578807c77247f71204118492f6821'
            '3969376c4dd541eafd49c1080c874d07aa813c47527840e6c94c5ce30b016406'
            'd4d1e134e176141d32d3967eae1268079b21fef47aef2ef6f4040fdcabed48c6')

build() {
    cd "$pkgname-$pkgver"

    # Daemon (coresd): plain release build, no Tauri involved.
    cargo build --release --locked --manifest-path platforms/unix/daemon/Cargo.toml

    # Tauri's sidecar embedding expects the daemon binary suffixed with the
    # rustc host target triple, matching upstream's own CI build step
    install -Dm755 target/release/coresd \
        "target/release/coresd-$(rustc -vV | sed -n 's/host: //p')"

    # JS workspace deps + frontend bundle + build metadata consumed by the UI
    npm ci
    node scripts/buildNumber.cjs release false
    npm run build:app

    # Desktop app (cores): build directly with cargo instead of `tauri build`,
    # skipping the deb/rpm/appimage bundler entirely (the appimage step
    # downloads third-party linuxdeploy binaries at build time, which we
    # don't want, and we don't need the deb/rpm outputs either).
    # --features tauri/custom-protocol matches what tauri-cli passes in release mode.
    cargo build --release --locked --bins --features tauri/custom-protocol \
        --manifest-path platforms/core/Cargo.toml
}

package() {
    cd "$pkgname-$pkgver"

    # Tauri resolves the "coresd" sidecar relative to the running executable's
    # own directory at runtime, so both binaries must live side by side.
    local host="$(rustc -vV | sed -n 's/host: //p')"
    install -Dm755 target/release/cores "$pkgdir/usr/bin/cores"
    install -Dm755 "target/release/coresd-$host" "$pkgdir/usr/bin/coresd-$host"
    ln -s "coresd-$host" "$pkgdir/usr/bin/coresd"

    # Optional systemd unit for running coresd standalone (e.g. for remote
    # monitoring without the desktop app running); not enabled by default.
    install -Dm644 "$srcdir/coresd.service" "$pkgdir/usr/lib/systemd/system/coresd.service"

    install -Dm644 "$srcdir/cores.desktop" "$pkgdir/usr/share/applications/cores.desktop"
    install -Dm644 platforms/core/icons/icon.png \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/cores.png"

    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
