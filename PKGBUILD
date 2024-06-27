# Maintainer: Mahor Foruzesh <mahor1221@gmail.com>

pkgname=reddish-shift
_pkgname="$pkgname"
pkgver=0.1.1
_pkgsrc="$_pkgname-$pkgver"
pkgrel=1
pkgdesc="Set color temperature of display according to time of day"
url="https://github.com/mahor1221/reddish-shift"
license=(GPL3)
arch=(x86_64 arm7h aarch64)
depends=(gcc-libs glibc)
makedepends=(cargo)
source=("$_pkgsrc.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('094660f3eb63e997525813ce46e27fd1e2208dce20df3e7f2848859e62d3ef6f')

prepare() {
    cd "$_pkgsrc"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_pkgsrc"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$_pkgsrc"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$_pkgsrc"
    install -vDm755 "target/release/$_pkgname" -t "$pkgdir/usr/bin/"
    install -vDm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"
    install -vDm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname/"
    install -vDm644 CHANGELOG.md -t "$pkgdir/usr/share/doc/$_pkgname/"
    install -vDm644 "target/release/_$_pkgname" \
        "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
    install -vDm644 "target/release/$_pkgname.bash" \
        "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
    install -vDm644 "target/release/$_pkgname.fish" \
        "$pkgdir/usr/share/fish/completions/$_pkgname.fish"
}
