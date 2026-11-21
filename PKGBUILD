# Maintainer: Sohimaster
pkgname=traur
pkgver=0.6.3
pkgrel=1
pkgdesc='Trust scoring for AUR packages'
arch=('x86_64')
url='https://github.com/Sohimaster/traur'
license=('MIT')
depends=('git' 'pacman' 'gcc-libs' 'glibc' 'libssl.so' 'libcrypto.so')
makedepends=('cargo' 'rust' 'openssl')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b8ef9a85872a4239f20cbcfba1bfd343e9c2a84a0015de0826bd9cea8f334c23')

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
    install -Dm0644 hook/traur-configure.hook "$pkgdir/usr/share/libalpm/hooks/traur-configure.hook"
    install -Dm0644 hook/configure-pacman-hook.sh "$pkgdir/usr/share/traur/configure-pacman-hook.sh"
    install -Dm0644 hook/traur-scan.service "$pkgdir/usr/lib/systemd/system/traur-scan.service"
    install -Dm0644 hook/traur-scan.timer "$pkgdir/usr/lib/systemd/system/traur-scan.timer"
    install -Dm0755 hook/makepkg-wrapper.sh "$pkgdir/usr/share/traur/makepkg-wrapper.sh"
    install -Dm0644 data/patterns.toml "$pkgdir/usr/share/traur/patterns.toml"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
