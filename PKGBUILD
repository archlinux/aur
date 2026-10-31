# Maintainer: Sohimaster
pkgname=traur
pkgver=0.6.0
pkgrel=1
pkgdesc='Trust scoring for AUR packages'
arch=('x86_64')
url='https://github.com/Sohimaster/traur'
license=('MIT')
depends=('git' 'pacman' 'gcc-libs' 'glibc')
makedepends=('cargo' 'rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('365311e7ab9a778416eaa5242c4686b31298a0017fd4f21dcfefb4d798ebbdb2')

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
    # cargo should already mark these executable; be explicit so a tarball or
    # odd umask cannot produce non-runnable binaries (issue #3).
    chmod +x target/release/traur target/release/traur-hook
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
    install -Dm0644 hook/traur-scan.service "$pkgdir/usr/lib/systemd/system/traur-scan.service"
    install -Dm0644 hook/traur-scan.timer "$pkgdir/usr/lib/systemd/system/traur-scan.timer"
    install -Dm0755 hook/makepkg-wrapper.sh "$pkgdir/usr/share/traur/makepkg-wrapper.sh"
    install -Dm0644 data/patterns.toml "$pkgdir/usr/share/traur/patterns.toml"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
