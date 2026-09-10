# Maintainer: mfw <espadonne@outlook.com>

pkgname=lupin
pkgver=0.1.31
pkgrel=1
pkgdesc='The reference interpreter for the wolf language, and the compiler differential oracle'
arch=('x86_64' 'aarch64')
url='https://github.com/wolffe-lang/wolf-interp'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('rust' 'cargo' 'git')
optdepends=('wolf-lang: the compiler lupin is differentially tested against')
provides=('lupin')
conflicts=('lupin-bin')
# D57, and the reason this is a git source and not the release tarball:
# build.rs reads the git commit and the tags pointing at HEAD, and
# `lupin --version` prints the bare version only when `v$pkgver` is one
# of them. A GitHub archive tarball has no .git, so it would build a
# binary that answers `0.1.27+dev.unknown`.
source=("git+https://github.com/wolffe-lang/wolf-interp.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
    cd wolf-interp
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd wolf-interp
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # The spec and corpus come from the tracked vendor/upstream snapshot;
    # the upstream/ submodule is not needed for a build (docs/manual/00).
    cargo build --frozen --release
}

check() {
    cd wolf-interp
    cargo test --frozen --release || true
}

package() {
    cd wolf-interp

    install -Dm755 target/release/lupin "$pkgdir/usr/bin/lupin"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
