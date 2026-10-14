# Maintainer: Mathieu Grenet <mathieu@mgth.fr>
#
# harletty-bridge — the format-decoder bridge plugins loaded at runtime by the
# orender engine via dlopen, one library per codec family. Installed into the
# system plugin folder the engine searches:
#
#     /usr/lib/orender/libharletty_dolby_bridge.so
#     /usr/lib/orender/libharletty_dts_bridge.so
#     /usr/lib/orender/libharletty_iamf_bridge.so
#
# With no bridge configured, the engine loads every `*_bridge.so` of the first
# discovery folder that holds a usable one (next to the host executable,
# $ORENDER_BRIDGE_DIR, ~/.local/share/omniphony/lib, then /usr/lib/orender), so
# these are found with no configuration. To name them explicitly, list them in
# `render.bridge_paths` in ~/.config/omniphony/config.yaml, or pass them to mpv
# as a path list: `--ad-orender-bridge-path=/usr/lib/orender/libharletty_dolby_bridge.so:…`.
#
# The package also installs the offline decoder, /usr/bin/harletty (the
# harletty crate of the same workspace, with its `iamf` feature): the command
# line that decodes a stream into a master set, which tools such as omnifrog
# drive.
#
# Up to harletty 0.8.x this package installed one combined library,
# /usr/lib/orender/libharletty_bridge.so. pacman removes it on upgrade, as the
# new version no longer owns it; a config that still names it is read by the
# engine as the family libraries in the same folder (a transition rule of the
# release that introduced them).
#
# The upstream bridge source builds against a few crates from the Omniphony
# workspace via path deps (bridge_api/spdif/sys), so the matching Omniphony
# release source is fetched alongside and exposed under the sibling name its
# Cargo.toml expects.

pkgname=harletty-bridge
# The first harletty release that ships the family plugins (bridge_api 0.6).
pkgver=0.9.0
pkgrel=2
pkgdesc="Format-decoder bridge plugins for the orender engine, one per codec family, and the harletty offline decoder"
arch=('x86_64')
url="https://github.com/harletty/harletty-bridge"
# The bridge's own sources are Apache-2.0, but the libraries packaged here link
# bridge_api/spdif/sys from Omniphony, which are GPL-3.0-or-later. What ships
# in this package is therefore a combined work under the GPL. The harletty
# command line has no such dependency and is Apache-2.0.
license=('GPL-3.0-or-later' 'Apache-2.0')
# opus: the IAMF plugin and harletty's IAMF decoding link the system libopus.
depends=('gcc-libs' 'opus')
# git: reads the Omniphony commit out of its source archive (see build()).
makedepends=('rust' 'cargo' 'git')

# Omniphony tag providing the workspace path-deps (bridge_api/spdif/sys): the
# first one with bridge_api 0.6, which the family plugins are built against.
_omniver=0.7.0

# The codec families, each a cdylib crate named harletty-<family>-bridge whose
# library is libharletty_<family>_bridge.so.
_families=(dolby dts iamf)

source=("harletty-bridge-$pkgver.tar.gz::https://github.com/harletty/harletty-bridge/archive/refs/tags/v$pkgver.tar.gz"
        "omniphony-$_omniver.tar.gz::https://github.com/mgth/Omniphony/archive/refs/tags/v$_omniver.tar.gz")
sha256sums=('a4e40f5a98991bd0c466ac054525756d35e66511084365019aab9f09c05b3b45'
            'ad1a093ddbd83e71ed6182a49009f66b7b5c421efdd25915cc72451c33844f38')

_bridge="harletty-bridge-$pkgver"

prepare() {
    # The upstream bridge's Cargo.toml references ../Omniphony/omniphony-renderer/*;
    # expose the extracted Omniphony source under that sibling name.
    ln -sfn "Omniphony-$_omniver" "$srcdir/Omniphony"

    # harletty names its version after `git describe` (tags matching
    # `[0-9]*`). A source archive has no repository, so git would describe the
    # one makepkg runs in — this AUR clone — and the binary would announce its
    # commit, marked dirty. A repository of the extracted source, tagged with
    # the release, makes it announce the release instead.
    cd "$srcdir/$_bridge"
    git init -q
    git add -A
    git -c user.name=makepkg -c user.email=makepkg@localhost \
        commit -q --no-gpg-sign -m "harletty-bridge $pkgver"
    git tag "$pkgver"
}

build() {
    cd "$srcdir/$_bridge"
    # Keep $srcdir out of the binary (panic-location paths) for reproducibility.
    export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=src"
    # Each library records the Omniphony commit its bridge_api came from and
    # logs it when a host loads it. A source archive has no checkout to ask,
    # but carries the commit of its tag in its header.
    export HARLETTY_OMNIPHONY_COMMIT="$(zcat "$srcdir/omniphony-$_omniver.tar.gz" | git get-tar-commit-id)"
    local packages=()
    local family
    for family in "${_families[@]}"; do
        packages+=(-p "harletty-$family-bridge")
    done
    # --locked: the dependency versions of the release, from its Cargo.lock.
    cargo build --release --locked "${packages[@]}"
    # The offline decoder, on its own: its `iamf` feature is the CLI's.
    cargo build --release --locked -p harletty --features iamf
}

package() {
    cd "$srcdir/$_bridge"

    # Keep the natural cargo artifact names: the engine's plugin discovery
    # matches any `*_bridge.so`, so no rename is needed.
    local family
    for family in "${_families[@]}"; do
        install -Dm755 "target/release/libharletty_${family}_bridge.so" \
            "$pkgdir/usr/lib/orender/libharletty_${family}_bridge.so"
    done

    # The offline decoder.
    install -Dm755 target/release/harletty "$pkgdir/usr/bin/harletty"

    # Both licences the shipped libraries are under: Apache-2.0 for the bridge's
    # own sources, GPL-3.0-or-later for the combined work. Their texts are in
    # the system `licenses` package, but a user holding only these .so should
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
