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
pkgver=0.7.3
pkgrel=1
pkgdesc="Format-decoder bridge plugin for the orender engine (loaded via dlopen at runtime)"
arch=('x86_64')
url="https://github.com/harletty/harletty-bridge"
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('rust' 'cargo')

# Omniphony tag providing the workspace path-deps (bridge_api/spdif/sys).
_omniver=0.4.2

source=("harletty-bridge-$pkgver.tar.gz::https://github.com/harletty/harletty-bridge/archive/refs/tags/v$pkgver.tar.gz"
        "omniphony-$_omniver.tar.gz::https://github.com/mgth/Omniphony/archive/refs/tags/liborender-v$_omniver.tar.gz")
sha256sums=('5c53b2d75e575bf8cb8299d1414925cfd0bb709415d043853c6ba825e88cd78d'
            '103d10f67024e5038cd43fb85a6425a69e4ca17ff548980f82254f7f2005fd58')

_bridge="harletty-bridge-$pkgver"

prepare() {
    # The upstream bridge's Cargo.toml references ../Omniphony/omniphony-renderer/*;
    # expose the extracted Omniphony source under that sibling name.
    ln -sfn "Omniphony-liborender-v$_omniver" "$srcdir/Omniphony"
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

    # Apache-2.0 text is provided by the system `licenses` package; ship the
    # upstream copy too if the checkout has one (avoid creating an empty dir).
    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
