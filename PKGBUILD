# Maintainer: jimmy <jimmy.bungalo8@gmail.com>
pkgname=arxman-git
pkgver=r4.ba1f8b8
pkgrel=1
pkgdesc='fast archive manager — extract and compress tar, zip, 7z, rar, zst, xz, bz2 and more'
arch=('x86_64' 'aarch64')
url='https://github.com/jimmy/arxman'
license=('MIT')
depends=('bzip2' 'xz')
makedepends=('cargo')
optdepends=(
    'p7zip: 7z compression and rar extraction fallback'
    'unrar: rar extraction'
)
provides=('arxman')
conflicts=('arxman')
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
    cargo build --frozen --release
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 target/release/arx "$pkgdir/usr/bin/arx"
}
