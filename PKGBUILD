# Maintainer: Kolimi contributors <chaitanyachowdary125@live.com>
pkgname=kolimi-server
pkgver=0.1.16
pkgrel=1
pkgdesc="Pure-Rust, single-binary self-hosted cloud: files, WebDAV, CalDAV/CardDAV, sync"
arch=('x86_64' 'aarch64')
url="https://github.com/chaitanyayeleti/kolimi"
license=('AGPL-3.0-or-later')
depends=('glibc' 'gcc-libs')
makedepends=('cargo' 'rust' 'git')
provides=('kolimi')
conflicts=('kolimi-git')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ac393f352ac8fa1393174d11835674225ce7a823d9ba598b7c12b17eb03c3951')

build() {
    cd "kolimi-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    # aws-lc-sys (pulled in by rustls) requires -O0 for its jitterentropy RNG,
    # but Arch's hardened CFLAGS force -O2 afterwards, tripping a compile-time
    # #error. Disable the jitterentropy fallback so the OS RNG is used instead.
    export AWS_LC_SYS_NO_JITTER_ENTROPY=1
    cargo build --release --locked -p kolimi-server -p kolimi-sync
}

check() {
    cd "kolimi-$pkgver"
    export AWS_LC_SYS_NO_JITTER_ENTROPY=1
    # A fast subset: the full workspace suite runs in CI.
    cargo test --release --locked -p kolimi-chunk -p kolimi-crypto -p kolimi-db
}

package() {
    cd "kolimi-$pkgver"
    install -Dm755 target/release/kolimi-server "$pkgdir/usr/bin/kolimi-server"
    install -Dm755 target/release/kolimi-sync "$pkgdir/usr/bin/kolimi-sync"
    install -Dm644 packaging/systemd/kolimi.service "$pkgdir/usr/lib/systemd/system/kolimi.service"
    install -Dm644 packaging/systemd/kolimi.sysusers "$pkgdir/usr/lib/sysusers.d/kolimi.conf"
    install -Dm644 packaging/systemd/kolimi.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/kolimi.conf"
    install -Dm644 packaging/systemd/kolimi.env.example "$pkgdir/etc/kolimi/kolimi.env.example"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
