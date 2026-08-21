# Maintainer: Mathieu Grenet <mathieu@mgth.fr>
#
# omniphony-studio — the Omniphony Studio desktop UI (Tauri). Unlike the
# Windows/macOS bundles, this package does NOT embed the renderer as a sidecar:
# it depends on the `orender` package and resolves the system binary at runtime
# (Studio looks next to its own executable — /usr/bin/orender — then falls back
# to `which orender`).
#
# The decoder bridge stays optional (`harletty-bridge`), matching the engine.

pkgname=omniphony-studio
pkgver=0.5.1
pkgrel=1
pkgdesc="Omniphony Studio — control and 3D visualization UI for the orender spatial audio engine"
arch=('x86_64')
url="https://github.com/mgth/Omniphony"
license=('GPL-3.0-only')
depends=('orender' 'webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'librsvg')
optdepends=('harletty-bridge: decode compressed/object-audio formats via the orender bridge plugin')
makedepends=('rust' 'cargo' 'nodejs' 'npm' 'jq')
# !lto: keep makepkg's -flto=auto out of cc-built C deps of the Rust build
# (GCC LTO bitcode is unreadable by the Rust linker; same issue as orender).
options=('!lto')
source=("omniphony-$pkgver.tar.gz::https://github.com/mgth/Omniphony/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8bb07c9b014b5979d6b1420c952b92eebd7f9e133cd6b9734fb010a16583deaa')

_src="Omniphony-$pkgver"
_studio="$_src/omniphony-studio"

prepare() {
    cd "$srcdir/$_studio"
    # Drop the bundled renderer sidecar: `externalBin` only instructs the
    # bundler (Studio spawns orender via std::process::Command, not the Tauri
    # sidecar API), and the sidecar build step is what would otherwise
    # recompile the whole renderer inside this package. The system `orender`
    # from the dependency is picked up at runtime instead.
    # Since 0.4.2 Studio also bundles the engine as a `resources` entry, so it
    # can deploy its own liborender. A distro build must not: the glob points at
    # CI-produced binaries absent from the source tarball (the bundler fails on
    # it), and the system liborender from `orender` is the one to load.
    jq 'del(.bundle.externalBin)
        | del(.bundle.resources["binaries/engine/*"])
        | .build.beforeBuildCommand = "npm run build"' \
        src-tauri/tauri.conf.json > src-tauri/tauri.conf.json.new
    mv src-tauri/tauri.conf.json.new src-tauri/tauri.conf.json
}

build() {
    cd "$srcdir/$_studio"
    # Keep $srcdir out of the binary (panic-location paths) for reproducibility.
    export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=src"
    npm ci
    # deb only: the AppImage bundler is known to fail on Arch (linuxdeploy /
    # strip), and the deb payload is exactly the /usr tree we want to ship.
    npm run tauri -- build --bundles deb
}

package() {
    cd "$srcdir/$_studio"

    # Re-root the Tauri-generated deb payload (binary, .desktop, icons,
    # bundled layouts resources) into $pkgdir.
    local deb
    deb=$(echo src-tauri/target/release/bundle/deb/*.deb)
    bsdtar -xOf "$deb" data.tar.gz | bsdtar -xpf - -C "$pkgdir"

    # The Tauri deb bundler leaves Categories= empty (upstream follow-up:
    # set bundle.category in tauri.conf.json).
    sed -i 's/^Categories=$/Categories=AudioVideo;Audio;/' \
        "$pkgdir/usr/share/applications/Omniphony Studio.desktop"

    # License text (repo-root GPL-3.0-only covers the studio).
    install -Dm644 "$srcdir/$_src/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
