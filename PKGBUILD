pkgname=traur
pkgver=0.2.0
pkgrel=2
pkgdesc='Trust scoring for AUR packages'
arch=('x86_64')
url='https://github.com/Sohimaster/traur'
license=('MIT')
depends=('git' 'pacman' 'gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f953a444e0a09bfb8cd6ceea7e44eac3b276c7bd12549f01dfbca1dd81c191fb')

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

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/traur "$pkgdir/usr/bin/traur"
    install -Dm755 target/release/traur-hook "$pkgdir/usr/bin/traur-hook"
    install -Dm644 hook/traur.hook "$pkgdir/usr/share/libalpm/hooks/traur.hook"
    install -Dm644 data/patterns.toml "$pkgdir/usr/share/traur/patterns.toml"
}
