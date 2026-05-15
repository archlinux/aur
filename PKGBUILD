# Maintainer: 5unekku <jimmy.bungalo8@gmail.com>
pkgname=toss-git
pkgver=r.1
pkgrel=1
pkgdesc="XDG-compliant rm replacement that trashes instead of deletes"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/5unekku/toss"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
provides=('toss')
conflicts=('toss-musl-git')
source=("$pkgname::git+https://codeberg.org/5unekku/toss.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname"
    install -Dm755 target/release/toss "$pkgdir/usr/bin/toss"
    install -Dm644 completions/_toss "$pkgdir/usr/share/zsh/site-functions/_toss"
    install -Dm644 completions/toss.fish "$pkgdir/usr/share/fish/vendor_completions.d/toss.fish"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
