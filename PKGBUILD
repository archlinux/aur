# Maintainer: Sohimaster
pkgname=traur
pkgver=0.2.5
pkgrel=1
pkgdesc='Trust scoring for AUR packages'
arch=('x86_64')
url='https://github.com/Sohimaster/traur'
license=('MIT')
depends=('git' 'pacman' 'gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7a69447fccd122a14ae541b1e38dca827691019cea222313ef243cf45f8875e9')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 target/release/traur "$pkgdir/usr/bin/traur"
    install -Dm0755 target/release/traur-hook "$pkgdir/usr/bin/traur-hook"
    install -Dm0644 hook/traur.hook "$pkgdir/usr/share/libalpm/hooks/traur.hook"
    install -Dm0644 data/patterns.toml "$pkgdir/usr/share/traur/patterns.toml"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
