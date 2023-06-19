# Maintainer: Polarian <polarian@polarian.dev>
# Co-maintainer: Lemon <lemon@lemonsh.moe>

_reponame="zdiu"
pkgname="zdiu-git"
pkgver=r3.27e8c52
pkgrel=1
pkgdesc="CLI tool for uploading large files to Discord in parts using webhooks"
arch=("x86_64")
url="https://git.lemonsh.moe/lemon/zdiu"
license=("MIT")
depends=("gtk3" "gcc-libs" "gdk-pixbuf2")
makedepends=("cargo" "git")
source=("$pkgname::git+https://git.lemonsh.moe/lemon/$_reponame"
        $_reponame.desktop)
sha256sums=('SKIP'
            '2418d0fd956afe1498f1b8224d89a3f10e7e07dba52faddbe59fe3b21e6b81b0')
conflicts=('zdiu')
provides=('zdiu')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$pkgname"
    cargo build --frozen --release --all-features
}

package() {
    install -Dm644 -t "$pkgdir/usr/share/licenses/$_reponame/" "$pkgname/LICENSE"
    install -Dm755 "$pkgname/target/release/$_reponame" "$pkgdir/usr/bin/$_reponame"
    install -Dm644 "$_reponame.desktop" -t "$pkgdir/usr/share/applications/"
}
