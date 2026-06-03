# Maintainer: 5unekku <jimmy.bungalo8@gmail.com>
pkgname=arxman-git
pkgver=r4.ba1f8b8
pkgrel=2
pkgdesc='fast archive manager — extract and compress tar, zip, 7z, rar, zst, xz, bz2 and more'
arch=('x86_64' 'aarch64')
url='https://gitlab.com/5unekku/arxman'
license=('GPL-3.0-only')
depends=('bzip2' 'xz' 'zstd')
makedepends=('cargo' 'pkgconf')
optdepends=(
    'p7zip: 7z compression and rar extraction fallback'
    'unrar: rar extraction'
)
provides=('arxman')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export ZSTD_SYS_USE_PKG_CONFIG=1
    cargo build --frozen --release
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 target/release/arx "$pkgdir/usr/bin/arx"

    local bin=target/release/arx
    install -Dm644 <("$bin" --completions bash) "$pkgdir/usr/share/bash-completion/completions/arx"
    install -Dm644 <("$bin" --completions fish) "$pkgdir/usr/share/fish/vendor_completions.d/arx.fish"
    install -Dm644 <("$bin" --completions zsh)  "$pkgdir/usr/share/zsh/site-functions/_arx"
}
