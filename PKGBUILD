# Maintainer: Pranav Kannepalli <pranav.kannepalli@gmail.com>
pkgname=archductor
pkgver=0.6.0
pkgrel=1
pkgdesc="Archductor parallel coding-agent workflow tool built around Git worktrees"
arch=('x86_64')
url="https://github.com/perceo-ai/conductor-arch"
license=('Apache-2.0')
# Runtime shell-outs (git/gh/ssh), the sqlite lib the sidecars link, plus the
# shared libraries Electron's bundled Chromium needs at runtime.
depends=('git' 'github-cli' 'openssh' 'sqlite'
         'gtk3' 'nss' 'alsa-lib' 'libxkbcommon' 'libnotify' 'libsecret')
# rust/cargo build the sidecars; nodejs/pnpm build + bundle the Electron GUI.
makedepends=('rust' 'cargo' 'pkgconf' 'nodejs' 'pnpm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ac18dd318b69419467ff6feea3fd83eb68d974279254eeb174a91d2df2025a8b')

build() {
    cd "conductor-arch-$pkgver"
    export LIBSQLITE3_SYS_USE_PKG_CONFIG=1

    # Rust sidecars: the `archductor` CLI and the `archcar` daemon. The Electron
    # bundle embeds these under resources/bin via electron-builder extraResources.
    cargo build --release --locked --workspace

    # Electron desktop GUI. `dist:dir` runs `vite build && electron-builder --dir`,
    # producing a self-contained app tree under desktop/release/linux-unpacked
    # (bundles its own Chromium + Node, matching the deb/rpm/AppImage output).
    export ELECTRON_CACHE="$srcdir/.cache/electron"
    export ELECTRON_BUILDER_CACHE="$srcdir/.cache/electron-builder"
    pnpm -C desktop install --frozen-lockfile
    pnpm -C desktop run dist:dir
}

package() {
    cd "conductor-arch-$pkgver"

    # Bundled Electron app tree lives in /opt (self-contained, like the deb/rpm).
    install -d "$pkgdir/opt/$pkgname"
    cp -a desktop/release/linux-unpacked/. "$pkgdir/opt/$pkgname/"
    # Electron's setuid sandbox helper must be root-owned and setuid to launch
    # without --no-sandbox.
    chmod 4755 "$pkgdir/opt/$pkgname/chrome-sandbox"

    # GUI launcher on PATH. executableName=archductor-desktop keeps it distinct
    # from the `archductor` CLI (see desktop/electron-builder.yml).
    install -d "$pkgdir/usr/bin"
    ln -s "/opt/$pkgname/archductor-desktop" "$pkgdir/usr/bin/archductor-desktop"
    # Backwards-compatible alias from the GTK era; also matches `archductor gtk`.
    ln -s "/opt/$pkgname/archductor-desktop" "$pkgdir/usr/bin/archductor-gtk"

    # CLI + daemon on PATH (the GUI also carries its own copies under resources/bin).
    install -Dm755 target/release/archductor "$pkgdir/usr/bin/archductor"
    install -Dm755 target/release/archcar "$pkgdir/usr/bin/archcar"

    # Desktop entry + icon so the GUI shows up in application launchers.
    install -Dm644 packaging/archductor.desktop \
        "$pkgdir/usr/share/applications/archductor.desktop"
    install -Dm644 packaging/assets/archductor.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/archductor.png"

    # Bundled fonts, docs, license.
    install -d "$pkgdir/usr/share/fonts/archductor"
    install -m644 packaging/assets/fonts/*.{ttf,otf,txt} \
        "$pkgdir/usr/share/fonts/archductor/"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
