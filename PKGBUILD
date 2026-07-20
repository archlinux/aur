# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Matus Benko <matus.benko@gmail.com>

pkgname=git-delta-git
pkgver=0.19.2.r3.gf85c46ba
pkgrel=1
pkgdesc="A syntax-highlighting pager for git"
arch=(x86_64 aarch64 i686 armv7h)
url="https://github.com/dandavison/delta"
license=(MIT)
depends=(
    glibc
    libgcc  libgcc_s.so
    libgit2 libgit2.so)
makedepends=(cargo git)
provides=(git-delta)
conflicts=(git-delta)
options=(!lto)
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
    git -C "$pkgname" describe --long --tags | sed 's/-/.r/;s/-/./'
}

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname"
    cargo fetch --locked --target host-tuple
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export LIBGIT2_NO_VENDOR=1
    cd "$pkgname"
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    export LIBGIT2_NO_VENDOR=1
    cd "$pkgname"
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname"
    install -Dm755 target/release/delta -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"

}
