# Maintainer: Unfinished Works <admin@unfinished-works.com>
# Contributor: Rafael Dominiquini
#
# Source-of-truth PKGBUILD for the `odytty` AUR package. The AUR holds its own
# git repository; this copy is the upstream template. On each release tag the
# `aur` job in .github/workflows/release.yml stamps pkgver, runs `updpkgsums`
# to replace the placeholder checksum with the real release-tarball sha256,
# regenerates `.SRCINFO`, and pushes to the AUR remote — the same pattern the
# `scoop` job uses for the Windows manifest. The manual runbook in
# dist/aur/README.md remains the fallback if the automated push fails.
#
# This builds from the published GitHub release source tarball (the same
# `git archive` tarball the Release workflow attaches), so the package is
# versioned, owned by pacman, and reproducible from a fixed source.
pkgname=odytty
pkgver=0.12.2
pkgrel=1
pkgdesc="GPU-rendered Rust terminal emulator with an Odyssey visual identity"
arch=('x86_64')
url="https://github.com/ghreprimand/odytty"
license=('GPL-3.0-only')
depends=('fontconfig' 'freetype2' 'vulkan-icd-loader' 'libxkbcommon' 'hicolor-icon-theme')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ghreprimand/odytty/releases/download/v$pkgver/odytty-$pkgver.tar.gz")
# Replaced with the real checksum by `updpkgsums` before each AUR publish.
sha256sums=('2f1d9d8c5c6b2be19fdec44bd1df4a66d26f363d3e2f4ec12ffd0a5953d75461')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 target/release/odytty "$pkgdir/usr/bin/odytty"
    install -Dm644 dist/linux/io.unfinished_works.odytty.desktop \
        "$pkgdir/usr/share/applications/io.unfinished_works.odytty.desktop"
    install -Dm644 dist/linux/io.unfinished_works.odytty.metainfo.xml \
        "$pkgdir/usr/share/metainfo/io.unfinished_works.odytty.metainfo.xml"
    install -d "$pkgdir/usr/share/icons"
    cp -a dist/icons/hicolor "$pkgdir/usr/share/icons/"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 docs/install.md "$pkgdir/usr/share/doc/$pkgname/install.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
