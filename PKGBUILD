# Maintainer: Gabriel Menezes <gabrielsmenezes99@gmail.com>
#
# Source package: builds from the GitHub source tag with the local Rust
# toolchain. The prebuilt counterpart is `ivar-bin` (PKGBUILD-bin), which
# consumes the binaries release-binaries.yml attaches to the same tag.
#
# This file is the source of truth; the AUR repo is a publish target.
# .github/workflows/release-aur.yml rewrites pkgver/pkgrel/sha256sums and
# pushes it. Do not hand-edit those three fields in the AUR checkout.

pkgname=ivar
pkgver=0.8.0
pkgrel=1
pkgdesc="Mount the repos a feature spans into one directory, on one branch, for one agent session"
arch=('x86_64' 'aarch64')
url="https://github.com/mnzsss/ivar"
license=('Apache-2.0')
# git is a runtime dependency, not just a build one: ivar reads through libgit2
# but every mutation shells out to the git binary (docs/adr/0001 §3).
depends=('gcc-libs' 'glibc' 'git')
makedepends=('cargo')
optdepends=(
    'github-cli: authentication and pull requests without exporting a token'
)
conflicts=('ivar-bin')
# !lto: the vendored libgit2 is compiled as C through the `cc` crate, which
#   inherits makepkg's CFLAGS. Feeding GCC LTO objects into the Rust link is a
#   known way to get an obscure link failure, and [profile.release] already
#   sets lto = true for the Rust side.
# !debug: [profile.release] sets strip = true, so there are no symbols for a
#   -debug split package to carry.
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('89876bc8b5ee9b06ec40b444ccc4927cd76e8936ddf862904ca46e8e6e3e6e27')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    # rust-toolchain.toml pins 1.97.1 so a compiler release cannot turn CI red
    # on an unrelated day. That is a CI reproducibility choice, not a floor:
    # the published contract is rust-version in Cargo.toml. Overriding it here
    # is what lets Arch's own rustc build the package, and it is also what the
    # Arch Rust packaging guidelines ask for.
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # Test fixtures force their own identity, but ivar's own commit paths
    # deliberately do not — a commit landing in a user's repository carries
    # that user's authorship, not the tool's. So they inherit the machine's
    # git config, which a build chroot does not have. Without these three
    # lines the suite dies on `empty ident name`.
    export HOME="$srcdir/check-home"
    install -d "$HOME"
    git config --global user.name "ivar package build"
    git config --global user.email "ivar@localhost"
    cargo test --frozen --release
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm0755 target/release/ivar "$pkgdir/usr/bin/ivar"
    install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
