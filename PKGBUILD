# Maintainer: Simon Ser <contact@emersion.fr>

pkgname=forgejo-cli-git
pkgver=v0.3.0.r41.gc66a0a8
pkgrel=1
pkgdesc='CLI application for interacting with Forgejo'
url='https://codeberg.org/forgejo-contrib/forgejo-cli'
license=('Apache-2.0 OR MIT')
makedepends=('cargo')
depends=('openssl')
arch=('x86_64')
source=("git+$url.git")
sha1sums=('SKIP')
conflicts=(forgejo-cli)
provides=(forgejo-cli)
options=(!lto) # ref https://bbs.archlinux.org/viewtopic.php?id=294150

pkgver() {
    git -C forgejo-cli describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd forgejo-cli
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd forgejo-cli
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd forgejo-cli
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd forgejo-cli
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/fj"
    install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/forgejo-cli/LICENSE-APACHE"
    install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/forgejo-cli/LICENSE-MIT"
}
