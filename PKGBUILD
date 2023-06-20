# Maintainer: Polarian <polarian@polarian.dev>
# Co-maintainer: Lemon <lemon@lemonsh.moe>
# Co-maintainer: Karx <yash@karx.xyz>

_reponame="zdiu"
pkgname="zdiu-git"
pkgver=0.1.1.r0.gc56402b
pkgrel=1
pkgdesc="CLI tool for uploading large files to Discord in parts using webhooks"
arch=("x86_64")
url="https://git.karx.xyz/karx/zdiu"
license=("MIT")
depends=("gtk3" "gcc-libs" "gdk-pixbuf2")
makedepends=("cargo" "git")
source=("$pkgname::git+https://git.karx.xyz/karx/$_reponame"
        $_reponame.desktop)
sha256sums=('SKIP'
            'b259282b904509c1ac8ff64e48e972a44d63086ad6fe7c952567a922a79126ed')
conflicts=('zdiu')
provides=('zdiu')

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
    install -Dm644 "$pkgname/zdiu-logo.png" "$pkgdir/usr/share/pixmaps/$_reponame.png"
}
