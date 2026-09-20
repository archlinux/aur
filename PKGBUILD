# Maintainer: Mathieu Grenet <mathieu@mgth.fr>
#
# harletty-bridge — the format-decoder bridge plugin loaded at runtime by the
# orender engine via dlopen. Installed into the fixed libdir hosts are pointed
# at:
#
#     /usr/lib/orender/libharletty_bridge.so
#
# The engine auto-discovers any `*_bridge.so` sitting next to the host
# executable; for system installs (host in /usr/bin) point it at the plugin
# explicitly, e.g. `render.bridge_path` in ~/.config/omniphony/config.yaml or
# `--ad-orender-bridge-path=/usr/lib/orender/libharletty_bridge.so` in mpv.
#
# The upstream bridge source builds against a few crates from the Omniphony
# workspace via path deps (bridge_api/spdif/sys), so the matching Omniphony
# release source is fetched alongside and exposed under the sibling name its
# Cargo.toml expects.

pkgname=harletty-bridge
pkgver=0.8.0
pkgrel=1
pkgdesc="Format-decoder bridge plugin for the orender engine (loaded via dlopen at runtime)"
arch=('x86_64')
url="https://github.com/harletty/harletty-bridge"
# The bridge's own sources are Apache-2.0, but the library packaged here links
# bridge_api/spdif/sys from Omniphony, which are GPL-3.0-or-later. What ships
# in this package is therefore a combined work under the GPL. (The upstream
# harletty CLI has no such dependency and stays Apache-2.0; it is not part of
# this package.)
license=('GPL-3.0-or-later' 'Apache-2.0')
depends=('gcc-libs')
makedepends=('rust' 'cargo')

# Omniphony tag providing the workspace path-deps (bridge_api/spdif/sys).
_omniver=0.6.0

source=("harletty-bridge-$pkgver.tar.gz::https://github.com/harletty/harletty-bridge/archive/refs/tags/v$pkgver.tar.gz"
        "omniphony-$_omniver.tar.gz::https://github.com/mgth/Omniphony/archive/refs/tags/v$_omniver.tar.gz")
sha256sums=('9865dace51f4d2a763ac522bfba36658f46af590f69c21ff8cbb8d88b07617ee'
            '2fc90db9f979710b4d4275f3da35c13ca7caddef0f0def7d30e06b21cb1ab355')

_bridge="harletty-bridge-$pkgver"

prepare() {
    # The upstream bridge's Cargo.toml references ../Omniphony/omniphony-renderer/*;
    # expose the extracted Omniphony source under that sibling name.
    ln -sfn "Omniphony-$_omniver" "$srcdir/Omniphony"
}

build() {
    cd "$srcdir/$_bridge"
    # Keep $srcdir out of the binary (panic-location paths) for reproducibility.
    export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=src"
    cargo build --release -p harletty-bridge
}

package() {
    cd "$srcdir/$_bridge"

    # Keep the natural cargo artifact name: the engine's plugin discovery
    # matches any `*_bridge.so`, so no rename is needed.
    install -Dm755 target/release/libharletty_bridge.so \
        "$pkgdir/usr/lib/orender/libharletty_bridge.so"

    # Both licences the shipped library is under: Apache-2.0 for the bridge's
    # own sources, GPL-3.0-or-later for the combined work. Their texts are in
    # the system `licenses` package, but a user holding only this .so should
    # not have to go looking — the GPL requires the terms to travel with it.
    if [ -f LICENSE ]; then
        install -Dm644 LICENSE \
            "$pkgdir/usr/share/licenses/$pkgname/LICENSE.Apache-2.0"
    fi
    if [ -f "$srcdir/Omniphony/LICENSE" ]; then
        install -Dm644 "$srcdir/Omniphony/LICENSE" \
            "$pkgdir/usr/share/licenses/$pkgname/LICENSE.GPL-3.0-or-later"
    fi
}
